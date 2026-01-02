
/*
 * File: sync_fifo.sv
 * Description: Synchronous FIFO with configurable width and depth.
 * Author: Gemini-3 AI
 * License: MIT
 */

module sync_fifo #(
    parameter int WIDTH = 32,
    parameter int DEPTH = 16,
    parameter bit FWFT_MODE = 0,
    parameter int ALMOST_FULL_THRESH = DEPTH - 1,
    parameter int ALMOST_EMPTY_THRESH = 1
) (
    input logic clk,
    input logic rst_n,  // Active low reset
    input logic flush,  // Synchronous flush

    // Write Interface
    input  logic             push,
    input  logic [WIDTH-1:0] data_in,
    output logic             full,
    output logic             almost_full,
    output logic             overflow,

    // Read Interface
    input  logic             pop,
    output logic [WIDTH-1:0] data_out,
    output logic             empty,
    output logic             almost_empty,
    output logic             underflow,

    // Status
    output logic [$clog2(DEPTH):0] level,
    output logic [$clog2(DEPTH):0] max_level
);

  // Signal Declarations
  (* ram_style = "block" *)logic [        WIDTH-1:0] mem        [DEPTH-1:0];
  logic [$clog2(DEPTH)-1:0] wr_ptr;
  logic [$clog2(DEPTH)-1:0] rd_ptr;
  logic [  $clog2(DEPTH):0] count;
  logic [  $clog2(DEPTH):0] next_count;

  localparam logic [$clog2(DEPTH)-1:0] PTR_MAX = ($clog2(DEPTH))'(DEPTH - 1);

  // Full/Empty Status
  /* verilator lint_off WIDTHEXPAND */
  assign full         = (count == DEPTH);
  assign empty        = (count == 0);
  assign level        = count;
  assign almost_full  = (count >= ALMOST_FULL_THRESH);
  assign almost_empty = (count <= ALMOST_EMPTY_THRESH);
  /* verilator lint_on WIDTHEXPAND */

  // Write Logic
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      wr_ptr   <= '0;
      overflow <= 1'b0;
    end else if (flush) begin
      wr_ptr   <= '0;
      overflow <= 1'b0;
    end else begin
      if (push && full) begin
        overflow <= 1'b1;
      end
      if (push && !full) begin
        mem[wr_ptr] <= data_in;
        if (wr_ptr == PTR_MAX) wr_ptr <= '0;
        else wr_ptr <= wr_ptr + 1;
      end
    end
  end

  // Read Logic
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      rd_ptr    <= '0;
      underflow <= 1'b0;
    end else if (flush) begin
      rd_ptr    <= '0;
      underflow <= 1'b0;
    end else begin
      if (pop && empty) begin
        underflow <= 1'b1;
      end
      if (pop && !empty) begin
        if (rd_ptr == PTR_MAX) rd_ptr <= '0;
        else rd_ptr <= rd_ptr + 1;
      end
    end
  end

  // Data Output Logic (FWFT vs Standard)
  generate
    if (FWFT_MODE) begin : gen_fwft
      assign data_out = mem[rd_ptr];
    end else begin : gen_standard
      always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
          data_out <= '0;  // Registered output reset
        end else if (flush) begin
          data_out <= '0;
        end else if (pop && !empty) begin
          data_out <= mem[rd_ptr];
        end
      end
    end
  endgenerate

  // Counter Logic & Max Level
  always_comb begin
    next_count = count;
    case ({
      push && !full, pop && !empty
    })
      2'b10:   next_count = count + 1;
      2'b01:   next_count = count - 1;
      default: next_count = count;
    endcase
  end

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      count <= '0;
      max_level <= '0;
    end else if (flush) begin
      count <= '0;
      max_level <= '0;
    end else begin
      count <= next_count;
      if (next_count > max_level) max_level <= next_count;
    end
  end

  // Simulation-only assertions
  // synthesis translate_off
  initial begin
    if (DEPTH < 2) $error("FIFO Depth must be at least 2");
  end
  // synthesis translate_on

endmodule
