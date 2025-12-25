import bus_matrix_pkg::*;

// -----------------------------------------------------------------------------
// File: bus_matrix_decoder.sv
// Module: bus_matrix_decoder
// Description:
//   Address decoder/firewall for a single Master within the Bus Matrix.
//   Determines which Slave to select based on the input address and checks
//   security permissions.
//
// Parameters:
//   - M_SLAVES: Number of slaves.
//   - ADDR_WIDTH: Width of the address bus.
//   - REGION_MAP_FLAT: Flattened array of `region_attr_t` defining memory map
//                      and security attributes for each slave.
//   - USE_DEFAULT_SLAVE: Enable routing to a default slave for unmatched addresses.
//   - DEFAULT_SLAVE_INDEX: Index of the default slave.
//
// Signals:
//   - addr_i: Input address from Master.
//   - valid_i: Indicates address is valid (request active).
//   - secure_i: Security level of the current transaction (1=Secure, 0=Non-Secure).
//   - slave_sel_o: One-hot vector selecting the target slave.
//   - dec_error_o: Asserted if address matches no region (and no default slave).
//   - sec_error_o: Asserted if access violates security attributes (e.g. NS->Secure).
// -----------------------------------------------------------------------------
module bus_matrix_decoder #(
    parameter int M_SLAVES = 2,
    parameter int ADDR_WIDTH = 32,
    parameter logic [M_SLAVES*66-1:0] REGION_MAP_FLAT = '0,
    parameter bit USE_DEFAULT_SLAVE = 0,
    parameter int DEFAULT_SLAVE_INDEX = 0
)(
    input  logic [ADDR_WIDTH-1:0] addr_i,
    input  logic                  valid_i,
    input  logic                  secure_i, // 1 = Secure Access, 0 = Non-Secure
    output logic [M_SLAVES-1:0]   slave_sel_o,
    output logic                  dec_error_o, // No slave mapped
    output logic                  sec_error_o  // Security violation
);

    // Unpack regions using generate to avoid complex procedural indexing
    logic [M_SLAVES-1:0][31:0] region_starts;
    logic [M_SLAVES-1:0][31:0] region_ends;
    logic [M_SLAVES-1:0]       region_secures;
    
    genvar i_gen;
    generate
        for (i_gen = 0; i_gen < M_SLAVES; i_gen++) begin : GEN_UNPACK
            assign region_starts[i_gen]  = REGION_MAP_FLAT[i_gen*66 + 34 +: 32];
            assign region_ends[i_gen]    = REGION_MAP_FLAT[i_gen*66 + 2 +: 32];
            assign region_secures[i_gen] = REGION_MAP_FLAT[i_gen*66 + 1];
        end
    endgenerate

    always_comb begin
        logic match_found;
        slave_sel_o = '0;
        dec_error_o = 1'b0;
        sec_error_o = 1'b0;
        match_found = 1'b0;
        
        if (valid_i) begin
            
            for (int i = 0; i < M_SLAVES; i++) begin
                if (!match_found && (addr_i >= region_starts[i]) && (addr_i <= region_ends[i])) begin
                    // Address Match
                    match_found = 1'b1;
                    
                    // Security Check
                    if (region_secures[i] && !secure_i) begin
                        sec_error_o = 1'b1; // Access Violation
                    end else begin
                        slave_sel_o[i] = 1'b1;
                    end
                end
            end
            
            if (!match_found) begin
                if (USE_DEFAULT_SLAVE) begin
                    slave_sel_o[DEFAULT_SLAVE_INDEX] = 1'b1;
                end else begin
                    dec_error_o = 1'b1;
                end
            end
        end
    end

endmodule
