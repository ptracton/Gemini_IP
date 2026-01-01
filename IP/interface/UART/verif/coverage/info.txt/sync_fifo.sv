//      // verilator_coverage annotation
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
%000000     input logic clk,
%000000     input logic rst_n,  // Active low reset
%000000     input logic flush,  // Synchronous flush
        
            // Write Interface
%000000     input  logic             push,
%000000     input  logic [WIDTH-1:0] data_in,
%000000     output logic             full,
%000000     output logic             almost_full,
%000000     output logic             overflow,
        
            // Read Interface
%000000     input  logic             pop,
%000000     output logic [WIDTH-1:0] data_out,
%000000     output logic             empty,
%000000     output logic             almost_empty,
%000000     output logic             underflow,
        
            // Status
%000000     output logic [$clog2(DEPTH):0] level,
%000000     output logic [$clog2(DEPTH):0] max_level
        );
        
          // Signal Declarations
%000000   (* ram_style = "block" *)logic [        WIDTH-1:0] mem        [DEPTH-1:0];
%000000   logic [$clog2(DEPTH)-1:0] wr_ptr;
%000000   logic [$clog2(DEPTH)-1:0] rd_ptr;
%000000   logic [  $clog2(DEPTH):0] count;
%000000   logic [  $clog2(DEPTH):0] next_count;
        
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
%000000   always_ff @(posedge clk or negedge rst_n) begin
%000000     if (!rst_n) begin
%000000       wr_ptr   <= '0;
%000000       overflow <= 1'b0;
%000000     end else if (flush) begin
%000000       wr_ptr   <= '0;
%000000       overflow <= 1'b0;
%000000     end else begin
%000000       if (push && full) begin
%000000         overflow <= 1'b1;
              end
%000000       if (push && !full) begin
%000000         mem[wr_ptr] <= data_in;
%000000         if (wr_ptr == PTR_MAX) wr_ptr <= '0;
%000000         else wr_ptr <= wr_ptr + 1;
              end
            end
          end
        
          // Read Logic
%000000   always_ff @(posedge clk or negedge rst_n) begin
%000000     if (!rst_n) begin
%000000       rd_ptr    <= '0;
%000000       underflow <= 1'b0;
%000000     end else if (flush) begin
%000000       rd_ptr    <= '0;
%000000       underflow <= 1'b0;
%000000     end else begin
%000000       if (pop && empty) begin
%000000         underflow <= 1'b1;
              end
%000000       if (pop && !empty) begin
%000000         if (rd_ptr == PTR_MAX) rd_ptr <= '0;
%000000         else rd_ptr <= rd_ptr + 1;
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
%000000   always_comb begin
%000000     next_count = count;
%000000     case ({
%000000       push && !full, pop && !empty
            })
%000000       2'b10:   next_count = count + 1;
%000000       2'b01:   next_count = count - 1;
%000000       default: next_count = count;
            endcase
          end
        
%000000   always_ff @(posedge clk or negedge rst_n) begin
%000000     if (!rst_n) begin
%000000       count <= '0;
%000000       max_level <= '0;
%000000     end else if (flush) begin
%000000       count <= '0;
%000000       max_level <= '0;
%000000     end else begin
%000000       count <= next_count;
%000000       if (next_count > max_level) max_level <= next_count;
            end
          end
        
          // Simulation-only assertions
          // synthesis translate_off
%000000   initial begin
%000000     if (DEPTH < 2) $error("FIFO Depth must be at least 2");
          end
          // synthesis translate_on
        
        endmodule
        
