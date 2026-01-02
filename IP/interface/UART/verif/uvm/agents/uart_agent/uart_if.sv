`timescale 1ps / 1ps
interface uart_if (
    input logic clk,
    input logic rst_n
);
  logic txd;
  logic rxd;
  logic rts_n;
  logic cts_n;

  // Debug signals or internal state can be added here if needed

  clocking drv_cb @(posedge clk);
    output rxd;
    output cts_n;
    input txd;
    input rts_n;
  endclocking

  clocking mon_cb @(posedge clk);
    input rxd;
    input txd;
    input rts_n;
    input cts_n;
  endclocking

  modport driver(clocking drv_cb);
  modport monitor(clocking mon_cb);

endinterface : uart_if
