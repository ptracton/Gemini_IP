/*
 * File: sp_memory_if.sv
 * Description: Interface for SP Memory sideband signals (BIST, Sleep, Error Reporting)
 */
interface sp_memory_if (
    input logic clk,
    input logic rst_n
);
  // Control
  logic sleep;
  logic bist_en;

  // Status
  logic bist_done;
  logic bist_pass;
  logic err_parity;
  logic err_ecc_single;
  logic err_ecc_double;

  clocking cb @(posedge clk);
    default input #1step output #1ns;
    output sleep;
    output bist_en;
    input bist_done;
    input bist_pass;
    input err_parity;
    input err_ecc_single;
    input err_ecc_double;
  endclocking

  modport DRIVER(clocking cb, input clk, input rst_n);
  modport MONITOR(
      input clk,
      input rst_n,
      input sleep,
      input bist_en,
      input bist_done,
      input bist_pass,
      input err_parity,
      input err_ecc_single,
      input err_ecc_double
  );

endinterface
