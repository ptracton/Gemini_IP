/*
 * uart_apb.sv
 *
 * APB4 Wrapper for UART IP.
 */

`timescale 1ns / 1ps

module uart_apb #(
    parameter DEFAULT_BAUD_DIV = 16'd27
) (
    // APB Slave Interface
    input  logic        pclk,
    input  logic        presetn,
    input  logic [31:0] paddr,
    input  logic [ 2:0] pprot,
    input  logic        psel,
    input  logic        penable,
    input  logic        pwrite,
    input  logic [31:0] pwdata,
    input  logic [ 3:0] pstrb,
    output logic        pready,
    output logic [31:0] prdata,
    output logic        pslverr,

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

  // Instantiate APB Slave Adapter
  apb_slave_adapter #(
      .ADDR_WIDTH(32),
      .DATA_WIDTH(32)
  ) adapter_inst (
      .pclk   (pclk),
      .presetn(presetn),

      // APB signals
      .paddr  (paddr),
      .pprot  (pprot),
      .psel   (psel),
      .penable(penable),
      .pwrite (pwrite),
      .pwdata (pwdata),
      .pstrb  (pstrb),
      .pready (pready),
      .prdata (prdata),
      .pslverr(pslverr),

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
      .clk       (pclk),
      .rst_n     (presetn),
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
