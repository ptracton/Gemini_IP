import bus_matrix_pkg::*;

// -----------------------------------------------------------------------------
// File: bus_matrix_axi.sv
// Module: bus_matrix_axi
// Description:
//   AXI4-Lite Wrapper for the Bus Matrix.
//   Manages two independent matrices for Write Address/Data (AW/W/B) and
//   Read Address/Data (AR/R) channels.
//   Implements transaction locking to ensure ordering (Write Address matches Write Data).
//
// Parameters:
//   - N_MASTERS, M_SLAVES: Dimensions.
//   - DATA_WIDTH, ADDR_WIDTH: Bus widths.
//   - REGION_MAP_FLAT: Memory map configuration.
//
// Signals:
//   Standard AXI4-Lite interfaces (AWADDR, AWVALID, WDATA, WVALID, BRESP, etc.)
// -----------------------------------------------------------------------------
module bus_matrix_axi #(
    parameter int N_MASTERS = 2,
    parameter int M_SLAVES = 2,
    parameter int DATA_WIDTH = 32,
    parameter int ADDR_WIDTH = 32,
    parameter logic [M_SLAVES*66-1:0] REGION_MAP_FLAT = '0,
    parameter bit USE_DEFAULT_SLAVE = 0,
    parameter int DEFAULT_SLAVE_INDEX = 0,
    parameter bit INPUT_PIPE_STAGES = 0,
    parameter bit OUTPUT_PIPE_STAGES = 0
) (
    input logic aclk,
    input logic aresetn,

    // -----------------------------------------------------------------------
    // Master Interfaces (Slave Ports on Matrix) - "m_axi_*"
    // -----------------------------------------------------------------------
    // Write Address
    input  logic [N_MASTERS*ADDR_WIDTH-1:0] awaddr_i,
    input  logic [         N_MASTERS*3-1:0] awprot_i,   // Added AXI Protections
    input  logic [           N_MASTERS-1:0] awvalid_i,
    output logic [           N_MASTERS-1:0] awready_o,

    // Write Data (Assumes Lite: no WID, WLAST ignored/implicit)
    input  logic [    N_MASTERS*DATA_WIDTH-1:0] wdata_i,
    input  logic [N_MASTERS*(DATA_WIDTH/8)-1:0] wstrb_i,
    input  logic [               N_MASTERS-1:0] wvalid_i,
    output logic [               N_MASTERS-1:0] wready_o,

    // Write Response
    output logic [N_MASTERS*2-1:0] bresp_o,
    output logic [  N_MASTERS-1:0] bvalid_o,
    input  logic [  N_MASTERS-1:0] bready_i,

    // Read Address
    input  logic [N_MASTERS*ADDR_WIDTH-1:0] araddr_i,
    input  logic [         N_MASTERS*3-1:0] arprot_i,   // Added AXI Protections
    input  logic [           N_MASTERS-1:0] arvalid_i,
    output logic [           N_MASTERS-1:0] arready_o,

    // Read Data
    output logic [N_MASTERS*DATA_WIDTH-1:0] rdata_o,
    output logic [         N_MASTERS*2-1:0] rresp_o,
    output logic [           N_MASTERS-1:0] rvalid_o,
    input  logic [           N_MASTERS-1:0] rready_i,

    // -----------------------------------------------------------------------
    // Slave Interfaces (Master Ports on Matrix) - "s_axi_*"
    // -----------------------------------------------------------------------
    // Write Address
    output logic [M_SLAVES*ADDR_WIDTH-1:0] s_awaddr_o,
    output logic [         M_SLAVES*3-1:0] s_awprot_o,
    output logic [           M_SLAVES-1:0] s_awvalid_o,
    input  logic [           M_SLAVES-1:0] s_awready_i,

    // Write Data
    output logic [    M_SLAVES*DATA_WIDTH-1:0] s_wdata_o,
    output logic [M_SLAVES*(DATA_WIDTH/8)-1:0] s_wstrb_o,
    output logic [               M_SLAVES-1:0] s_wvalid_o,
    input  logic [               M_SLAVES-1:0] s_wready_i,

    // Write Response
    input  logic [M_SLAVES*2-1:0] s_bresp_i,
    input  logic [  M_SLAVES-1:0] s_bvalid_i,
    output logic [  M_SLAVES-1:0] s_bready_o,

    // Read Address
    output logic [M_SLAVES*ADDR_WIDTH-1:0] s_araddr_o,
    output logic [         M_SLAVES*3-1:0] s_arprot_o,
    output logic [           M_SLAVES-1:0] s_arvalid_o,
    input  logic [           M_SLAVES-1:0] s_arready_i,

    // Read Data
    input  logic [M_SLAVES*DATA_WIDTH-1:0] s_rdata_i,
    input  logic [         M_SLAVES*2-1:0] s_rresp_i,
    input  logic [           M_SLAVES-1:0] s_rvalid_i,
    output logic [           M_SLAVES-1:0] s_rready_o
);



  // Lock State Machine Enums
  typedef enum logic [1:0] {
    LOCK_IDLE,
    LOCK_W_PHASE,
    LOCK_B_PHASE
  } lock_aw_t;
  typedef enum logic {
    LOCK_IDLE_R,
    LOCK_R_PHASE
  } lock_ar_t;

  // =========================================================================================================
  // WRITE PATH (AW + W + B)
  // =========================================================================================================

  // 1. Write Address Decoder
  // ---------------------------------------------------------
  // Channels
  logic [N_MASTERS-1:0][M_SLAVES-1:0] master_aw_req_matrix;
  logic [N_MASTERS-1:0]               master_aw_err;
  logic [N_MASTERS-1:0][M_SLAVES-1:0] master_ar_req_matrix;
  logic [N_MASTERS-1:0]               master_ar_err;

  genvar m, s;
  generate
    for (m = 0; m < N_MASTERS; m++) begin : GEN_AW_DECODERS
      logic [M_SLAVES-1:0] sel;
      logic dec_err, sec_err;
      bus_matrix_decoder #(
          .M_SLAVES(M_SLAVES),
          .ADDR_WIDTH(ADDR_WIDTH),
          .REGION_MAP_FLAT(REGION_MAP_FLAT),
          .USE_DEFAULT_SLAVE(USE_DEFAULT_SLAVE),
          .DEFAULT_SLAVE_INDEX(DEFAULT_SLAVE_INDEX)
      ) u_dec_aw (
          .addr_i(awaddr_i[m*ADDR_WIDTH+:ADDR_WIDTH]),
          .valid_i(awvalid_i[m]),
          .secure_i(!awprot_i[m*3+1]),  // PROT[1]=0 is Secure
          .slave_sel_o(sel),
          .dec_error_o(dec_err),
          .sec_error_o(sec_err)
      );
      assign master_aw_req_matrix[m] = sel;
      assign master_aw_err[m] = dec_err | sec_err;
    end
  endgenerate

  // 2. Write Arbiter & Transaction Locking
  // ---------------------------------------------------------
  logic [M_SLAVES-1:0][N_MASTERS-1:0] slave_aw_req_vector;
  logic [M_SLAVES-1:0][N_MASTERS-1:0] slave_aw_gnt_vector;

  // To maintain transaction integrity, we must hold the grant 
  // from AW Valid -> B Valid/Ready Handshake.
  // Lock logic: Set lock on AW Shake, Release lock on B Shake.

  logic [M_SLAVES-1:0] aw_lock;

  // Transpose
  generate
    for (s = 0; s < M_SLAVES; s++) begin : GEN_AW_REQ_VEC_S
      for (m = 0; m < N_MASTERS; m++) begin : GEN_AW_REQ_VEC_M
        assign slave_aw_req_vector[s][m] = master_aw_req_matrix[m][s];
      end
    end
  endgenerate

  generate
    for (s = 0; s < M_SLAVES; s++) begin : GEN_AW_ARBITERS

      // Lock State Machine
      lock_aw_t lock_state, next_lock_state;

      always_ff @(posedge aclk or negedge aresetn) begin
        if (!aresetn) lock_state <= LOCK_IDLE;
        else lock_state <= next_lock_state;
      end

      always_comb begin
        next_lock_state = lock_state;
        case (lock_state)
          LOCK_IDLE:
          if (s_awvalid_o[s] && s_awready_i[s]) next_lock_state = LOCK_W_PHASE;  // AW accepted
          LOCK_W_PHASE:
          if (s_wvalid_o[s] && s_wready_i[s]) next_lock_state = LOCK_B_PHASE;  // W accepted
          LOCK_B_PHASE:
          if (s_bvalid_i[s] && s_bready_o[s]) next_lock_state = LOCK_IDLE;  // B accepted
          default: next_lock_state = LOCK_IDLE;
        endcase
      end

      // For simplicty in AXI Lite, we assume AW and W come roughly together or we just lock until B done.
      assign aw_lock[s] = (lock_state != LOCK_IDLE) || (s_awvalid_o[s] && !s_awready_i[s]); // Hold if busy or requesting

      bus_matrix_arbiter #(
          .N_REQ (N_MASTERS),
          .SCHEME(0)
      ) u_arb_aw (
          .clk(aclk),
          .rst_n(aresetn),
          .req_i(slave_aw_req_vector[s]),
          .hold_i(aw_lock[s]),  // Hold grant during transaction
          .gnt_o(slave_aw_gnt_vector[s])
      );
    end
  endgenerate

  // 3. Write Muxing (AW & W Channels: Master -> Slave)
  // ---------------------------------------------------------
  generate
    for (s = 0; s < M_SLAVES; s++) begin : GEN_W_MUX
      always_comb begin
        s_awaddr_o[s*ADDR_WIDTH+:ADDR_WIDTH] = '0;
        s_awprot_o[s*3+:3] = '0;
        s_awvalid_o[s] = 1'b0;
        s_wdata_o[s*DATA_WIDTH+:DATA_WIDTH] = '0;
        s_wstrb_o[s*(DATA_WIDTH/8)+:(DATA_WIDTH/8)] = '0;
        s_wvalid_o[s] = 1'b0;
        s_bready_o[s] = 1'b0;  // Route BREADY too

        for (int i = 0; i < N_MASTERS; i++) begin
          if (slave_aw_gnt_vector[s][i]) begin
            s_awvalid_o[s] = awvalid_i[i];
            s_awaddr_o[s*ADDR_WIDTH+:ADDR_WIDTH] = awaddr_i[i*ADDR_WIDTH+:ADDR_WIDTH];
            s_awprot_o[s*3+:3] = awprot_i[i*3+:3];

            // We also route W and Bready based on AW arbitration (Assuming Atomic/Locked)
            s_wvalid_o[s] = wvalid_i[i];
            s_wdata_o[s*DATA_WIDTH+:DATA_WIDTH] = wdata_i[i*DATA_WIDTH+:DATA_WIDTH];
            s_wstrb_o[s*(DATA_WIDTH/8)+:(DATA_WIDTH/8)] = wstrb_i[i*(DATA_WIDTH/8)+:(DATA_WIDTH/8)];
            s_bready_o[s] = bready_i[i];
          end
        end
      end
    end
  endgenerate

  // ---------------------------------------------------------
  // 5. Error Responder Logic (Registered)
  // ---------------------------------------------------------
  // ---------------------------------------------------------
  // 5. Error Responder Logic (Registered)
  // ---------------------------------------------------------
  logic [N_MASTERS-1:0] bvalid_err, rvalid_err;
  logic [N_MASTERS-1:0][1:0] bresp_err, rresp_err;

  always_ff @(posedge aclk or negedge aresetn) begin
    if (!aresetn) begin
      bvalid_err <= '0;
      rvalid_err <= '0;
      bresp_err  <= '0;
      rresp_err  <= '0;
    end else begin
      for (int i = 0; i < N_MASTERS; i++) begin
        // Write Error Capture
        if (master_aw_err[i] && awvalid_i[i] && awready_o[i]) begin
          bvalid_err[i] <= 1'b1;
          bresp_err[i]  <= 2'b11;  // DECERR
        end else if (bvalid_o[i] && bready_i[i]) begin
          bvalid_err[i] <= 1'b0;
        end

        // Read Error Capture
        if (master_ar_err[i] && arvalid_i[i] && arready_o[i]) begin
          rvalid_err[i] <= 1'b1;
          rresp_err[i]  <= 2'b11;  // DECERR
        end else if (rvalid_o[i] && rready_i[i]) begin
          rvalid_err[i] <= 1'b0;
        end
      end
    end
  end

  // 4. Return Path Muxing (B Channel: Slave -> Master)
  // ---------------------------------------------------------
  generate
    for (m = 0; m < N_MASTERS; m++) begin : GEN_B_MUX
      always_comb begin
        // Defaults
        awready_o[m] = 1'b0;
        wready_o[m] = 1'b0;
        bvalid_o[m] = bvalid_err[m];
        bresp_o[m*2+:2] = bresp_err[m];

        if (master_aw_err[m]) begin
          awready_o[m] = 1'b1;
          wready_o[m]  = 1'b1;
        end else if (!bvalid_err[m]) begin
          for (int i = 0; i < M_SLAVES; i++) begin
            if (slave_aw_gnt_vector[i][m]) begin
              awready_o[m] = s_awready_i[i];
              wready_o[m] = s_wready_i[i];
              bvalid_o[m] = s_bvalid_i[i];
              bresp_o[m*2+:2] = s_bresp_i[i*2+:2];
            end
          end
        end
      end
    end
  endgenerate


  // =========================================================================================================
  // READ PATH (AR + R)
  // =========================================================================================================

  // ---------------------------------------------------------

  generate
    for (m = 0; m < N_MASTERS; m++) begin : GEN_AR_DECODERS
      logic [M_SLAVES-1:0] sel;
      logic dec_err, sec_err;
      bus_matrix_decoder #(
          .M_SLAVES(M_SLAVES),
          .ADDR_WIDTH(ADDR_WIDTH),
          .REGION_MAP_FLAT(REGION_MAP_FLAT),
          .USE_DEFAULT_SLAVE(USE_DEFAULT_SLAVE),
          .DEFAULT_SLAVE_INDEX(DEFAULT_SLAVE_INDEX)
      ) u_dec_ar (
          .addr_i(araddr_i[m*ADDR_WIDTH+:ADDR_WIDTH]),
          .valid_i(arvalid_i[m]),
          .secure_i(!arprot_i[m*3+1]),
          .slave_sel_o(sel),
          .dec_error_o(dec_err),
          .sec_error_o(sec_err)
      );
      assign master_ar_req_matrix[m] = sel;
      assign master_ar_err[m] = dec_err | sec_err;
    end
  endgenerate

  // 2. Read Arbiter & Transaction Locking (AR -> R done)
  // ---------------------------------------------------------
  logic [M_SLAVES-1:0][N_MASTERS-1:0] slave_ar_req_vector;
  logic [M_SLAVES-1:0][N_MASTERS-1:0] slave_ar_gnt_vector;
  logic [M_SLAVES-1:0] ar_lock;

  generate
    for (s = 0; s < M_SLAVES; s++) begin : GEN_AR_REQ_VEC_S
      for (m = 0; m < N_MASTERS; m++) begin : GEN_AR_REQ_VEC_M
        assign slave_ar_req_vector[s][m] = master_ar_req_matrix[m][s];
      end
    end
  endgenerate

  generate
    for (s = 0; s < M_SLAVES; s++) begin : GEN_AR_ARBITERS
      lock_ar_t r_state, r_next;

      always_ff @(posedge aclk or negedge aresetn) begin
        if (!aresetn) r_state <= LOCK_IDLE_R;
        else r_state <= r_next;
      end

      always_comb begin
        r_next = r_state;
        case (r_state)
          LOCK_IDLE_R: if (s_arvalid_o[s] && s_arready_i[s]) r_next = LOCK_R_PHASE;
          LOCK_R_PHASE:
          if (s_rvalid_i[s] && s_rready_o[s]) r_next = LOCK_IDLE_R;  // Single beat Lite
          default: r_next = LOCK_IDLE_R;
        endcase
      end

      assign ar_lock[s] = (r_state != LOCK_IDLE_R) || (s_arvalid_o[s] && !s_arready_i[s]);

      bus_matrix_arbiter #(
          .N_REQ (N_MASTERS),
          .SCHEME(0)
      ) u_arb_ar (
          .clk(aclk),
          .rst_n(aresetn),
          .req_i(slave_ar_req_vector[s]),
          .hold_i(ar_lock[s]),
          .gnt_o(slave_ar_gnt_vector[s])
      );
    end
  endgenerate

  // 3. Read Muxing (AR Channel: Master -> Slave)
  // ---------------------------------------------------------
  generate
    for (s = 0; s < M_SLAVES; s++) begin : GEN_AR_MUX
      always_comb begin
        s_araddr_o[s*ADDR_WIDTH+:ADDR_WIDTH] = '0;
        s_arvalid_o[s] = 1'b0;
        s_rready_o[s] = 1'b0;  // Route RREADY logic here

        for (int i = 0; i < N_MASTERS; i++) begin
          if (slave_ar_gnt_vector[s][i]) begin
            s_arvalid_o[s] = arvalid_i[i];
            s_araddr_o[s*ADDR_WIDTH+:ADDR_WIDTH] = araddr_i[i*ADDR_WIDTH+:ADDR_WIDTH];
            s_rready_o[s] = rready_i[i];
          end
        end
      end
    end
  endgenerate

  // 4. Return Path Muxing (R Channel: Slave -> Master)
  // ---------------------------------------------------------
  generate
    for (m = 0; m < N_MASTERS; m++) begin : GEN_R_MUX
      always_comb begin
        // Defaults
        arready_o[m] = 1'b0;
        rvalid_o[m] = rvalid_err[m];
        rdata_o[m*DATA_WIDTH+:DATA_WIDTH] = rvalid_err[m] ? 32'hDEAD_BEEF : 32'h0;
        rresp_o[m*2+:2] = rresp_err[m];

        if (master_ar_err[m]) begin
          arready_o[m] = 1'b1;
        end else if (!rvalid_err[m]) begin
          for (int i = 0; i < M_SLAVES; i++) begin
            if (slave_ar_gnt_vector[i][m]) begin
              arready_o[m] = s_arready_i[i];
              rvalid_o[m] = s_rvalid_i[i];
              rdata_o[m*DATA_WIDTH+:DATA_WIDTH] = s_rdata_i[i*DATA_WIDTH+:DATA_WIDTH];
              rresp_o[m*2+:2] = s_rresp_i[i*2+:2];
            end
          end
        end
      end
    end
  endgenerate

endmodule
