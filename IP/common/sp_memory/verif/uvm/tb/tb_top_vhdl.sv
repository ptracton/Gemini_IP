/*
 * File: tb_top_vhdl.sv
 * Description: SP Memory UVM Top Testbench for VHDL DUT
 */

module tb_top_vhdl;
  import uvm_pkg::*;
  import sp_memory_test_pkg::*;

  logic clk;
  logic rst_n;

  // Clock Generation
  initial begin
    clk = 0;
    forever #5ns clk = ~clk;
  end

  // Reset Generation
  initial begin
    rst_n = 0;
    #20ns;
    rst_n = 1;
  end

  // Interfaces
  apb_if apb_vif (
      clk,
      rst_n
  );
  axi_if axi_vif (
      clk,
      rst_n
  );
  wb_if wb_vif (
      clk,
      rst_n
  );
  ahb_if ahb_vif (
      clk,
      rst_n
  );
  sp_memory_if mem_vif (
      clk,
      rst_n
  );

`ifdef BUS_AXI
  sp_memory_axi dut (
      .aclk(clk),
      .aresetn(rst_n),
      .awaddr(axi_vif.awaddr),
      .awlen('0),  // Tied off or handled by adapter? Wrapper has inputs.
                   // Interface might not match 1:1 if wrapper expects AXI4 full but if supports subset.
                   // Wrapper has awlen, awsize etc. Agents might drive them.
                   // Let's assume default agent drives them or tie off.
      .awsize('0),
      .awburst('0),
      .awprot('0),
      .awvalid(axi_vif.awvalid),
      .awready(axi_vif.awready),
      .wdata(axi_vif.wdata),
      .wstrb(axi_vif.wstrb),
      .wlast('1),  // Tie off for AXI4-Lite
      .wvalid(axi_vif.wvalid),
      .wready(axi_vif.wready),
      .bresp(axi_vif.bresp),
      .bvalid(axi_vif.bvalid),
      .bready(axi_vif.bready),
      .araddr(axi_vif.araddr),
      .arlen('0),
      .arsize('0),
      .arburst('0),
      .arprot('0),
      .arvalid(axi_vif.arvalid),
      .arready(axi_vif.arready),
      .rdata(axi_vif.rdata),
      .rresp(axi_vif.rresp),
      //.rlast(), // Output
      .rvalid(axi_vif.rvalid),
      .rready(axi_vif.rready),
      .sleep(mem_vif.sleep),
      .bist_en(mem_vif.bist_en),
      .bist_done(mem_vif.bist_done),
      .bist_pass(mem_vif.bist_pass),
      .err_parity(mem_vif.err_parity),
      .err_ecc_single(mem_vif.err_ecc_single),
      .err_ecc_double(mem_vif.err_ecc_double)
  );
  // Warning: Port mapping issues likely for missing AXI4 full signals if interface is AXI4-Lite.
  // sp_memory_axi.vhd seems to have full AXI4-like ports (awlen, awsize).
  // Interface `axi_if` is typically AXI4-Lite.
  // I need to tie off extras.

  initial begin
    uvm_config_db#(virtual axi_if)::set(null, "*", "vif", axi_vif);
    uvm_config_db#(virtual sp_memory_if)::set(null, "*", "vif", mem_vif);
    run_test();
  end

`elsif BUS_WB
  sp_memory_wb dut (
      .clk_i(clk),
      .rst_i(~rst_n),
      .adr_i(wb_vif.adr),
      .dat_i(wb_vif.dat_i),
      .dat_o(wb_vif.dat_o),
      .we_i(wb_vif.we),
      .sel_i(wb_vif.sel),
      .stb_i(wb_vif.stb),
      .cyc_i(wb_vif.cyc),
      .ack_o(wb_vif.ack),
      .err_o(wb_vif.err),
      .sleep(mem_vif.sleep),
      .bist_en(mem_vif.bist_en),
      .bist_done(mem_vif.bist_done),
      .bist_pass(mem_vif.bist_pass),
      .err_parity(mem_vif.err_parity),
      .err_ecc_single(mem_vif.err_ecc_single),
      .err_ecc_double(mem_vif.err_ecc_double)
  );

  initial begin
    uvm_config_db#(virtual wb_if)::set(null, "*", "vif", wb_vif);
    uvm_config_db#(virtual sp_memory_if)::set(null, "*", "vif", mem_vif);
    run_test();
  end

`elsif BUS_AHB
  sp_memory_ahb dut (
      .hclk(clk),
      .hresetn(rst_n),
      .haddr(ahb_vif.haddr),
      .hwrite(ahb_vif.hwrite),
      .hsize(ahb_vif.hsize),
      .hburst(ahb_vif.hburst),
      .hprot(ahb_vif.hprot),
      .htrans(ahb_vif.htrans),
      .hmastlock('0),
      .hwdata(ahb_vif.hwdata),
      .hsel(ahb_vif.hsel),
      .hready(ahb_vif.hready),
      .hreadyout(ahb_vif.hready_out),
      .hrdata(ahb_vif.hrdata),
      .hresp(ahb_vif.hresp),
      .sleep(mem_vif.sleep),
      .bist_en(mem_vif.bist_en),
      .bist_done(mem_vif.bist_done),
      .bist_pass(mem_vif.bist_pass),
      .err_parity(mem_vif.err_parity),
      .err_ecc_single(mem_vif.err_ecc_single),
      .err_ecc_double(mem_vif.err_ecc_double)
  );

  initial begin
    uvm_config_db#(virtual ahb_if)::set(null, "*", "vif", ahb_vif);
    uvm_config_db#(virtual sp_memory_if)::set(null, "*", "vif", mem_vif);
    run_test();
  end

`else
  // APB Default
  sp_memory_apb dut (
      .pclk(clk),
      .presetn(rst_n),
      .paddr(apb_vif.paddr),
      .psel(apb_vif.psel),
      .penable(apb_vif.penable),
      .pwrite(apb_vif.pwrite),
      .pwdata(apb_vif.pwdata),
      .pstrb(apb_vif.pstrb),
      .pprot(apb_vif.pprot),
      .pready(apb_vif.pready),
      .prdata(apb_vif.prdata),
      .pslverr(apb_vif.pslverr),
      .sleep(mem_vif.sleep),
      .bist_en(mem_vif.bist_en),
      .bist_done(mem_vif.bist_done),
      .bist_pass(mem_vif.bist_pass),
      .err_parity(mem_vif.err_parity),
      .err_ecc_single(mem_vif.err_ecc_single),
      .err_ecc_double(mem_vif.err_ecc_double)
  );

  initial begin
    uvm_config_db#(virtual apb_if)::set(null, "*", "vif", apb_vif);
    uvm_config_db#(virtual sp_memory_if)::set(null, "*", "vif", mem_vif);
    run_test();
  end
`endif

endmodule
