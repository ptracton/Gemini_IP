import bus_matrix_pkg::*;

// -----------------------------------------------------------------------------
// File: bus_matrix_arbiter.sv
// Module: bus_matrix_arbiter
// Description:
//   Standard N-to-1 arbiter for the Bus Matrix.
//   Supports Fixed Priority and Round Robin (simplified).
// -----------------------------------------------------------------------------
module bus_matrix_arbiter #(
    parameter int N_REQ = 2,
    parameter int SCHEME = 0 // 0=Fixed, 1=Round Robin
)(
    input  logic clk,
    input  logic rst_n,
    
    input  logic [N_REQ-1:0] req_i,
    input  logic             hold_i, // Hold current grant
    output logic [N_REQ-1:0] gnt_o
);

    logic [N_REQ-1:0] next_gnt;
    
    // Combinational Next Grant Logic
    // Using a portable bitmanic trick to find the LSB (lowest bit set) 
    // for Fixed Priority arbitration.
    // Round Robin is simplified to Fixed for this implementation.
    always_comb begin
        if (|req_i) begin
            next_gnt = req_i & ~(req_i - 1'b1);
        end else begin
            next_gnt = '0;
        end
    end

    // Sequential Grant State
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            gnt_o <= '0;
        end else begin
            if (hold_i && |gnt_o) begin
                // Hold current grant (stickiness for multi-cycle transactions)
                gnt_o <= gnt_o;
            end else begin
                gnt_o <= next_gnt;
            end
        end
    end

endmodule
