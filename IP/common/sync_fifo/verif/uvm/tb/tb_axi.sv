/*
 * File: tb_axi.sv
 * Description: Top-level testbench for AXI Sync FIFO UVM.
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

  // Interfaces
  axi_if axi_vif (
      clk,
      rst_n
  );
  fifo_if #(32) fifo_mon_vif (
      clk,
      rst_n
  );

  // Intermediate signals for monitoring
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

  // DUT
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

  initial begin
    uvm_config_db#(virtual fifo_if #(32))::set(null, "*fifo_agt*", "vif", fifo_mon_vif);
    uvm_config_db#(virtual axi_if)::set(null, "*axi_agt*", "vif", axi_vif);
    run_test();
  end

endmodule
