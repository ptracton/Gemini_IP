/*
 * File: sp_memory_wb.sv
 * Description: Wishbone B4 Wrapper for Single Port Memory.
 * Author: Gemini-3 AI
 */

module sp_memory_wb #(
    parameter int WIDTH      = 32,
    parameter int DEPTH      = 1024,
    parameter bit PIPELINE   = 0,
    parameter bit PARITY     = 0,
    parameter bit ECC        = 0,
    parameter     TECHNOLOGY = "GENERIC"
) (
    input logic clk_i,
    input logic rst_i,

    // Sideband Signals
    input  logic sleep,
    input  logic bist_en,
    output logic bist_done,
    output logic bist_pass,
    output logic err_parity,
    output logic err_ecc_single,
    output logic err_ecc_double,

    // Wishbone B4 Interface
    input  logic [         31:0] adr_i,
    input  logic [    WIDTH-1:0] dat_i,
    input  logic [(WIDTH/8)-1:0] sel_i,
    input  logic                 we_i,
    input  logic                 cyc_i,
    input  logic                 stb_i,
    output logic [    WIDTH-1:0] dat_o,
    output logic                 ack_o,
    output logic                 err_o
);

  logic [$clog2(DEPTH)-1:0] mem_addr;
  localparam int ADDR_LSB = $clog2(WIDTH / 8);

  assign mem_addr = adr_i[$clog2(DEPTH)+ADDR_LSB-1 : ADDR_LSB];

  // Wishbone Standard:
  // Strobe (stb_i) indicates valid transfer.
  // Acknowledge (ack_o) indicates completion.
  // Synchronous RAM: 1 cycle latency.
  // If we assert CS/WE on cycle 0, data/write done end of cycle 0, ready cycle 1.
  // So ACK should be asserted cycle 1.

  logic mem_cs;
  assign mem_cs = cyc_i && stb_i;

  // Out of range check
  logic addr_ok;
  assign addr_ok = (adr_i < (DEPTH << ADDR_LSB));

  // ACK Logic: 1 cycle delay from request
  always_ff @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ack_o <= 1'b0;
      err_o <= 1'b0;
    end else begin
      if (mem_cs && !ack_o && !err_o) begin
        ack_o <= addr_ok;
        err_o <= !addr_ok;
      end else begin
        ack_o <= 1'b0;
        err_o <= 1'b0;
      end
    end
  end

  sp_memory #(
      .WIDTH(WIDTH),
      .DEPTH(DEPTH),
      .TECHNOLOGY(TECHNOLOGY)
  ) core (
      .clk(clk_i),
      .rst_n(!rst_i),
      .cs(mem_cs && !ack_o && !err_o),
      .we(we_i),
      .addr(mem_addr),
      .wdata(dat_i),
      .wstrb(sel_i),
      .rdata(dat_o),
      .sleep(sleep),
      .bist_en(bist_en),
      .bist_done(bist_done),
      .bist_pass(bist_pass),
      .err_parity(err_parity),
      .err_ecc_single(err_ecc_single),
      .err_ecc_double(err_ecc_double)
  );

endmodule
