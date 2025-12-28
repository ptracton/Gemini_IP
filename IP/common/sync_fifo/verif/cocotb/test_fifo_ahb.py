import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer

class AHBLiteTester:
    def __init__(self, dut):
        self.dut = dut
        self.log = dut._log
        self.clk = dut.hclk
        self.resetn = dut.hresetn
        
        # AHB-Lite Signal Aliases
        self.hsel = dut.hsel
        self.haddr = dut.haddr
        self.htrans = dut.htrans
        self.hwrite = dut.hwrite
        self.hsize = dut.hsize
        self.hburst = dut.hburst
        self.hprot = dut.hprot
        self.hwdata = dut.hwdata
        self.hready_i = dut.hready_i
        self.hready_o = dut.hready_o
        self.hresp = dut.hresp
        self.hrdata = dut.hrdata

        # Addresses
        self.ADDR_DATA    = 0x0
        self.ADDR_STATUS  = 0x4
        self.ADDR_CONTROL = 0x8
        self.ADDR_MAX_LEVEL = 0xC

    async def reset(self):
        self.resetn.value = 0
        self.hsel.value = 0
        self.haddr.value = 0
        self.htrans.value = 0
        self.hwrite.value = 0
        self.hsize.value = 0
        self.hburst.value = 0
        self.hprot.value = 0
        self.hwdata.value = 0
        self.hready_i.value = 1
        
        await Timer(100, unit='ns')
        self.resetn.value = 1
        await RisingEdge(self.clk)

    async def write(self, addr, data):
        """AHB-Lite Write Transaction"""
        await RisingEdge(self.clk)
        
        # Address Phase (Cycle 1)
        self.hsel.value = 1
        self.haddr.value = addr
        self.htrans.value = 2 # NONSEQ
        self.hwrite.value = 1
        self.hsize.value = 2 # 32-bit
        
        await RisingEdge(self.clk)
        # Data Phase (Cycle 2)
        self.hsel.value = 0
        self.htrans.value = 0 # IDLE
        self.hwdata.value = data
        
        while not (self.hready_o.value and self.hready_i.value):
            await RisingEdge(self.clk)
            
        await RisingEdge(self.clk)

    async def read(self, addr):
        """AHB-Lite Read Transaction"""
        await RisingEdge(self.clk)
        
        # Address Phase (Cycle 1)
        self.hsel.value = 1
        self.haddr.value = addr
        self.htrans.value = 2 # NONSEQ
        self.hwrite.value = 0
        self.hsize.value = 2 # 32-bit
        
        await RisingEdge(self.clk)
        # Data Phase (Cycle 2)
        self.hsel.value = 0
        self.htrans.value = 0 # IDLE
        
        while not (self.hready_o.value and self.hready_i.value):
            await RisingEdge(self.clk)
            
        from cocotb.triggers import ReadOnly
        await ReadOnly()
        data = int(self.hrdata.value)
        await RisingEdge(self.clk)
        return data

@cocotb.test()
async def test_fifo_ahb_basic(dut):
    """Basic AHB FIFO Test: Push, Pop, Status"""
    
    # Clock
    cocotb.start_soon(Clock(dut.hclk, 10, unit="ns").start())
    
    tester = AHBLiteTester(dut)
    await tester.reset()
    
    dut._log.info("Test 1: Check Empty Status")
    status = await tester.read(tester.ADDR_STATUS)
    assert status & 0x1, "Status bit 0 (Empty) should be set"
    
    dut._log.info("Test 2: Push Data")
    data_pattern = [0xAA, 0x55, 0x12, 0x34]
    for d in data_pattern:
        await tester.write(tester.ADDR_DATA, d)
        
    dut._log.info("Test 3: Check Level")
    status = await tester.read(tester.ADDR_STATUS)
    level = (status >> 16) & 0xFFFF
    assert level == 4, f"Level should be 4, got {level}"
    assert not (status & 0x1), "Status bit 0 (Empty) should be cleared"

    dut._log.info("Test 4: Pop Data")
    for expected in data_pattern:
        val = await tester.read(tester.ADDR_DATA)
        assert val == expected, f"Expected {expected}, got {val}"
        
    dut._log.info("Test 5: Check Empty Again")
    status = await tester.read(tester.ADDR_STATUS)
    assert status & 0x1, "Status bit 0 (Empty) should be set after popping all"
    
    dut._log.info("AHB Basic Test Passed!")

@cocotb.test()
async def test_fifo_ahb_flush(dut):
    """Test Flush via Control Register"""
    cocotb.start_soon(Clock(dut.hclk, 10, unit="ns").start())
    tester = AHBLiteTester(dut)
    await tester.reset()
    
    # Push some data
    await tester.write(tester.ADDR_DATA, 0xDEADBEEF)
    await tester.write(tester.ADDR_DATA, 0xCAFEBABE)
    
    status = await tester.read(tester.ADDR_STATUS)
    assert not (status & 0x1), "Not empty"
    
    # Flush (Control Bit 0)
    await tester.write(tester.ADDR_CONTROL, 0x1)
    
    status = await tester.read(tester.ADDR_STATUS)
    assert status & 0x1, "Empty should be set after flush"
    level = (status >> 16) & 0xFFFF
    assert level == 0, f"Level should be 0, got {level}"
