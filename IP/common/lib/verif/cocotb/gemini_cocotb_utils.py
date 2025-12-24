#-------------------------------------------------------------------------------
# File: gemini_cocotb_utils.py
# Description: Shared Cocotb utilities and Bus Testers for Gemini IP.
#
# Author: Gemini-3 AI
# License: MIT
#-------------------------------------------------------------------------------

import cocotb
from cocotb.triggers import Timer, RisingEdge, FallingEdge

def safe_to_int(handle):
    """Safely convert a handle value to integer, treating X/Z/U/W as 0."""
    try:
        # Try direct conversion if it's 0 or 1
        return int(handle.value)
    except (ValueError, TypeError, AttributeError):
        # Fallback for LogicArray or Logic with X/Z/U
        try:
            s = str(handle.value).lower()
            # Remove any non-binary characters for integer conversion
            clean = "".join(['1' if c == '1' else '0' for c in s])
            if not clean:
                return 0
            return int(clean, 2)
        except:
            return 0

class GeminiTester:
    """
    Base class for Gemini IP Testbenches.
    Provides standardized bus access methods for AXI, APB, and Wishbone.
    """
    def __init__(self, dut, bus_type="AXI"):
        self.dut = dut
        self.bus_type = bus_type
        self.log = dut._log

    async def write_reg(self, addr, data):
        """Dispatch write to the appropriate bus driver."""
        if self.bus_type == "AXI":
            await self._write_axi(addr, data)
        elif self.bus_type == "APB":
            await self._write_apb(addr, data)
        elif self.bus_type == "WB":
            await self._write_wb(addr, data)
        else:
            raise ValueError(f"Unsupported bus_type: {self.bus_type}")

    async def read_reg(self, addr):
        """Dispatch read to the appropriate bus driver."""
        if self.bus_type == "AXI":
            return await self._read_axi(addr)
        elif self.bus_type == "APB":
            return await self._read_apb(addr)
        elif self.bus_type == "WB":
            return await self._read_wb(addr)
        else:
            raise ValueError(f"Unsupported bus_type: {self.bus_type}")

    # --- AXI Helpers ---
    async def _write_axi(self, addr, data):
        # Handle signal naming differences if any (standardizing on s_axi_*)
        # Some testbenches might use 's_axi_awaddr' others 'awaddr'.
        # We try to detect standard prefixes.
        
        # Helper to get signal, trying s_axi_ prefix first, then raw
        def get_sig(name):
            if hasattr(self.dut, f"s_axi_{name}"): return getattr(self.dut, f"s_axi_{name}")
            if hasattr(self.dut, name): return getattr(self.dut, name)
            raise AttributeError(f"Signal {name} not found on DUT")

        awaddr  = get_sig("awaddr")
        wdata   = get_sig("wdata")
        awvalid = get_sig("awvalid")
        wvalid  = get_sig("wvalid")
        wstrb   = get_sig("wstrb")
        aclk    = get_sig("aclk")
        awready = get_sig("awready")
        wready  = get_sig("wready")
        bvalid  = get_sig("bvalid")
        bready  = get_sig("bready")

        awaddr.value = addr
        wdata.value = data
        awvalid.value = 1
        wvalid.value = 1
        wstrb.value = 0xF
        
        await RisingEdge(aclk)
        while not (safe_to_int(awready) and safe_to_int(wready)):
            await RisingEdge(aclk)
            
        awvalid.value = 0
        wvalid.value = 0
        
        while not safe_to_int(bvalid):
            await RisingEdge(aclk)
            
        bready.value = 1
        await RisingEdge(aclk)
        bready.value = 0

    async def _read_axi(self, addr):
        def get_sig(name):
            if hasattr(self.dut, f"s_axi_{name}"): return getattr(self.dut, f"s_axi_{name}")
            if hasattr(self.dut, name): return getattr(self.dut, name)
            raise AttributeError(f"Signal {name} not found on DUT")

        araddr  = get_sig("araddr")
        arvalid = get_sig("arvalid")
        aclk    = get_sig("aclk")
        arready = get_sig("arready")
        rvalid  = get_sig("rvalid")
        rdata   = get_sig("rdata")
        rready  = get_sig("rready")

        araddr.value = addr
        arvalid.value = 1
        await RisingEdge(aclk)
        while not safe_to_int(arready):
            await RisingEdge(aclk)
        arvalid.value = 0
        
        while not safe_to_int(rvalid):
            await RisingEdge(aclk)
            
        data = safe_to_int(rdata)
        rready.value = 1
        await RisingEdge(aclk)
        rready.value = 0
        return data

    # --- APB Helpers ---
    async def _write_apb(self, addr, data):
        self.dut.paddr.value = addr
        self.dut.pwdata.value = data
        self.dut.pwrite.value = 1
        self.dut.psel.value = 1
        
        # Optional pstrb
        if hasattr(self.dut, "pstrb"):
            self.dut.pstrb.value = 0xF
            
        await RisingEdge(self.dut.pclk)
        self.dut.penable.value = 1
        await RisingEdge(self.dut.pclk)
        
        while not safe_to_int(self.dut.pready):
            await RisingEdge(self.dut.pclk)
            
        self.dut.psel.value = 0
        self.dut.penable.value = 0
        self.dut.pwrite.value = 0 # Good practice to de-assert write

    async def _read_apb(self, addr):
        self.dut.paddr.value = addr
        self.dut.pwrite.value = 0
        self.dut.psel.value = 1
        await RisingEdge(self.dut.pclk)
        self.dut.penable.value = 1
        await RisingEdge(self.dut.pclk)
        
        while not safe_to_int(self.dut.pready):
            await RisingEdge(self.dut.pclk)
            
        data = safe_to_int(self.dut.prdata)
        self.dut.psel.value = 0
        self.dut.penable.value = 0
        return data

    # --- Wishbone Helpers ---
    async def _write_wb(self, addr, data):
        self.dut.wb_adr_i.value = addr
        self.dut.wb_dat_i.value = data
        self.dut.wb_we_i.value = 1
        self.dut.wb_sel_i.value = 0xF
        self.dut.wb_cyc_i.value = 1
        self.dut.wb_stb_i.value = 1
        
        await RisingEdge(self.dut.wb_clk_i)
        while not safe_to_int(self.dut.wb_ack_o):
            await RisingEdge(self.dut.wb_clk_i)
            
        self.dut.wb_cyc_i.value = 0
        self.dut.wb_stb_i.value = 0
        self.dut.wb_we_i.value = 0 # Cleanup
        
        # CRITICAL FIX: 1ns delay to ensure GHDL sees the de-assertion
        # prevents back-to-back transaction merging issues.
        await Timer(1, unit="ns")

    async def _read_wb(self, addr):
        self.dut.wb_adr_i.value = addr
        self.dut.wb_we_i.value = 0
        self.dut.wb_cyc_i.value = 1
        self.dut.wb_stb_i.value = 1
        self.dut.wb_sel_i.value = 0xF
        
        await RisingEdge(self.dut.wb_clk_i)
        while not safe_to_int(self.dut.wb_ack_o):
            await RisingEdge(self.dut.wb_clk_i)
            
        data = safe_to_int(self.dut.wb_dat_o)
        self.dut.wb_cyc_i.value = 0
        self.dut.wb_stb_i.value = 0
        
        # CRITICAL FIX: 1ns delay
        await Timer(1, unit="ns")
        return data
