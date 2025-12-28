/*
 * File: sync_fifo.sv
 * Description: Synchronous FIFO with configurable width and depth.
 * Author: Gemini-3 AI
 * License: MIT
 */

module sync_fifo #(
    parameter int WIDTH = 32,
    parameter int DEPTH = 16
) (
    input logic clk,
    input logic rst_n,  // Active low reset
    input logic flush,  // Synchronous flush

    // Write Interface
    input  logic             push,
    input  logic [WIDTH-1:0] data_in,
    output logic             full,

    // Read Interface
    input  logic             pop,
    output logic [WIDTH-1:0] data_out,
    output logic             empty,

    // Status
    output logic [$clog2(DEPTH):0] level
);

  // Signal Declarations
  (* ram_style = "block" *)logic [        WIDTH-1:0] mem    [DEPTH-1:0];
  logic [$clog2(DEPTH)-1:0] wr_ptr;
  logic [$clog2(DEPTH)-1:0] rd_ptr;
  logic [  $clog2(DEPTH):0] count;

  // Full/Empty Status
  assign full  = (count == DEPTH);
  assign empty = (count == 0);
  assign level = count;

  // Write Logic
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      wr_ptr <= '0;
    end else if (flush) begin
      wr_ptr <= '0;
    end else if (push && !full) begin
      mem[wr_ptr] <= data_in;
      if (wr_ptr == DEPTH - 1) wr_ptr <= '0;
      else wr_ptr <= wr_ptr + 1;
    end
  end

  // Read Logic
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      rd_ptr <= '0;
      rd_ptr <= '0;
    end else if (flush) begin
      rd_ptr   <= '0;
      data_out <= '0;  // Optional: Clear output on flush
    end else if (pop && !empty) begin
      data_out <= mem[rd_ptr];
      if (rd_ptr == DEPTH - 1) rd_ptr <= '0;
      else rd_ptr <= rd_ptr + 1;
    end
  end

  // Counter Logic
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      count <= '0;
    end else if (flush) begin
      count <= '0;
    end else begin
      case ({
        push && !full, pop && !empty
      })
        2'b10:   count <= count + 1;  // Push only
        2'b01:   count <= count - 1;  // Pop only
        default: count <= count;  // Both or neither
      endcase
    end
  end

  // Simulation-only assertions
  // synthesis translate_off
  initial begin
    if (DEPTH < 2) $error("FIFO Depth must be at least 2");
  end
  // synthesis translate_on

endmodule
