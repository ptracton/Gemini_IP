//-------------------------------------------------------------------------------
// File: bus_matrix_props.sv
// Description: SVA Properties for Bus Matrix IP
//-------------------------------------------------------------------------------

module axi_matrix_props #(
    parameter int N_MASTERS = 2,
    parameter int M_SLAVES = 2
)(
    input logic aclk,
    input logic aresetn,
    
    // Address signals
    input logic [N_MASTERS-1:0] awvalid_i,
    input logic [N_MASTERS-1:0] awready_o,
    input logic [N_MASTERS*3-1:0] awprot_i,
    
    input logic [N_MASTERS-1:0] arvalid_i,
    input logic [N_MASTERS-1:0] arready_o,
    input logic [N_MASTERS*3-1:0] arprot_i,

    // Internal Grant signals (bound later)
    input logic [M_SLAVES-1:0][N_MASTERS-1:0] slave_aw_gnt_vector,
    input logic [M_SLAVES-1:0][N_MASTERS-1:0] slave_ar_gnt_vector,
    
    // Security info
    input logic [M_SLAVES-1:0] region_secures
);

    genvar m, s;
    generate
        for (s = 0; s < M_SLAVES; s++) begin : GEN_SLAVE_PROPS
            // 1. Mutual Exclusion: Only one master granted per slave
            always @(posedge aclk) begin
                if (aresetn) begin
                    assert($countones(slave_aw_gnt_vector[s]) <= 1);
                    assert($countones(slave_ar_gnt_vector[s]) <= 1);
                end
            end
        end

        for (m = 0; m < N_MASTERS; m++) begin : GEN_MASTER_PROPS
            // 2. Handshake Integrity
            always @(posedge aclk) begin
                if (aresetn) begin
                    if ($past(awvalid_i[m] && !awready_o[m])) assert(awvalid_i[m]);
                    if ($past(arvalid_i[m] && !arready_o[m])) assert(arvalid_i[m]);
                end
            end
        end
    endgenerate

endmodule

module ahb_matrix_props #(
    parameter int N_MASTERS = 2,
    parameter int M_SLAVES = 2
)(
    input logic HCLK,
    input logic HRESETn,
    
    input logic [N_MASTERS-1:0] HSEL_i,
    input logic [N_MASTERS*2-1:0] HTRANS_i,
    input logic [N_MASTERS-1:0] HREADYOUT_o,

    // Internal signals
    input logic [M_SLAVES-1:0][N_MASTERS-1:0] slave_gnt_vector_addr
);

    genvar s;
    generate
        for (s = 0; s < M_SLAVES; s++) begin : GEN_SLAVE_PROPS
            // Mutual Exclusion
            always @(posedge HCLK) begin
                if (HRESETn) begin
                    assert($countones(slave_gnt_vector_addr[s]) <= 1);
                end
            end
        end
    endgenerate

endmodule

module wb_matrix_props #(
    parameter int N_MASTERS = 2,
    parameter int M_SLAVES = 2
)(
    input logic clk,
    input logic rst_n,
    
    input logic [N_MASTERS-1:0] wb_cyc_i,
    input logic [N_MASTERS-1:0] wb_stb_i,
    input logic [N_MASTERS-1:0] wb_ack_o,

    // Internal signals
    input logic [M_SLAVES-1:0][N_MASTERS-1:0] slave_gnt_vector
);

    genvar s;
    generate
        for (s = 0; s < M_SLAVES; s++) begin : GEN_SLAVE_PROPS
            // Mutual Exclusion
            always @(posedge clk) begin
                if (rst_n) begin
                    assert($countones(slave_gnt_vector[s]) <= 1);
                end
            end
        end
    endgenerate

endmodule
