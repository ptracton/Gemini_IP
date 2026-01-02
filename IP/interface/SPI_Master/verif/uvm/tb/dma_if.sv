/*
 * File: dma_if.sv
 * Description: Interface to monitor and drive DMA handshake signals
 */

interface dma_if (
    input logic clk,
    input logic rst_n
);

  // Signals
  logic tx_req;
  logic tx_ack;
  logic rx_req;
  logic rx_ack;

  // Modports
  modport dut(output tx_req, input tx_ack, output rx_req, input rx_ack);

  modport tb(input tx_req, output tx_ack, input rx_req, output rx_ack);

endinterface
