/*
 * File: fifo_if.sv
 * Description: Interface for Sync FIFO core signals.
 * Author: Gemini-3 AI
 */

interface fifo_if #(
    parameter int WIDTH = 32
) (
    input logic clk,
    input logic rst_n
);
  logic             flush;
  logic             push;
  logic [WIDTH-1:0] data_in;
  logic             is_full;
  logic             almost_full;
  logic             overflow;
  logic             pop;
  logic [WIDTH-1:0] data_out;
  logic             is_empty;
  logic             almost_empty;
  logic             underflow;
  logic [     31:0] level;
  logic [     31:0] max_level;

  clocking drv_cb @(posedge clk);
    default input #1ns output #1ns;
    output flush;
    output push;
    output data_in;
    output pop;
    input is_full;
    input almost_full;
    input overflow;
    input data_out;
    input is_empty;
    input almost_empty;
    input underflow;
    input level;
    input max_level;
  endclocking

  clocking mon_cb @(posedge clk);
    default input #1ns output #1ns;
    input flush;
    input push;
    input data_in;
    input is_full;
    input almost_full;
    input overflow;
    input pop;
    input data_out;
    input is_empty;
    input almost_empty;
    input underflow;
    input level;
    input max_level;
  endclocking

  modport drv(clocking drv_cb, input clk, input rst_n);
  modport mon(clocking mon_cb, input clk, input rst_n);

endinterface
