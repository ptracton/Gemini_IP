/*
 * File: tb_top.sv
 * Description: SP Memory UVM Top Testbench
 */

module tb_top;
  import uvm_pkg::*;
  import sp_memory_test_pkg::*;
  `include "uvm_macros.svh"
  
  // Macros to stringify the result of a macro expansion
  `define STRINGIFY(x) `"x`"
  `define TO_STRING(x) `STRINGIFY(x)

  localparam WIDTH = 32;
  localparam DEPTH = 1024;

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
  sp_memory_axi #(
      .WIDTH(WIDTH),
      .DEPTH(DEPTH),
      .TECHNOLOGY(`ifdef TECHNOLOGY `TO_STRING(`TECHNOLOGY) `else "GENERIC" `endif),
      .INIT_FILE(`ifdef INIT_FILE `TO_STRING(`INIT_FILE) `else "" `endif),
      .ECC(`ifdef ECC_EN `ECC_EN `else 1 `endif),
      .PARITY(`ifdef PARITY_EN `PARITY_EN `else 0 `endif)
  ) dut_axi (
      .aclk(clk),
      .aresetn(rst_n),
      // AXI Mapping
      .awaddr(axi_vif.awaddr),
      .awvalid(axi_vif.awvalid),
      .awready(axi_vif.awready),
      .awlen('0),
      .awsize(3'b010),
      .awburst(2'b01),
      .awprot(axi_vif.awprot),
      .wdata(axi_vif.wdata),
      .wstrb(axi_vif.wstrb),
      .wlast(1'b1),
      .wvalid(axi_vif.wvalid),
      .wready(axi_vif.wready),
      .bresp(axi_vif.bresp),
      .bvalid(axi_vif.bvalid),
      .bready(axi_vif.bready),
      .araddr(axi_vif.araddr),
      .arvalid(axi_vif.arvalid),
      .arready(axi_vif.arready),
      .arlen('0),
      .arsize(3'b010),
      .arburst(2'b01),
      .arprot(axi_vif.arprot),
      .rdata(axi_vif.rdata),
      .rresp(axi_vif.rresp),
      .rvalid(axi_vif.rvalid),
      .rready(axi_vif.rready),
      .rlast(),
      // Sideband
      .sleep(mem_vif.sleep),
      .bist_en(mem_vif.bist_en),
      .bist_done(mem_vif.bist_done),
      .bist_pass(mem_vif.bist_pass),
      .err_parity(mem_vif.err_parity),
      .err_ecc_single(mem_vif.err_ecc_single),
      .err_ecc_double(mem_vif.err_ecc_double)
  );

  initial begin
    uvm_config_db#(virtual axi_if)::set(null, "*", "vif", axi_vif);
    uvm_config_db#(virtual sp_memory_if)::set(null, "*", "vif", mem_vif);
    run_test();
  end

`elsif BUS_WB
  sp_memory_wb #(
      .WIDTH(WIDTH),
      .DEPTH(DEPTH),
      .TECHNOLOGY(`ifdef TECHNOLOGY `TO_STRING(`TECHNOLOGY) `else "GENERIC" `endif),
      .INIT_FILE(`ifdef INIT_FILE `TO_STRING(`INIT_FILE) `else "" `endif),
      .ECC(`ifdef ECC_EN `ECC_EN `else 1 `endif),
      .PARITY(`ifdef PARITY_EN `PARITY_EN `else 0 `endif)
  ) dut_wb (
      .clk_i(clk),
      .rst_i(~rst_n),
      // WB Mapping
      .adr_i(wb_vif.adr),
      .dat_i(wb_vif.dat_i),
      .dat_o(wb_vif.dat_o),
      .we_i(wb_vif.we),
      .sel_i(wb_vif.sel),
      .stb_i(wb_vif.stb),
      .cyc_i(wb_vif.cyc),
      .ack_o(wb_vif.ack),
      .err_o(wb_vif.err),
      // Sideband
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
  sp_memory_ahb #(
      .WIDTH(WIDTH),
      .DEPTH(DEPTH),
      .TECHNOLOGY(`ifdef TECHNOLOGY `TO_STRING(`TECHNOLOGY) `else "GENERIC" `endif),
      .INIT_FILE(`ifdef INIT_FILE `TO_STRING(`INIT_FILE) `else "" `endif),
      .ECC(`ifdef ECC_EN `ECC_EN `else 1 `endif),
      .PARITY(`ifdef PARITY_EN `PARITY_EN `else 0 `endif)
  ) dut_ahb (
      .hclk(clk),
      .hresetn(rst_n),
      // AHB Mapping
      .hsel(ahb_vif.hsel),
      .haddr(ahb_vif.haddr),
      .htrans(ahb_vif.htrans),
      .hwrite(ahb_vif.hwrite),
      .hsize(ahb_vif.hsize),
      .hburst(ahb_vif.hburst),
      .hprot(ahb_vif.hprot),
      .hwdata(ahb_vif.hwdata),
      .hready(ahb_vif.hready),
      .hreadyout(ahb_vif.hready),
      .hrdata(ahb_vif.hrdata),
      .hresp(ahb_vif.hresp),
      // Sideband
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
  sp_memory_apb #(
      .WIDTH(WIDTH),
      .DEPTH(DEPTH),
      .TECHNOLOGY(`ifdef TECHNOLOGY `TO_STRING(`TECHNOLOGY) `else "GENERIC" `endif),
      .INIT_FILE(`ifdef INIT_FILE `TO_STRING(`INIT_FILE) `else "" `endif),
      .ECC(`ifdef ECC_EN `ECC_EN `else 1 `endif),
      .PARITY(`ifdef PARITY_EN `PARITY_EN `else 0 `endif)
  ) dut_apb (
      .pclk(clk),
      .presetn(rst_n),
      // APB Mapping
      .psel(apb_vif.psel),
      .penable(apb_vif.penable),
      .pwrite(apb_vif.pwrite),
      .paddr(apb_vif.paddr),
      .pwdata(apb_vif.pwdata),
      .pstrb(apb_vif.pstrb),
      .pprot(apb_vif.pprot),
      .prdata(apb_vif.prdata),
      .pready(apb_vif.pready),
      .pslverr(apb_vif.pslverr),
      // Sideband
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
