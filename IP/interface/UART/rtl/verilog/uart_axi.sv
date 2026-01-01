/*
 * uart_axi.sv
 *
 * AXI4-Lite Wrapper for UART IP.
 */

`timescale 1ns / 1ps

module uart_axi #(
    parameter DEFAULT_BAUD_DIV = 16'd27
) (
    // AXI4-Lite Slave Interface
    input  logic        s_axi_aclk,
    input  logic        s_axi_aresetn,
    input  logic [31:0] s_axi_awaddr,
    input  logic [ 2:0] s_axi_awprot,
    input  logic        s_axi_awvalid,
    output logic        s_axi_awready,
    input  logic [31:0] s_axi_wdata,
    input  logic [ 3:0] s_axi_wstrb,
    input  logic        s_axi_wvalid,
    output logic        s_axi_wready,
    output logic [ 1:0] s_axi_bresp,
    output logic        s_axi_bvalid,
    input  logic        s_axi_bready,
    input  logic [31:0] s_axi_araddr,
    input  logic [ 2:0] s_axi_arprot,
    input  logic        s_axi_arvalid,
    output logic        s_axi_arready,
    output logic [31:0] s_axi_rdata,
    output logic [ 1:0] s_axi_rresp,
    output logic        s_axi_rvalid,
    input  logic        s_axi_rready,

    // UART Physical Interface
    input  logic uart_rxd,
    output logic uart_txd,
    output logic uart_rts_n,
    input  logic uart_cts_n,
    output logic uart_de,

    // DMA Handshake
    output logic dma_tx_req,
    output logic dma_rx_req,

    // Interrupt
    output logic intr
);

  // Native Register Interface signals
  logic [31:0] reg_addr;
  logic [31:0] reg_wdata;
  logic [31:0] reg_rdata;
  logic        reg_we;
  logic        reg_re;
  logic [ 3:0] reg_be;

  // Instantiate AXI4-Lite Slave Adapter
  axi4lite_slave_adapter #(
      .ADDR_WIDTH(32),
      .DATA_WIDTH(32)
  ) adapter_inst (
      .aclk   (s_axi_aclk),
      .aresetn(s_axi_aresetn),

      // AXI signals
      .s_axi_awaddr (s_axi_awaddr),
      .s_axi_awprot (s_axi_awprot),
      .s_axi_awvalid(s_axi_awvalid),
      .s_axi_awready(s_axi_awready),
      .s_axi_wdata  (s_axi_wdata),
      .s_axi_wstrb  (s_axi_wstrb),
      .s_axi_wvalid (s_axi_wvalid),
      .s_axi_wready (s_axi_wready),
      .s_axi_bresp  (s_axi_bresp),
      .s_axi_bvalid (s_axi_bvalid),
      .s_axi_bready (s_axi_bready),
      .s_axi_araddr (s_axi_araddr),
      .s_axi_arprot (s_axi_arprot),
      .s_axi_arvalid(s_axi_arvalid),
      .s_axi_arready(s_axi_arready),
      .s_axi_rdata  (s_axi_rdata),
      .s_axi_rresp  (s_axi_rresp),
      .s_axi_rvalid (s_axi_rvalid),
      .s_axi_rready (s_axi_rready),

      // Native Interface
      .reg_addr (reg_addr),
      .reg_wdata(reg_wdata),
      .reg_rdata(reg_rdata),
      .reg_we   (reg_we),
      .reg_re   (reg_re),
      .reg_be   (reg_be)
  );

  // Instantiate UART Core
  uart_core #(
      .DEFAULT_BAUD_DIV(DEFAULT_BAUD_DIV)
  ) core_inst (
      .clk       (s_axi_aclk),
      .rst_n     (s_axi_aresetn),
      .uart_rxd  (uart_rxd),
      .uart_txd  (uart_txd),
      .uart_rts_n(uart_rts_n),
      .uart_cts_n(uart_cts_n),
      .uart_de   (uart_de),
      .reg_addr  (reg_addr),
      .reg_wdata (reg_wdata),
      .reg_rdata (reg_rdata),
      .reg_we    (reg_we),
      .reg_re    (reg_re),
      .reg_be    (reg_be),
      .dma_tx_req(dma_tx_req),
      .dma_rx_req(dma_rx_req),
      .intr      (intr)
  );

endmodule
