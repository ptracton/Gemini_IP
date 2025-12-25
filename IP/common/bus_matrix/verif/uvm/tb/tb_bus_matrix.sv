/*
 * File: tb_bus_matrix.sv
 * Description: Bus Matrix UVM Top
 */

module tb_bus_matrix;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import bus_matrix_env_pkg::*;
    import axi_agent_pkg::*;
    import ahb_agent_pkg::*;
    import wb_agent_pkg::*;
    import bus_matrix_test_pkg::*;

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
    axi_if axi_if_0(clk, resetn);
    ahb_if ahb_if_0(clk, resetn);
    wb_if  wb_if_0(clk, resetn);

    // DUT Instantiation
    // For now, assuming direct instantiation or wrapper.
    // Ideally we verify a specific wrapper (AHB Matrix or Mixed Matrix)
    // Let's instantiate an AHB Matrix for start
    bus_matrix_ahb #(
        .N_MASTERS(2),
        .M_SLAVES(2)
    ) dut_ahb (
        .HCLK(clk),
        .HRESETn(resetn),
        // Master 0 (AHB)
        .HADDR_i({32'h0, ahb_if_0.haddr}), // Index 0
        .HTRANS_i({2'b0, ahb_if_0.htrans}),
        .HWRITE_i({1'b0, ahb_if_0.hwrite}),
        .HSIZE_i({3'b0, ahb_if_0.hsize}),
        .HBURST_i({3'b0, ahb_if_0.hburst}),
        .HSEL_i({1'b0, ahb_if_0.hsel}),
        .HWDATA_i({32'h0, ahb_if_0.hwdata}),
        .HREADY_i({1'b1, ahb_if_0.hready}), // Tie unused master HREADY to 1
        // Returns
        .HRDATA_o(ahb_if_0.hrdata), // Only capturing M0
        .HREADYOUT_o(ahb_if_0.hready), 
        .HRESP_o(ahb_if_0.hresp),
        // Protection
        .HPROT_i({4'b0, 4'b0001})
    );

    // AXI Matrix Instance
    bus_matrix_axi #(
        .N_MASTERS(2),
        .M_SLAVES(2)
    ) dut_axi (
        .aclk(clk),
        .aresetn(resetn),
        // Write Address
        .awaddr_i({32'h0, axi_if_0.awaddr}),
        .awprot_i({3'b0, axi_if_0.awprot}),
        .awvalid_i({1'b0, axi_if_0.awvalid}),
        .awready_o(axi_if_0.awready), // Logic required if flattened return needed, but sticking to bit 0 for now
        // Write Data
        .wdata_i({32'h0, axi_if_0.wdata}),
        .wstrb_i({4'b0, axi_if_0.wstrb}),
        .wvalid_i({1'b0, axi_if_0.wvalid}),
        .wready_o(axi_if_0.wready),
        // Write Response
        .bresp_o(axi_if_0.bresp), // Only partial connect
        .bvalid_o(axi_if_0.bvalid),
        .bready_i({1'b0, axi_if_0.bready}),
        // Read Address
        .araddr_i({32'h0, axi_if_0.araddr}),
        .arprot_i({3'b0, axi_if_0.arprot}),
        .arvalid_i({1'b0, axi_if_0.arvalid}),
        .arready_o(axi_if_0.arready),
        // Read Data
        .rdata_o(axi_if_0.rdata),
        .rresp_o(axi_if_0.rresp),
        .rvalid_o(axi_if_0.rvalid),
        .rready_i({1'b0, axi_if_0.rready})
    );

    // Wishbone Matrix Instance
    bus_matrix_wb #(
        .N_MASTERS(2),
        .M_SLAVES(2)
    ) dut_wb (
        .clk(clk),
        .rst_n(resetn),
        // Master 0
        .wb_cyc_i({1'b0, wb_if_0.cyc}),
        .wb_stb_i({1'b0, wb_if_0.stb}),
        .wb_we_i({1'b0, wb_if_0.we}),
        .wb_adr_i({32'h0, wb_if_0.adr}),
        .wb_dat_i({32'h0, wb_if_0.dat_i}),
        .wb_sel_i({4'b0, wb_if_0.sel}),
        .wb_ack_o(wb_if_0.ack), // Partial
        .wb_dat_o(wb_if_0.dat_o), // Partial
        .wb_err_o() // Unused in if
    );

    initial begin
        // Set Virtual Interfaces
        uvm_config_db#(virtual ahb_if)::set(null, "*.m_ahb_agent.*", "vif", ahb_if_0);
        uvm_config_db#(virtual axi_if)::set(null, "*.m_axi_agent.*", "vif", axi_if_0);
        uvm_config_db#(virtual wb_if)::set(null, "*.m_wb_agent.*", "vif", wb_if_0);
        
        // Set Slaves to Passive (No Driver) for now as they are not connected
        uvm_config_db#(uvm_active_passive_enum)::set(null, "*.s_*_agent", "is_active", UVM_PASSIVE);
        
        run_test();
    end

    initial begin
        #100ms; // Long timeout
        `uvm_fatal("TIMEOUT", "Simulation timed out")
    end
endmodule
