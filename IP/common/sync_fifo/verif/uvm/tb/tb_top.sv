/*
 * File: tb_top.sv
 * Description: Top-level testbench for Sync FIFO UVM.
 * Author: Gemini-3 AI
 */

`timescale 1ns / 1ps

module tb_top;
  import uvm_pkg::*;
  import sync_fifo_all_tests_pkg::*;

  logic clk;
  logic rst_n;
  localparam int FIFO_DEPTH = 16;

  // Clock generation
  initial begin
    clk = 0;
    forever #5ns clk = ~clk;
  end

  // Reset generation
  initial begin
    rst_n = 0;
    #100ns rst_n = 1;
  end

  // Primary Interfaces
  fifo_if #(32) fifo_vif (
      clk,
      rst_n
  );
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

  // Monitor interface for bus wrappers (to see internal FIFO signals)
  fifo_if #(32) fifo_mon_vif (
      clk,
      rst_n
  );

  // Intermediate signals for monitoring to avoid direct interface member access in port list
  logic        m_flush;
  logic        m_push;
  logic [31:0] m_data_in;
  logic        m_full;
  logic        m_almost_full;
  logic        m_overflow;
  logic        m_pop;
  logic [31:0] m_data_out;
  logic        m_empty;
  logic        m_almost_empty;
  logic        m_underflow;
  logic [31:0] m_level;
  logic [31:0] m_max_level;

  assign fifo_mon_vif.flush        = m_flush;
  assign fifo_mon_vif.push         = m_push;
  assign fifo_mon_vif.data_in      = m_data_in;
  assign fifo_mon_vif.is_full      = m_full;
  assign fifo_mon_vif.almost_full  = m_almost_full;
  assign fifo_mon_vif.overflow     = m_overflow;
  assign fifo_mon_vif.pop          = m_pop;
  assign fifo_mon_vif.data_out     = m_data_out;
  assign fifo_mon_vif.is_empty     = m_empty;
  assign fifo_mon_vif.almost_empty = m_almost_empty;
  assign fifo_mon_vif.underflow    = m_underflow;
  assign fifo_mon_vif.level        = m_level;
  assign fifo_mon_vif.max_level    = m_max_level;

  // DUT selection and instantiation
`ifdef BUS_AXI
  sync_fifo_axi #(
      .DATA_WIDTH(32),
      .FIFO_DEPTH(16)
  ) dut (
      .aclk         (clk),
      .aresetn      (rst_n),
      .s_axi_awaddr (axi_vif.awaddr),
      .s_axi_awprot (axi_vif.awprot),
      .s_axi_awvalid(axi_vif.awvalid),
      .s_axi_awready(axi_vif.awready),
      .s_axi_wdata  (axi_vif.wdata),
      .s_axi_wstrb  (axi_vif.wstrb),
      .s_axi_wvalid (axi_vif.wvalid),
      .s_axi_wready (axi_vif.wready),
      .s_axi_bresp  (axi_vif.bresp),
      .s_axi_bvalid (axi_vif.bvalid),
      .s_axi_bready (axi_vif.bready),
      .s_axi_araddr (axi_vif.araddr),
      .s_axi_arprot (axi_vif.arprot),
      .s_axi_arvalid(axi_vif.arvalid),
      .s_axi_arready(axi_vif.arready),
      .s_axi_rdata  (axi_vif.rdata),
      .s_axi_rresp  (axi_vif.rresp),
      .s_axi_rvalid (axi_vif.rvalid),
      .s_axi_rready (axi_vif.rready),

      // Monitor Ports
      .mon_flush       (m_flush),
      .mon_push        (m_push),
      .mon_data_in     (m_data_in),
      .mon_full        (m_full),
      .mon_almost_full (m_almost_full),
      .mon_overflow    (m_overflow),
      .mon_pop         (m_pop),
      .mon_data_out    (m_data_out),
      .mon_empty       (m_empty),
      .mon_almost_empty(m_almost_empty),
      .mon_underflow   (m_underflow),
      .mon_level       (m_level),
      .mon_max_level   (m_max_level)
  );
`elsif BUS_APB
  sync_fifo_apb #(
      .DATA_WIDTH(32),
      .FIFO_DEPTH(16)
  ) dut (
      .pclk   (clk),
      .presetn(rst_n),
      .paddr  (apb_vif.paddr),
      .pprot  (apb_vif.pprot),
      .psel   (apb_vif.psel),
      .penable(apb_vif.penable),
      .pwrite (apb_vif.pwrite),
      .pwdata (apb_vif.pwdata),
      .pstrb  (apb_vif.pstrb),
      .prdata (apb_vif.prdata),
      .pready (apb_vif.pready),
      .pslverr(apb_vif.pslverr),

      // Monitor Ports
      .mon_flush       (m_flush),
      .mon_push        (m_push),
      .mon_data_in     (m_data_in),
      .mon_full        (m_full),
      .mon_almost_full (m_almost_full),
      .mon_overflow    (m_overflow),
      .mon_pop         (m_pop),
      .mon_data_out    (m_data_out),
      .mon_empty       (m_empty),
      .mon_almost_empty(m_almost_empty),
      .mon_underflow   (m_underflow),
      .mon_level       (m_level),
      .mon_max_level   (m_max_level)
  );
`elsif BUS_WB
  sync_fifo_wb #(
      .DATA_WIDTH(32),
      .FIFO_DEPTH(16)
  ) dut (
      .wb_clk_i(clk),
      .wb_rst_i(!rst_n),
      .wb_adr_i(wb_vif.adr),
      .wb_dat_i(wb_vif.dat_o),
      .wb_dat_o(wb_vif.dat_i),
      .wb_we_i (wb_vif.we),
      .wb_sel_i(wb_vif.sel),
      .wb_stb_i(wb_vif.stb),
      .wb_cyc_i(wb_vif.cyc),
      .wb_ack_o(wb_vif.ack),
      .wb_err_o(wb_vif.err),

      // Monitor Ports
      .mon_flush       (m_flush),
      .mon_push        (m_push),
      .mon_data_in     (m_data_in),
      .mon_full        (m_full),
      .mon_almost_full (m_almost_full),
      .mon_overflow    (m_overflow),
      .mon_pop         (m_pop),
      .mon_data_out    (m_data_out),
      .mon_empty       (m_empty),
      .mon_almost_empty(m_almost_empty),
      .mon_underflow   (m_underflow),
      .mon_level       (m_level),
      .mon_max_level   (m_max_level)
  );
`else
  sync_fifo #(
      .WIDTH(32),
      .DEPTH(16),
      .FWFT_MODE(1)
  ) dut (
      .clk(clk),
      .rst_n(rst_n),
      .flush(fifo_vif.flush),
      .push(fifo_vif.push),
      .data_in(fifo_vif.data_in),
      .full(fifo_vif.is_full),
      .almost_full(fifo_vif.almost_full),
      .overflow(fifo_vif.overflow),
      .pop(fifo_vif.pop),
      .data_out(fifo_vif.data_out),
      .empty(fifo_vif.is_empty),
      .almost_empty(fifo_vif.almost_empty),
      .underflow(fifo_vif.underflow),
      .level(fifo_vif.level[4:0]),
      .max_level(fifo_vif.max_level[4:0])
  );

  assign fifo_vif.level[31:5] = '0;
  assign fifo_vif.max_level[31:5] = '0;
`endif

  initial begin
`ifdef CORE_ONLY
    uvm_config_db#(virtual fifo_if #(32))::set(null, "*fifo_agt*", "vif", fifo_vif);
`else
    uvm_config_db#(virtual fifo_if #(32))::set(null, "*fifo_agt*", "vif", fifo_mon_vif);
`endif

`ifdef BUS_AXI
    uvm_config_db#(virtual axi_if)::set(null, "*axi_agt*", "vif", axi_vif);
`elsif BUS_APB
    uvm_config_db#(virtual apb_if)::set(null, "*apb_agt*", "vif", apb_vif);
`elsif BUS_WB
    uvm_config_db#(virtual wb_if)::set(null, "*wb_agt*", "vif", wb_vif);
`endif

    run_test();
  end

endmodule
