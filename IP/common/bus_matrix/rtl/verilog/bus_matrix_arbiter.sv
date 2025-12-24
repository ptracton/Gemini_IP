// -----------------------------------------------------------------------------
// File: bus_matrix_arbiter.sv
// Module: bus_matrix_arbiter
// Description:
//   Arbiter module for the Bus Matrix. Resolves contention when multiple
//   masters request access to the same slave.
//
// Parameters:
//   - N_REQ: Number of requestors (Masters).
//   - SCHEME: Arbitration scheme (0 = Fixed Priority, 1 = Round Robin [ToDo]).
//
// Signals:
//   - req_i: Input request vector from masters.
//   - hold_i: Signal to hold the current grant (e.g., during a burst).
//   - gnt_o: One-hot grant vector indicating which master has access.
//
// Logic:
//   Currently implements Fixed Priority arbitration where LSB has highest priority.
//   Includes a Registered Grant output (1-cycle latency).
// -----------------------------------------------------------------------------
module bus_matrix_arbiter #(
    parameter int N_REQ = 2,
    parameter bit SCHEME = 0 // 0 = Fixed Priority, 1 = Round Robin
)(
    input  logic             clk,
    input  logic             rst_n,
    input  logic [N_REQ-1:0] req_i,
    input  logic             hold_i, // Hold current grant
    output logic [N_REQ-1:0] gnt_o
);

    logic [N_REQ-1:0] masked_req;
    logic [N_REQ-1:0] next_gnt;
    logic [N_REQ-1:0] priority_mask;
    
    // Fixed Priority Logic (LSB has highest priority)
    function automatic logic [N_REQ-1:0] fixed_pri_arb(logic [N_REQ-1:0] req);
        logic [N_REQ-1:0] gnt;
        // Priority 0 = LSB.
        // Grant[i] = Req[i] AND NOT (Req[i-1] OR ... Req[0])
        // Efficient way: gnt = req & ((~req) + 1) -- assuming 1-hot target
        // But we want the lowest bit set.
        // 'req & -req' gives the LSB set as 1-hot.
        gnt = req & (-req); 
        return gnt;
    endfunction

    // Round Robin State
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            priority_mask <= '1;
            gnt_o <= '0;
        end else begin
            if (hold_i && |gnt_o) begin
                // Hold current grant
                gnt_o <= gnt_o;
            end else begin
                gnt_o <= next_gnt;
                
                // Rotate priority mask on new grant
                if (SCHEME && |next_gnt) begin
                    // Simple rotation: Mask out bits up to and including the granted bit
                    // This is a simplified RR; full implementation would require a barrel shifter or similar
                    // For N_REQ small, this is fine.
                    // Implementation: If bit k is granted, next cycle priority starts at k+1
                    // We can achieve this by having a pointer.
                    // Let's use a standard trick: Double the request vector
                end
            end
        end
    end

    // Combinational Next Grant Logic
    always_comb begin
        if (SCHEME == 0) begin
            // Fixed Priority
            next_gnt = fixed_pri_arb(req_i);
        end else begin
            // Round Robin (Simplified for now, effectively fixed for this step, will enhance)
            // Ideally use a generated arbiter or masked approach
            // For now, defaulting to basic priority arbiter to ensure synthesizability
            next_gnt = fixed_pri_arb(req_i);
        end
    end

endmodule
