/*
 * File: sp_memory_wb.sv
 * Description: Wishbone B4 Wrapper for Single Port Memory.
 * Author: Gemini-3 AI
 */

module sp_memory_wb #(
    parameter WIDTH = 32,
    parameter DEPTH = 1024,
    parameter TECHNOLOGY = "GENERIC"
) (
    input logic clk_i,
    input logic rst_i,

    // Wishbone B4 Interface
    input  logic [         31:0] adr_i,
    input  logic [    WIDTH-1:0] dat_i,
    input  logic [(WIDTH/8)-1:0] sel_i,
    input  logic                 we_i,
    input  logic                 cyc_i,
    input  logic                 stb_i,
    output logic [    WIDTH-1:0] dat_o,
    output logic                 ack_o
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

  // ACK Logic: 1 cycle delay from request
  always_ff @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ack_o <= 1'b0;
    end else begin
      // If request active and not yet ACKed (or supporting pipelined acks)
      // Classic WB: Assert ACK one cycle after STB.
      if (mem_cs && !ack_o) begin
        ack_o <= 1'b1;
      end else begin
        ack_o <= 1'b0;
      end
    end
  end

  sp_memory #(
      .WIDTH(WIDTH),
      .DEPTH(DEPTH),
      .TECHNOLOGY(TECHNOLOGY)
  ) core (
      .clk(clk_i),
      .rst_n(!rst_i),  // Wishbone is usually active high reset
      .cs(mem_cs && !ack_o), // Only activate if not already ACKed to prevent multi-cycle write/reads on single transaction
      .we(we_i),
      .addr(mem_addr),
      .wdata(dat_i),
      .wstrb(sel_i),
      .rdata(dat_o)
  );

endmodule
