import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer, ReadOnly

class APBTester:
    def __init__(self, dut):
        self.dut = dut
        self.log = dut._log
        self.pclk = dut.pclk
        self.presetn = dut.presetn
        
        # APB Signals
        self.paddr = dut.paddr
        self.psel = dut.psel
        self.penable = dut.penable
        self.pwrite = dut.pwrite
        self.pwdata = dut.pwdata
        self.prdata = dut.prdata
        self.pready = dut.pready
        self.pslverr = dut.pslverr

        # Addresses
        self.ADDR_DATA    = 0x0
        self.ADDR_STATUS  = 0x4
        self.ADDR_CONTROL = 0x8
        self.ADDR_MAX_LEVEL = 0xC

    async def reset(self):
        self.presetn.value = 0
        self.paddr.value = 0
        self.psel.value = 0
        self.penable.value = 0
        self.pwrite.value = 0
        self.pwdata.value = 0
        await Timer(100, unit='ns')
        self.presetn.value = 1
        await RisingEdge(self.pclk)

    async def write(self, addr, data):
        """APB Write Transaction"""
        await RisingEdge(self.pclk)
        self.paddr.value = addr
        self.psel.value = 1
        self.pwrite.value = 1
        self.pwdata.value = data
        self.penable.value = 0
        
        await RisingEdge(self.pclk)
        self.penable.value = 1
        
        # Wait for pready (Generic APB is 0-wait usually in this design, but good practice)
        while not self.pready.value:
            await RisingEdge(self.pclk)
            
        await RisingEdge(self.pclk)
        self.psel.value = 0
        self.penable.value = 0
        self.pwrite.value = 0

    async def read(self, addr):
        """APB Read Transaction"""
        await RisingEdge(self.pclk)
        self.paddr.value = addr
        self.psel.value = 1
        self.pwrite.value = 0
        self.penable.value = 0
        
        await RisingEdge(self.pclk)
        self.penable.value = 1
        
        while not self.pready.value:
            await RisingEdge(self.pclk)
            
        data = int(self.prdata.value)
        await RisingEdge(self.pclk)
        self.psel.value = 0
        self.penable.value = 0
        return data

@cocotb.test()
async def test_fifo_apb_basic(dut):
    """Basic APB FIFO Test: Push, Pop, Status"""
    
    # Clock
    cocotb.start_soon(Clock(dut.pclk, 10, unit="ns").start())
    
    tester = APBTester(dut)
    await tester.reset()
    
    dut._log.info("Test 1:Check Empty Status")
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
    
    dut._log.info("APB Basic Test Passed!")

@cocotb.test()
async def test_fifo_apb_flush(dut):
    """Test Flush via Control Register"""
    cocotb.start_soon(Clock(dut.pclk, 10, unit="ns").start())
    tester = APBTester(dut)
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

