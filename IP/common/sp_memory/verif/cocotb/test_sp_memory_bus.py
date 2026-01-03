
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer, ReadOnly
import random

class BusDriver:
    def __init__(self, dut, bus_type, width):
        self.dut = dut
        self.bus_type = bus_type.lower()
        self.width = width
        self.log = dut._log

    async def reset(self):
        if self.bus_type == "axi":
            self.dut.aresetn.value = 0
            self.dut.awvalid.value = 0
            self.dut.awaddr.value = 0
            self.dut.awlen.value = 0
            self.dut.awsize.value = 0
            self.dut.awburst.value = 0
            self.dut.awprot.value = 0
            
            self.dut.wvalid.value = 0
            self.dut.wdata.value = 0
            self.dut.wstrb.value = 0
            self.dut.wlast.value = 0
            
            self.dut.bready.value = 0
            
            self.dut.arvalid.value = 0
            self.dut.araddr.value = 0
            self.dut.arlen.value = 0
            self.dut.arsize.value = 0
            self.dut.arburst.value = 0
            self.dut.arprot.value = 0
            
            self.dut.rready.value = 0
            
            await RisingEdge(self.dut.aclk)
            self.dut.aresetn.value = 1
        elif self.bus_type == "apb":
            self.dut.presetn.value = 0
            self.dut.psel.value = 0
            self.dut.penable.value = 0
            self.dut.paddr.value = 0
            self.dut.pwrite.value = 0
            self.dut.pwdata.value = 0
            self.dut.pstrb.value = 0
            self.dut.pprot.value = 0
            await RisingEdge(self.dut.pclk)
            self.dut.presetn.value = 1
        elif self.bus_type == "wb":
            self.dut.wb_rst_i.value = 1 
            self.dut.wb_cyc_i.value = 0
            self.dut.wb_stb_i.value = 0
            self.dut.wb_we_i.value = 0
            self.dut.wb_adr_i.value = 0
            self.dut.wb_dat_i.value = 0
            self.dut.wb_sel_i.value = 0
            await RisingEdge(self.dut.wb_clk_i)
            self.dut.wb_rst_i.value = 0
        elif self.bus_type == "ahb":
            self.dut.hresetn.value = 0
            self.dut.hsel.value = 0
            self.dut.htrans.value = 0 # IDLE
            self.dut.hwrite.value = 0
            self.dut.haddr.value = 0
            self.dut.hwdata.value = 0
            self.dut.hsize.value = 0
            self.dut.hburst.value = 0
            self.dut.hprot.value = 0
            self.dut.hready.value = 1
            await RisingEdge(self.dut.hclk)
            self.dut.hresetn.value = 1

    async def write(self, addr, data):
        clk = self._get_clk()
        await RisingEdge(clk)
        
        if self.bus_type == "axi":
            # Simple AXI Write
            self.dut.awaddr.value = addr
            self.dut.awvalid.value = 1
            self.dut.wdata.value = data
            self.dut.wstrb.value = (1 << (self.width // 8)) - 1
            self.dut.wvalid.value = 1
            
            # Wait for acceptance
            aw_done = False
            w_done = False
            
            while not (aw_done and w_done):
                await RisingEdge(clk)
                if self.dut.awready.value: aw_done = True
                if self.dut.wready.value: w_done = True

            self.dut.awvalid.value = 0
            self.dut.wvalid.value = 0
            
            self.dut.bready.value = 1
            # Wait for BVALID
            while not self.dut.bvalid.value:
                await RisingEdge(clk)
            self.dut.bready.value = 0

        elif self.bus_type == "apb":
            # Setup Phase
            self.dut.paddr.value = addr
            self.dut.psel.value = 1
            self.dut.pwrite.value = 1
            self.dut.pwdata.value = data
            self.dut.pstrb.value = (1 << (self.width // 8)) - 1
            self.dut.penable.value = 0
            await RisingEdge(clk)
            
            # Access Phase
            self.dut.penable.value = 1
            await RisingEdge(clk)
            while not self.dut.pready.value:
                await RisingEdge(clk)
                
            self.dut.psel.value = 0
            self.dut.penable.value = 0

        elif self.bus_type == "wb":
            self.dut.wb_adr_i.value = addr
            self.dut.wb_dat_i.value = data
            self.dut.wb_sel_i.value = (1 << (self.width // 8)) - 1
            self.dut.wb_we_i.value = 1
            self.dut.wb_cyc_i.value = 1
            self.dut.wb_stb_i.value = 1
            
            await RisingEdge(clk)
            while not self.dut.wb_ack_o.value:
                await RisingEdge(clk)
                
            self.dut.wb_cyc_i.value = 0
            self.dut.wb_stb_i.value = 0
            
        elif self.bus_type == "ahb":
            # Address Phase
            self.dut.hsel.value = 1
            self.dut.htrans.value = 2 # NONSEQ
            self.dut.hwrite.value = 1
            self.dut.haddr.value = addr
            self.dut.hsize.value = 2 # Word (Simplified)
            await RisingEdge(clk)
            
            # Data Phase
            self.dut.htrans.value = 0 # IDLE
            self.dut.hwdata.value = data
            while not self.dut.hreadyout.value:
                await RisingEdge(clk)
            
            self.dut.hsel.value = 0

    async def read(self, addr):
        clk = self._get_clk()
        await RisingEdge(clk)
        
        if self.bus_type == "axi":
             # Read Address
            self.dut.araddr.value = addr
            self.dut.arvalid.value = 1
            await RisingEdge(clk)
            while not self.dut.arready.value:
                await RisingEdge(clk)
            self.dut.arvalid.value = 0
            
            self.dut.rready.value = 1
            # Read Data
            while not self.dut.rvalid.value:
                await RisingEdge(clk)
            val = int(self.dut.rdata.value)
            self.dut.rready.value = 0
            return val

        elif self.bus_type == "apb":
            # Setup
            self.dut.paddr.value = addr
            self.dut.psel.value = 1
            self.dut.pwrite.value = 0
            self.dut.penable.value = 0
            await RisingEdge(clk)
            
            # Access
            self.dut.penable.value = 1
            await RisingEdge(clk)
            while not self.dut.pready.value:
                await RisingEdge(clk)
            
            val = int(self.dut.prdata.value)
            self.dut.psel.value = 0
            self.dut.penable.value = 0
            return val

        elif self.bus_type == "wb":
            self.dut.wb_adr_i.value = addr
            self.dut.wb_we_i.value = 0
            self.dut.wb_cyc_i.value = 1
            self.dut.wb_stb_i.value = 1
            await RisingEdge(clk)
            
            while not self.dut.wb_ack_o.value:
                await RisingEdge(clk)
                
            val = int(self.dut.wb_dat_o.value)
            self.dut.wb_cyc_i.value = 0
            self.dut.wb_stb_i.value = 0
            return val

        elif self.bus_type == "ahb":
            # Address Phase
            self.dut.hsel.value = 1
            self.dut.htrans.value = 2
            self.dut.hwrite.value = 0
            self.dut.haddr.value = addr
            await RisingEdge(clk)
            
            # Data Phase
            self.dut.htrans.value = 0
            
            await RisingEdge(clk)
            
            while not self.dut.hreadyout.value:
                await RisingEdge(clk)
            
            while not self.dut.hreadyout.value:
                await RisingEdge(clk)
                
            # Sample Data at end of data phase
            val = int(self.dut.hrdata.value)
            self.dut.hsel.value = 0
            return val

    def _get_clk(self):
        if self.bus_type == "axi": return self.dut.aclk
        if self.bus_type == "apb": return self.dut.pclk
        if self.bus_type == "wb": return self.dut.wb_clk_i
        if self.bus_type == "ahb": return self.dut.hclk
        return self.dut.clk

@cocotb.test()
async def test_bus_rw(dut):
    """
    Generic Bus Read/Write Test
    Determines BUS_TYPE from environment or probing signals.
    """
    # Detect Bus Type by checking signal existence
    bus_type = "core"
    
    # Use hasattr to check for signal existence on the DUT handle
    if hasattr(dut, "aclk"): 
        bus_type = "axi"
    elif hasattr(dut, "pclk"): 
        bus_type = "apb"
    elif hasattr(dut, "wb_clk_i"): 
        bus_type = "wb"
    elif hasattr(dut, "hclk"): 
        bus_type = "ahb"
                     
    dut._log.info(f"Detected Bus Type: {bus_type}")
    
    # Core test handled by test_sp_memory.py usually, but if this is running...
    if bus_type == "core":
        return # Skip
        
    width = int(dut.WIDTH.value)
    driver = BusDriver(dut, bus_type, width)
    
    # Start Clock
    clk = driver._get_clk()
    clock = Clock(clk, 10, unit="ns")
    cocotb.start_soon(clock.start())
    
    await driver.reset()
    
    # Basic RW Test
    for i in range(10):
        addr = random.randint(0, 64) * 4 # Aligned
        data = random.randint(0, (1 << width) - 1)
        
        await driver.write(addr, data)
        read_val = await driver.read(addr)
        
        if read_val != data:
            assert read_val == data, f"{bus_type.upper()} Mismatch at 0x{addr:x}: Exp 0x{data:x}, Got 0x{read_val:x}"
            
    dut._log.info(f"{bus_type.upper()} Bus Test Passed")
