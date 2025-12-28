import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer, ReadOnly

class WishboneTester:
    def __init__(self, dut):
        self.dut = dut
        self.log = dut._log
        self.clk = dut.wb_clk_i
        self.reset = dut.wb_rst_i
        
        # Wishbone Signal Aliases
        self.adr = dut.wb_adr_i
        self.dat_i = dut.wb_dat_i
        self.dat_o = dut.wb_dat_o
        self.we = dut.wb_we_i
        self.stb = dut.wb_stb_i
        self.cyc = dut.wb_cyc_i
        self.sel = dut.wb_sel_i
        self.ack = dut.wb_ack_o

        # Addresses
        self.ADDR_DATA    = 0x0
        self.ADDR_STATUS  = 0x4
        self.ADDR_CONTROL = 0x8
        self.ADDR_MAX_LEVEL = 0xC

    async def reset_dut(self):
        self.reset.value = 1
        self.adr.value = 0
        self.dat_i.value = 0
        self.we.value = 0
        self.stb.value = 0
        self.cyc.value = 0
        self.sel.value = 0
        
        await Timer(100, unit='ns')
        self.reset.value = 0
        await RisingEdge(self.clk)

    async def write(self, addr, data):
        """Wishbone Write Transaction"""
        await RisingEdge(self.clk)
        
        self.adr.value = addr
        self.dat_i.value = data
        self.we.value = 1
        self.stb.value = 1
        self.cyc.value = 1
        self.sel.value = 0xF
        
        while not self.ack.value:
            await RisingEdge(self.clk)
            
        # Ack received
        await RisingEdge(self.clk)
        self.stb.value = 0
        self.cyc.value = 0
        self.we.value = 0
        
        while self.ack.value:
            await RisingEdge(self.clk)

    async def read(self, addr):
        """Wishbone Read Transaction"""
        await RisingEdge(self.clk)
        
        # Ensure Ack is low before starting
        while self.ack.value:
            await RisingEdge(self.clk)
        
        self.adr.value = addr
        self.we.value = 0
        self.stb.value = 1
        self.cyc.value = 1
        self.sel.value = 0xF
        
        while not self.ack.value:
            await RisingEdge(self.clk)
            
        # Capture Data
        await ReadOnly()
        await Timer(1, 'ns') # Force delay to allow data propagation
        data = int(self.dat_o.value)
        self.dut._log.info(f"WB Read Addr={hex(addr)} Data={hex(data)}")
        
        # Ack received
        await RisingEdge(self.clk)
        self.stb.value = 0
        self.cyc.value = 0
        
        while self.ack.value:
            await RisingEdge(self.clk)
        
        return data

@cocotb.test()
async def test_fifo_wb_basic(dut):
    """Basic Wishbone FIFO Test: Push, Pop, Status"""
    
    # Clock
    cocotb.start_soon(Clock(dut.wb_clk_i, 10, unit="ns").start())
    
    tester = WishboneTester(dut)
    await tester.reset_dut()
    
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
    
    dut._log.info("Wishbone Basic Test Passed!")

@cocotb.test()
async def test_fifo_wb_flush(dut):
    """Test Flush via Control Register"""
    cocotb.start_soon(Clock(dut.wb_clk_i, 10, unit="ns").start())
    tester = WishboneTester(dut)
    await tester.reset_dut()
    
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
