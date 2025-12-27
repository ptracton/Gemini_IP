/*
 * File: tb_ahb_apb_bridge.sv
 * Description: AHB-APB Bridge UVM Top
 */

module tb_ahb_apb_bridge;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import ahb_agent_pkg::*;
    import apb_agent_pkg::*;
    import bridge_env_pkg::*;
    import bridge_test_pkg::*;

    // Clock and Reset
    logic clk;
    logic resetn;

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        resetn = 0;
        #20 resetn = 1;
    end

    // Interfaces
    ahb_if m_ahb_if(clk, resetn);
    apb_if s_apb_if(clk, resetn); 

    // DUT
`ifdef VHDL_DUT
    // VHDL instantiation (assuming entity name is same)
    ahb_apb_bridge dut (
        .HCLK(clk),
        .HRESETn(resetn),
        .HSEL(m_ahb_if.hsel),
        .HADDR(m_ahb_if.haddr),
        .HTRANS(m_ahb_if.htrans),
        .HWRITE(m_ahb_if.hwrite),
        .HSIZE(m_ahb_if.hsize),
        .HBURST(m_ahb_if.hburst),
        .HPROT(m_ahb_if.hprot),
        .HWDATA(m_ahb_if.hwdata),
        .HREADY(m_ahb_if.hready),
        .HREADYOUT(m_ahb_if.hready), // Driven by bridge
        .HRESP(m_ahb_if.hresp),
        .HRDATA(m_ahb_if.hrdata),
        .PADDR(s_apb_if.paddr),
        .PENABLE(s_apb_if.penable),
        .PWRITE(s_apb_if.pwrite),
        .PWDATA(s_apb_if.pwdata),
        .PSTRB(s_apb_if.pstrb),
        .PPROT(s_apb_if.pprot),
        .PSEL(s_apb_if.psel),
        .PRDATA(s_apb_if.prdata),
        .PREADY(s_apb_if.pready),
        .PSLVERR(s_apb_if.pslverr)
    );
`else
    ahb_apb_bridge dut (
        .HCLK(clk),
        .HRESETn(resetn),
        .HSEL(m_ahb_if.hsel),
        .HADDR(m_ahb_if.haddr),
        .HTRANS(m_ahb_if.htrans),
        .HWRITE(m_ahb_if.hwrite),
        .HSIZE(m_ahb_if.hsize),
        .HBURST(m_ahb_if.hburst),
        .HPROT(m_ahb_if.hprot),
        .HWDATA(m_ahb_if.hwdata),
        .HREADY(1'b1), // AHB Master always ready for next
        .HREADYOUT(m_ahb_if.hready),
        .HRESP(m_ahb_if.hresp),
        .HRDATA(m_ahb_if.hrdata),
        .PADDR(s_apb_if.paddr),
        .PENABLE(s_apb_if.penable),
        .PWRITE(s_apb_if.pwrite),
        .PWDATA(s_apb_if.pwdata),
        .PSTRB(s_apb_if.pstrb),
        .PPROT(s_apb_if.pprot),
        .PSEL(s_apb_if.psel),
        .PRDATA(s_apb_if.prdata),
        .PREADY(s_apb_if.pready),
        .PSLVERR(s_apb_if.pslverr)
    );
`endif

    initial begin
        uvm_config_db#(virtual ahb_if)::set(null, "*.m_ahb_agent.*", "vif", m_ahb_if);
        uvm_config_db#(virtual apb_if)::set(null, "*.s_apb_agent.*", "vif", s_apb_if);
        run_test();
    end

    initial begin
        #10ms;
        `uvm_fatal("TIMEOUT", "Simulation timed out")
    end

endmodule
