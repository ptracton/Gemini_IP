import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer, ReadOnly

class AXILiteTester:
    def __init__(self, dut):
        self.dut = dut
        self.log = dut._log
        self.clk = dut.aclk
        self.resetn = dut.aresetn
        
        # AXI4-Lite Signal Aliases
        self.awaddr = dut.s_axi_awaddr
        self.awvalid = dut.s_axi_awvalid
        self.awready = dut.s_axi_awready
        
        self.wdata = dut.s_axi_wdata
        self.wstrb = dut.s_axi_wstrb
        self.wvalid = dut.s_axi_wvalid
        self.wready = dut.s_axi_wready
        
        self.bresp = dut.s_axi_bresp
        self.bvalid = dut.s_axi_bvalid
        self.bready = dut.s_axi_bready
        
        self.araddr = dut.s_axi_araddr
        self.arvalid = dut.s_axi_arvalid
        self.arready = dut.s_axi_arready
        
        self.rdata = dut.s_axi_rdata
        self.rresp = dut.s_axi_rresp
        self.rvalid = dut.s_axi_rvalid
        self.rready = dut.s_axi_rready

        # Addresses
        self.ADDR_DATA    = 0x0
        self.ADDR_STATUS  = 0x4
        self.ADDR_CONTROL = 0x8
        self.ADDR_MAX_LEVEL = 0xC

    async def reset(self):
        self.resetn.value = 0
        self.awaddr.value = 0
        self.awvalid.value = 0
        self.wdata.value = 0
        self.wstrb.value = 0
        self.wvalid.value = 0
        self.bready.value = 0
        self.araddr.value = 0
        self.arvalid.value = 0
        self.rready.value = 0
        
        await Timer(100, unit='ns')
        self.resetn.value = 1
        await RisingEdge(self.clk)

    async def write(self, addr, data):
        """AXI4-Lite Write Transaction"""
        await RisingEdge(self.clk)
        
        # Assert Address and Data
        self.awaddr.value = addr
        self.awvalid.value = 1
        self.wdata.value = data
        self.wstrb.value = 0xF
        self.wvalid.value = 1
        self.bready.value = 1 
        
        # Wait for Ready Handshakes
        aw_done = False
        w_done = False
        
        while not (aw_done and w_done):
            # Check if ready
            if not aw_done and self.awready.value:
                aw_done = True
            if not w_done and self.wready.value:
                w_done = True
            
            # If done, deassert valid in next cycle (using non-blocking logic via loop)
            # Actually simplier: We wait for ready, then deassert valid.
            # But we must hold valid until ready.
            
            await RisingEdge(self.clk)
            if aw_done: self.awvalid.value = 0
            if w_done: self.wvalid.value = 0

        # Wait for Response
        while not self.bvalid.value:
            await RisingEdge(self.clk)
            
        # Check Response (00 = OKAY)
        resp = self.bresp.value
        # assert resp == 0, f"Write Error: BRESP={resp}"
        
        self.bready.value = 0
        await RisingEdge(self.clk)

    async def read(self, addr):
        """AXI4-Lite Read Transaction"""
        await RisingEdge(self.clk)
        
        # Address Phase
        self.araddr.value = addr
        self.arvalid.value = 1
        self.rready.value = 1 
        
        while not self.arready.value:
            await RisingEdge(self.clk)
            
        # Address Accepted
        await RisingEdge(self.clk)
        self.arvalid.value = 0
        
        # Data Phase
        while not self.rvalid.value:
            await RisingEdge(self.clk)
            
        data = int(self.rdata.value)
        resp = self.rresp.value
        # assert resp == 0, f"Read Error: RRESP={resp}"
        
        await RisingEdge(self.clk)
        self.rready.value = 0
        await RisingEdge(self.clk) # Extra delay for stability
        return data

@cocotb.test()
async def test_fifo_axi_basic(dut):
    """Basic AXI FIFO Test: Push, Pop, Status"""
    
    # Clock
    cocotb.start_soon(Clock(dut.aclk, 10, unit="ns").start())
    
    tester = AXILiteTester(dut)
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
    
    dut._log.info("AXI Basic Test Passed!")

@cocotb.test()
async def test_fifo_axi_flush(dut):
    """Test Flush via Control Register"""
    cocotb.start_soon(Clock(dut.aclk, 10, unit="ns").start())
    tester = AXILiteTester(dut)
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
