import cocotb
from cocotb.triggers import RisingEdge, FallingEdge, Timer

class BusInterface:
    """Base class for bus interfaces."""
    def __init__(self, dut, clk_name, rst_name):
        self.dut = dut
        self.clk = getattr(dut, clk_name)
        self.rst = getattr(dut, rst_name)

    async def reset(self):
        self.rst.value = 0
        await Timer(100, units="ns")
        self.rst.value = 1
        await Timer(100, units="ns")

class AXI4Lite_Interface(BusInterface):
    def __init__(self, dut):
        super().__init__(dut, "s_axi_aclk", "s_axi_aresetn")

    async def write(self, addr, data):
        self.dut.s_axi_awaddr.value = addr
        self.dut.s_axi_awvalid.value = 1
        self.dut.s_axi_wdata.value = data
        self.dut.s_axi_wstrb.value = 0xF
        self.dut.s_axi_wvalid.value = 1
        self.dut.s_axi_bready.value = 1

        while not (self.dut.s_axi_awready.value and self.dut.s_axi_wready.value):
            await RisingEdge(self.clk)
        
        await RisingEdge(self.clk)
        self.dut.s_axi_awvalid.value = 0
        self.dut.s_axi_wvalid.value = 0
        
        while not self.dut.s_axi_bvalid.value:
            await RisingEdge(self.clk)
        await RisingEdge(self.clk)
        self.dut.s_axi_bready.value = 0

    async def read(self, addr):
        self.dut.s_axi_araddr.value = addr
        self.dut.s_axi_arvalid.value = 1
        self.dut.s_axi_rready.value = 1

        while not self.dut.s_axi_arready.value:
            await RisingEdge(self.clk)
        
        await RisingEdge(self.clk)
        self.dut.s_axi_arvalid.value = 0

        while not self.dut.s_axi_rvalid.value:
            await RisingEdge(self.clk)
        
        data = self.dut.s_axi_rdata.value.integer
        await RisingEdge(self.clk)
        self.dut.s_axi_rready.value = 0
        return data

class APB_Interface(BusInterface):
    def __init__(self, dut):
        super().__init__(dut, "pclk", "presetn")

    async def write(self, addr, data):
        self.dut.psel.value = 1
        self.dut.paddr.value = addr
        self.dut.pwrite.value = 1
        self.dut.pwdata.value = data
        self.dut.pstrb.value = 0xF
        await RisingEdge(self.clk)
        self.dut.penable.value = 1
        
        while not self.dut.pready.value:
            await RisingEdge(self.clk)
        
        await RisingEdge(self.clk)
        self.dut.psel.value = 0
        self.dut.penable.value = 0

    async def read(self, addr):
        self.dut.psel.value = 1
        self.dut.paddr.value = addr
        self.dut.pwrite.value = 0
        await RisingEdge(self.clk)
        self.dut.penable.value = 1
        
        while not self.dut.pready.value:
            await RisingEdge(self.clk)
        
        data = self.dut.prdata.value.integer
        await RisingEdge(self.clk)
        self.dut.psel.value = 0
        self.dut.penable.value = 0
        return data

class Wishbone_Interface(BusInterface):
    def __init__(self, dut):
        # Wishbone in this project uses active-high reset in wrapper ports usually
        # but the wrapper we saw uses wb_rst_i. 
        super().__init__(dut, "wb_clk_i", "wb_rst_i")

    async def reset(self):
        self.rst.value = 1 # Active High
        await Timer(100, units="ns")
        self.rst.value = 0
        await Timer(100, units="ns")

    async def write(self, addr, data):
        self.dut.wb_adr_i.value = addr
        self.dut.wb_dat_i.value = data
        self.dut.wb_we_i.value = 1
        self.dut.wb_sel_i.value = 0xF
        self.dut.wb_stb_i.value = 1
        self.dut.wb_cyc_i.value = 1
        
        while not self.dut.wb_ack_o.value:
            await RisingEdge(self.clk)
        
        await RisingEdge(self.clk)
        self.dut.wb_stb_i.value = 0
        self.dut.wb_cyc_i.value = 0

    async def read(self, addr):
        self.dut.wb_adr_i.value = addr
        self.dut.wb_we_i.value = 0
        self.dut.wb_sel_i.value = 0xF
        self.dut.wb_stb_i.value = 1
        self.dut.wb_cyc_i.value = 1
        
        while not self.dut.wb_ack_o.value:
            await RisingEdge(self.clk)
        
        data = self.dut.wb_dat_o.value.integer
        await RisingEdge(self.clk)
        self.dut.wb_stb_i.value = 0
        self.dut.wb_cyc_i.value = 0
        return data
