/*
 * File: sp_memory_apb.sv
 * Description: APB4 Wrapper for Single Port Memory.
 * Author: Gemini-3 AI
 */

module sp_memory_apb #(
    parameter int WIDTH      = 32,
    parameter int DEPTH      = 1024,
    parameter bit PIPELINE   = 0,
    parameter bit PARITY     = 0,
    parameter bit ECC        = 0,
    parameter     TECHNOLOGY = "GENERIC"
) (
    input logic pclk,
    input logic presetn,

    // Sideband Signals
    input  logic sleep,
    input  logic bist_en,
    output logic bist_done,
    output logic bist_pass,
    output logic err_parity,
    output logic err_ecc_single,
    output logic err_ecc_double,

    // APB4 Interface
    input  logic [         31:0] paddr,
    input  logic                 psel,
    input  logic                 penable,
    input  logic                 pwrite,
    input  logic [    WIDTH-1:0] pwdata,
    input  logic [(WIDTH/8)-1:0] pstrb,
    input  logic [          2:0] pprot,
    output logic                 pready,
    output logic [    WIDTH-1:0] prdata,
    output logic                 pslverr
);

  logic [$clog2(DEPTH)-1:0] mem_addr;
  localparam int ADDR_LSB = $clog2(WIDTH / 8);

  // APB is 2-phase: Setup (psel), Access (psel & penable).
  // BRAM Read: Address setup -> 1 cycle -> Data.
  // APB Read: Setup -> Access (Data Valid).
  // Since BRAM is synchronous, if we apply address during Setup, data is ready during Access! PERFECT.

  assign mem_addr = paddr[$clog2(DEPTH)+ADDR_LSB-1 : ADDR_LSB];

  // Chip Select: Active whenever PSEL is high (Setup or Access)
  // Write Enable: Active during Access phase if Write
  // Wait, BRAM write usually needs 1 cycle. If we trigger on PSEL (setup), it writes at end of Setup cycle.
  // Data is valid during Setup? No, APB says addr valid setup, data valid ??
  // APB4: Write data valid during Access phase.
  // So we must write only when PENABLE is high (Access phase).

  // Out of range check
  logic addr_ok;
  assign addr_ok = (paddr < (DEPTH << ADDR_LSB));

  sp_memory #(
      .WIDTH(WIDTH),
      .DEPTH(DEPTH),
      .TECHNOLOGY(TECHNOLOGY)
  ) core (
      .clk           (pclk),
      .rst_n         (presetn),
      .cs            (psel && (!pwrite || penable)),  // Read: Setup+Access. Write: Access only.
      .we            (pwrite),                        // Write if PWRITE is high
      .addr          (mem_addr),
      .wdata         (pwdata),
      .wstrb         (pstrb),
      .rdata         (prdata),
      .sleep         (sleep),
      .bist_en       (bist_en),
      .bist_done     (bist_done),
      .bist_pass     (bist_pass),
      .err_parity    (err_parity),
      .err_ecc_single(err_ecc_single),
      .err_ecc_double(err_ecc_double)
  );

  // APB Outputs
  assign pready  = 1'b1;  // Usage of BRAM assumes always ready (1 cycle access matches APB timing)
  assign pslverr = !addr_ok;
endmodule
