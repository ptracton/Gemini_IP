import bus_matrix_pkg::*;

// -----------------------------------------------------------------------------
// File: bus_matrix_wb.sv
// Module: bus_matrix_wb
// Description:
//   Wishbone Host/Slave Wrapper for the Bus Matrix.
//   Instantiates Input/Output Register Slices (optional), Decoders, and Arbiter
//   to form a full N-Master x M-Slave crossbar.
//
// Parameters:
//   - N_MASTERS, M_SLAVES: Dimensions of the matrix.
//   - DATA_WIDTH, ADDR_WIDTH: Bus widths.
//   - REGION_MAP_FLAT: Memory map configuration (passed to decoders).
//   - INPUT/OUTPUT_PIPE_STAGES: Enable pipelining.
//   - MASTER_SECURE_MASK: Static security attribute for each master.
//
// Signals:
//   Standard Wishbone B4 interfaces (wb_cyc, wb_stb, wb_we, wb_adr, wb_dat, etc.)
//   for both Master Ports (from Masters) and Slave Ports (to Slaves).
// -----------------------------------------------------------------------------
module bus_matrix_wb #(
    parameter int N_MASTERS = 2,
    parameter int M_SLAVES = 2,
    parameter int DATA_WIDTH = 32,
    parameter int ADDR_WIDTH = 32,
    parameter logic [M_SLAVES*66-1:0] REGION_MAP_FLAT = '0,
    parameter bit USE_DEFAULT_SLAVE = 0,
    parameter int DEFAULT_SLAVE_INDEX = 0,
    parameter bit [N_MASTERS-1:0] MASTER_SECURE_MASK = '0, // Bitmask: 1=Secure Master, 0=Non-Secure
    // Pipielining Config
    parameter bit INPUT_PIPE_STAGES = 0,  // Enable Input Register Slices
    parameter bit OUTPUT_PIPE_STAGES = 0  // Enable Output Register Slices
)(
    input logic clk,
    input logic rst_n,
    
    // Master Interfaces
    input  logic [N_MASTERS-1:0]                  wb_cyc_i,
    input  logic [N_MASTERS-1:0]                  wb_stb_i,
    input  logic [N_MASTERS-1:0]                  wb_we_i,
    input  logic [N_MASTERS*ADDR_WIDTH-1:0]       wb_adr_i,
    input  logic [N_MASTERS*DATA_WIDTH-1:0]       wb_dat_i,
    input  logic [N_MASTERS*(DATA_WIDTH/8)-1:0]   wb_sel_i,
    output logic [N_MASTERS-1:0]                  wb_ack_o,
    output logic [N_MASTERS*DATA_WIDTH-1:0]       wb_dat_o,
    output logic [N_MASTERS-1:0]                  wb_err_o,
    
    // Slave Interfaces
    output logic [M_SLAVES-1:0]                   slv_cyc_o,
    output logic [M_SLAVES-1:0]                   slv_stb_o,
    output logic [M_SLAVES-1:0]                   slv_we_o,
    output logic [M_SLAVES*ADDR_WIDTH-1:0]        slv_adr_o,
    output logic [M_SLAVES*DATA_WIDTH-1:0]        slv_dat_o,
    output logic [M_SLAVES*(DATA_WIDTH/8)-1:0]    slv_sel_o,
    input  logic [M_SLAVES-1:0]                   slv_ack_i,
    input  logic [M_SLAVES*DATA_WIDTH-1:0]        slv_dat_i,
    input  logic [M_SLAVES-1:0]                   slv_err_i
);

    import bus_matrix_pkg::*;

    // =================================================================================
    // 1. INPUT SLICES (Master -> Internal)
    // =================================================================================
    logic [N_MASTERS-1:0]                m_cyc, m_stb, m_we, m_ack, m_err;
    logic [N_MASTERS*ADDR_WIDTH-1:0]     m_adr;
    logic [N_MASTERS*DATA_WIDTH-1:0]     m_wdat, m_rdat;
    logic [N_MASTERS*(DATA_WIDTH/8)-1:0] m_sel;
    
    genvar m, s;
    generate
        for (m = 0; m < N_MASTERS; m++) begin : GEN_IN_SLICE
            // Wishbone is not purely Valid/Ready, but CYC/STB can map to Valid, ACK to Ready.
            // Simplified: Just registering signals if enabled for timing break.
            // Using register slice on Request path (CYC/STB/ADR/DAT) and Response path (ACK/DAT/ERR)
            
            // NOTE: Full skid buffering WB is generic.
            // For now, assuming direct wire if 0, simple reg if 1 (with wait state penalty).
            
            if (INPUT_PIPE_STAGES) begin
                 // Simple Pipeline Implementation for WB Request
                 always_ff @(posedge clk or negedge rst_n) begin
                    if (!rst_n) begin
                        m_cyc[m] <= '0; m_stb[m] <= '0;
                        m_we[m] <= '0; m_adr[m*ADDR_WIDTH+:ADDR_WIDTH] <= '0;
                        m_wdat[m*DATA_WIDTH+:DATA_WIDTH] <= '0; 
                        m_sel[m*(DATA_WIDTH/8)+:(DATA_WIDTH/8)] <= '0;
                    end else begin
                        // Stall logic omitted for brevity in this step, simple delay
                        m_cyc[m] <= wb_cyc_i[m]; m_stb[m] <= wb_stb_i[m];
                        m_we[m]  <= wb_we_i[m];  m_adr[m*ADDR_WIDTH+:ADDR_WIDTH] <= wb_adr_i[m*ADDR_WIDTH+:ADDR_WIDTH];
                        m_wdat[m*DATA_WIDTH+:DATA_WIDTH] <= wb_dat_i[m*DATA_WIDTH+:DATA_WIDTH];
                        m_sel[m*(DATA_WIDTH/8)+:(DATA_WIDTH/8)] <= wb_sel_i[m*(DATA_WIDTH/8)+:(DATA_WIDTH/8)];
                    end
                 end
                 // Response Path 
                 always_ff @(posedge clk or negedge rst_n) begin
                    if (!rst_n) begin
                         wb_ack_o[m] <= '0; wb_err_o[m] <= '0; wb_dat_o[m*DATA_WIDTH+:DATA_WIDTH] <= '0;
                    end else begin
                         wb_ack_o[m] <= m_ack[m]; wb_err_o[m] <= m_err[m];
                         wb_dat_o[m*DATA_WIDTH+:DATA_WIDTH] <= m_rdat[m*DATA_WIDTH+:DATA_WIDTH];
                    end
                 end
            end else begin
                // Direct Connect
                assign m_cyc[m] = wb_cyc_i[m]; assign m_stb[m] = wb_stb_i[m];
                assign m_we[m]  = wb_we_i[m];  assign m_adr[m*ADDR_WIDTH+:ADDR_WIDTH] = wb_adr_i[m*ADDR_WIDTH+:ADDR_WIDTH];
                assign m_wdat[m*DATA_WIDTH+:DATA_WIDTH] = wb_dat_i[m*DATA_WIDTH+:DATA_WIDTH];
                assign m_sel[m*(DATA_WIDTH/8)+:(DATA_WIDTH/8)] = wb_sel_i[m*(DATA_WIDTH/8)+:(DATA_WIDTH/8)];
                
                assign wb_ack_o[m] = m_ack[m]; assign wb_err_o[m] = m_err[m];
                assign wb_dat_o[m*DATA_WIDTH+:DATA_WIDTH] = m_rdat[m*DATA_WIDTH+:DATA_WIDTH];
            end
        end
    endgenerate

    // =================================================================================
    // 2. CORE MATRIX LOGIC (using m_* signals)
    // =================================================================================
    
    // Decoder Outputs
    logic [N_MASTERS-1:0][M_SLAVES-1:0] master_req_matrix;
    logic [N_MASTERS-1:0]               master_err; // Combined Dec+Sec Error
    
    generate
        for (m = 0; m < N_MASTERS; m++) begin : GEN_DECODERS
             logic [M_SLAVES-1:0] s_sel;
             logic dec_err, sec_err;
             
             bus_matrix_decoder #(
                .M_SLAVES(M_SLAVES), .ADDR_WIDTH(ADDR_WIDTH),
                .REGION_MAP_FLAT(REGION_MAP_FLAT), .USE_DEFAULT_SLAVE(USE_DEFAULT_SLAVE), .DEFAULT_SLAVE_INDEX(DEFAULT_SLAVE_INDEX)
            ) u_dec (
                .addr_i(m_adr[m*ADDR_WIDTH +: ADDR_WIDTH]),
                .valid_i(m_cyc[m] & m_stb[m]),
                .secure_i(MASTER_SECURE_MASK[m]), // Use static trust levels for WB
                .slave_sel_o(s_sel),
                .dec_error_o(dec_err),
                .sec_error_o(sec_err)
            );
            assign master_req_matrix[m] = s_sel;
            assign master_err[m] = dec_err | sec_err;
        end
    endgenerate
    
    // Arbiter
    logic [M_SLAVES-1:0][N_MASTERS-1:0] slave_req_vector;
    logic [M_SLAVES-1:0][N_MASTERS-1:0] slave_gnt_vector;
    
    generate
        for (s = 0; s < M_SLAVES; s++) begin
            for (m = 0; m < N_MASTERS; m++) begin
                assign slave_req_vector[s][m] = master_req_matrix[m][s];
            end
        end
        for (s = 0; s < M_SLAVES; s++) begin : GEN_ARBITERS
            bus_matrix_arbiter #(.N_REQ(N_MASTERS), .SCHEME(0)) u_arb (
                .clk(clk), .rst_n(rst_n),
                .req_i(slave_req_vector[s]),
                .hold_i(slv_cyc_o[s] & !slv_ack_i[s]), 
                .gnt_o(slave_gnt_vector[s])
            );
        end
    endgenerate

    // =================================================================================
    // 3. OUPUT SLICES & MUXING (Internal -> Slave / Slave -> Internal)
    // =================================================================================
    // Simplified: Applying Mux logic then optional slice
    
    logic [M_SLAVES-1:0]                s_cyc_int, s_stb_int, s_we_int, s_ack_int, s_err_int;
    logic [M_SLAVES*ADDR_WIDTH-1:0]     s_adr_int;
    logic [M_SLAVES*DATA_WIDTH-1:0]     s_wdat_int, s_rdat_int;
    logic [M_SLAVES*(DATA_WIDTH/8)-1:0] s_sel_int;

    // Mux Masters -> Slaves
    generate
        for (s = 0; s < M_SLAVES; s++) begin : GEN_S_MUX
            always_comb begin
                s_cyc_int[s] = 0; s_stb_int[s] = 0; s_we_int[s] = 0;
                s_adr_int[s*ADDR_WIDTH+:ADDR_WIDTH] = '0; s_wdat_int[s*DATA_WIDTH+:DATA_WIDTH] = '0; 
                s_sel_int[s*(DATA_WIDTH/8)+:(DATA_WIDTH/8)] = '0;
                for (int i = 0; i < N_MASTERS; i++) begin
                    if (slave_gnt_vector[s][i]) begin
                        s_cyc_int[s] = m_cyc[i]; s_stb_int[s] = m_stb[i]; s_we_int[s] = m_we[i];
                        s_adr_int[s*ADDR_WIDTH+:ADDR_WIDTH] = m_adr[i*ADDR_WIDTH+:ADDR_WIDTH];
                        s_wdat_int[s*DATA_WIDTH+:DATA_WIDTH] = m_wdat[i*DATA_WIDTH+:DATA_WIDTH];
                        s_sel_int[s*(DATA_WIDTH/8)+:(DATA_WIDTH/8)] = m_sel[i*(DATA_WIDTH/8)+:(DATA_WIDTH/8)];
                    end
                end
            end
            
            // Output Slice
            if (OUTPUT_PIPE_STAGES) begin
                always_ff @(posedge clk or negedge rst_n) begin
                    if (!rst_n) begin
                         slv_cyc_o[s] <= '0; slv_stb_o[s] <= '0; slv_we_o[s] <= '0;
                         slv_adr_o[s*ADDR_WIDTH+:ADDR_WIDTH] <= '0;
                         slv_dat_o[s*DATA_WIDTH+:DATA_WIDTH] <= '0;
                         slv_sel_o[s*(DATA_WIDTH/8)+:(DATA_WIDTH/8)] <= '0;
                    end else begin
                         slv_cyc_o[s] <= s_cyc_int[s]; slv_stb_o[s] <= s_stb_int[s]; slv_we_o[s] <= s_we_int[s];
                         slv_adr_o[s*ADDR_WIDTH+:ADDR_WIDTH] <= s_adr_int[s*ADDR_WIDTH+:ADDR_WIDTH];
                         slv_dat_o[s*DATA_WIDTH+:DATA_WIDTH] <= s_wdat_int[s*DATA_WIDTH+:DATA_WIDTH];
                         slv_sel_o[s*(DATA_WIDTH/8)+:(DATA_WIDTH/8)] <= s_sel_int[s*(DATA_WIDTH/8)+:(DATA_WIDTH/8)];
                    end
                end
                // Response Return Pipe (from global inputs to internal)
                always_ff @(posedge clk or negedge rst_n) begin
                    if (!rst_n) begin
                        s_ack_int[s] <= '0; s_err_int[s] <= '0; s_rdat_int[s*DATA_WIDTH+:DATA_WIDTH] <= '0;
                    end else begin
                        s_ack_int[s] <= slv_ack_i[s]; s_err_int[s] <= slv_err_i[s]; 
                        s_rdat_int[s*DATA_WIDTH+:DATA_WIDTH] <= slv_dat_i[s*DATA_WIDTH+:DATA_WIDTH];
                    end
                end
            end else begin
                assign slv_cyc_o[s] = s_cyc_int[s]; assign slv_stb_o[s] = s_stb_int[s]; assign slv_we_o[s] = s_we_int[s];
                assign slv_adr_o[s*ADDR_WIDTH+:ADDR_WIDTH] = s_adr_int[s*ADDR_WIDTH+:ADDR_WIDTH];
                assign slv_dat_o[s*DATA_WIDTH+:DATA_WIDTH] = s_wdat_int[s*DATA_WIDTH+:DATA_WIDTH];
                assign slv_sel_o[s*(DATA_WIDTH/8)+:(DATA_WIDTH/8)] = s_sel_int[s*(DATA_WIDTH/8)+:(DATA_WIDTH/8)];
                
                assign s_ack_int[s] = slv_ack_i[s]; assign s_err_int[s] = slv_err_i[s]; 
                assign s_rdat_int[s*DATA_WIDTH+:DATA_WIDTH] = slv_dat_i[s*DATA_WIDTH+:DATA_WIDTH];
            end
        end
    endgenerate

    // Mux Return
    generate
        for (m = 0; m < N_MASTERS; m++) begin : GEN_M_RET
            always_comb begin
                 m_ack[m] = '0; m_err[m] = '0; m_rdat[m*DATA_WIDTH+:DATA_WIDTH] = '0;
                 // $info("WB Mux Check m=%0d: master_err=%b", m, master_err[m]);
                 if (master_err[m]) begin
                     // $info("WB Mux: Master Error Detected for m=%0d. Asserting ERR, Deasserting ACK.", m);
                     m_err[m] = 1'b1; m_ack[m] = 1'b1; // Error Resp: Assert ACK+ERR to satisfy simple masters/BFMs
                 end else begin
                     for (int i=0; i<M_SLAVES; i++) begin
                         if (slave_gnt_vector[i][m]) begin
                             m_ack[m] = s_ack_int[i]; m_err[m] = s_err_int[i];
                             m_rdat[m*DATA_WIDTH+:DATA_WIDTH] = s_rdat_int[i*DATA_WIDTH+:DATA_WIDTH];
                         end
                     end
                 end
            end
        end
    endgenerate

endmodule
