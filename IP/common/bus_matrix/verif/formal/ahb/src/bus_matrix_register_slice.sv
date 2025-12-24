// -----------------------------------------------------------------------------
// File: bus_matrix_register_slice.sv
// Module: bus_matrix_register_slice
// Description:
//   A generic "Skid Buffer" or Register Slice for breaking timing paths
//   on valid/ready or req/ack interfaces.
//
// Parameters:
//   - DATA_WIDTH: Width of the data payload.
//
// Signals:
//   - valid_i / ready_o: Input handshake interface.
//   - data_i: Input payload.
//   - valid_o / ready_i: Output handshake interface.
//   - data_o: Output payload.
//
// Behavior:
//   Provides full registration (forward & backward) to isolate timing between
//   input and output stages without losing throughput (bubbles).
// -----------------------------------------------------------------------------
module bus_matrix_register_slice #(
    parameter int WIDTH = 32,
    parameter bit FORWARD_REGISTER = 0,  // Register valid/data path
    parameter bit BACKWARD_REGISTER = 0  // Register ready path (skid buffer)
)(
    input  logic             clk,
    input  logic             rst_n,
    
    // Upstream (Source)
    input  logic [WIDTH-1:0] data_i,
    input  logic             valid_i,
    output logic             ready_o,
    
    // Downstream (Sink)
    output logic [WIDTH-1:0] data_o,
    output logic             valid_o,
    input  logic             ready_i
);

    // Default Passthrough
    logic [WIDTH-1:0] s_data;
    logic             s_valid;
    logic             s_ready;
    
    // ---------------------------------------------------------
    // 1. Forward Register Logic (Break Timing on Valid/Data)
    // ---------------------------------------------------------
    // Logic: If sink not ready, hold data. If source valid, capture.
    
    generate
        if (FORWARD_REGISTER) begin : GEN_FWD
            logic [WIDTH-1:0] fwd_data_reg;
            logic             fwd_valid_reg;
            
            always_ff @(posedge clk or negedge rst_n) begin
                if (!rst_n) begin
                    fwd_valid_reg <= 1'b0;
                    fwd_data_reg  <= '0;
                end else begin
                    if (ready_o) begin
                        fwd_valid_reg <= valid_i;
                        fwd_data_reg  <= data_i;
                    end
                end
            end
            
            // Ready to accept if downstream is ready or we have space (bubble)
            // If valid_reg is 0, we are ready. If downstream ready, we are ready.
            // Wait, standard full handshake register:
            assign ready_o = (!fwd_valid_reg) || s_ready;
            
            assign s_valid = fwd_valid_reg;
            assign s_data  = fwd_data_reg;
        end else begin : GEN_NO_FWD
            assign s_valid = valid_i;
            assign s_data  = data_i;
            assign ready_o = s_ready;
        end
    endgenerate

    // ---------------------------------------------------------
    // 2. Backward Register Logic (Break Timing on Ready) - Skid Buffer
    // ---------------------------------------------------------
    // Logic: Insert buffer to allow 'ready_o' to be registered output.
    // If we use forward register only, ready_o is combinatorial from ready_i.
    // If backward register, we need a buffer to absorb data when valid_i=1 but ready_i=0
    
    generate 
        if (BACKWARD_REGISTER) begin : GEN_BWD
            // Simple Skid Buffer Implementation
            logic [WIDTH-1:0] buf_data;
            logic             buf_valid;
            
            always_ff @(posedge clk or negedge rst_n) begin
                if (!rst_n) begin
                    buf_valid <= 1'b0;
                    buf_data  <= '0;
                end else begin
                   if (s_valid && !ready_i && !buf_valid) begin
                       // Skid: Sink not ready, but Source gave data. Store it in buffer.
                       buf_valid <= 1'b1;
                       buf_data  <= s_data;
                   end else if (ready_i) begin
                       // Sink ready, drain buffer
                       buf_valid <= 1'b0; 
                   end
                end
            end
            
            assign s_ready = !buf_valid; // We can accept if buffer empty
            
            // Output Mux
            assign valid_o = buf_valid ? 1'b1 : s_valid;
            assign data_o  = buf_valid ? buf_data : s_data;
            
        end else begin : GEN_NO_BWD
            assign valid_o = s_valid;
            assign data_o  = s_data;
            assign s_ready = ready_i;
        end
    endgenerate

endmodule
