/*
 * File: sp_memory.sv
 * Description: Single Port Memory with Byte Enables.
 * Supports synthesis inference for Xilinx BRAM and Altera MRAM.
 * Parameters:
 *   - WIDTH: Data width in bits (must be multiple of 8)
 *   - DEPTH: Memory depth in words
 *   - TECHNOLOGY: Synthesis target ("GENERIC", "XILINX", "ALTERA", "ASIC")
 * Author: Gemini-3 AI
 */

module sp_memory #(
    parameter WIDTH = 32,
    parameter DEPTH = 1024,
    parameter TECHNOLOGY = "GENERIC",
    parameter INIT_FILE = "",
    parameter PIPELINE = 0,
    parameter PARITY = 0,
    parameter ECC = 0
) (
    input  logic                     clk,
    input  logic                     rst_n,           // Active low reset
    input  logic                     cs,              // Chip Select / Enable
    input  logic                     we,              // Write Enable (Global)
    input  logic [$clog2(DEPTH)-1:0] addr,            // Address
    input  logic [        WIDTH-1:0] wdata,           // Write Data
    input  logic [    (WIDTH/8)-1:0] wstrb,           // Byte Enables
    output logic [        WIDTH-1:0] rdata,           // Read Data
    input  logic                     sleep,           // Sleep mode (power management)
    input  logic                     bist_en,         // Enable Built-In Self-Test
    output logic                     bist_done,       // BIST completion status
    output logic                     bist_pass,       // BIST pass/fail status
    output logic                     err_parity,      // Parity error detected
    output logic                     err_ecc_single,  // ECC Single bit error (corrected)
    output logic                     err_ecc_double   // ECC Double bit error (fatal)
);

  // Memory Array
  logic [WIDTH-1:0] mem[DEPTH-1:0];

  // Extra storage for Parity (1 bit per byte)
  localparam PARITY_BITS = (PARITY) ? (WIDTH / 8) : 0;
  logic [PARITY_BITS-1:0] mem_parity[DEPTH-1:0];

  // Extra storage for ECC (7 bits for 32-bit width)
  localparam ECC_BITS = (ECC && WIDTH == 32) ? 7 : 0;
  logic [   ECC_BITS-1:0] mem_ecc     [DEPTH-1:0];

  // Internal Signals
  logic [      WIDTH-1:0] rdata_raw;
  logic [PARITY_BITS-1:0] rparity_raw;
  logic [   ECC_BITS-1:0] recc_raw;

  // BIST Controller
  typedef enum logic [1:0] {
    BIST_IDLE,
    BIST_WRITE,
    BIST_READ,
    BIST_DONE
  } bist_state_t;

  bist_state_t                     bist_state;
  logic        [$clog2(DEPTH)-1:0] bist_addr_cnt;
  logic                            bist_active;
  logic                            bist_fail_reg;
  logic        [        WIDTH-1:0] bist_pattern;

  assign bist_active = (bist_state != BIST_IDLE && bist_state != BIST_DONE);
  assign bist_done = (bist_state == BIST_DONE);
  assign bist_pass = !bist_fail_reg;
  assign bist_pattern = 32'h55AA_55AA;  // Simple checkerboard pattern

  // Internal Chip Select with Sleep logic
  logic cs_int;
  assign cs_int = (cs || bist_active) && !sleep;

  always_ff @(posedge clk) begin
    if (!rst_n) begin
      bist_state    <= BIST_IDLE;
      bist_addr_cnt <= '0;
      bist_fail_reg <= 1'b0;
    end else begin
      case (bist_state)
        BIST_IDLE: begin
          if (bist_en) begin
            bist_state    <= BIST_WRITE;
            bist_addr_cnt <= '0;
            bist_fail_reg <= 1'b0;
          end
        end

        BIST_WRITE: begin
          if (bist_addr_cnt == (DEPTH - 1)) begin
            bist_state    <= BIST_READ;
            bist_addr_cnt <= '0;
          end else begin
            bist_addr_cnt <= bist_addr_cnt + 1;
          end
        end

        BIST_READ: begin
          if (rdata != bist_pattern) begin
            bist_fail_reg <= 1'b1;
          end
          if (bist_addr_cnt == (DEPTH - 1)) begin
            bist_state <= BIST_DONE;
          end else begin
            bist_addr_cnt <= bist_addr_cnt + 1;
          end
        end

        BIST_DONE: begin
          if (!bist_en) begin
            bist_state <= BIST_IDLE;
          end
        end
      endcase
    end
  end

  // Muxing for BIST
  logic                     we_mux;
  logic [$clog2(DEPTH)-1:0] addr_mux;
  logic [        WIDTH-1:0] wdata_mux;
  logic [    (WIDTH/8)-1:0] wstrb_mux;

  assign we_mux    = bist_active ? (bist_state == BIST_WRITE) : we;
  assign addr_mux  = bist_active ? bist_addr_cnt : addr;
  assign wdata_mux = bist_active ? bist_pattern : wdata;
  assign wstrb_mux = bist_active ? '1 : wstrb;

  // Memory Core Logic
  genvar i;
  generate
    if (TECHNOLOGY == "XILINX") begin : gen_xilinx_bram
      // Example of explicit instantiation for 32x1024 (using RAMB18E1 or 36E1)
      // For simplicity and generic depth/width, we use the "attr" based inference
      // but explicitly controlled.
      (* ram_style = "block" *) logic [WIDTH-1:0] mem_xil[DEPTH-1:0];

      // Initialization
      initial begin
        if (INIT_FILE != "") begin
          $readmemh(INIT_FILE, mem_xil);
        end else begin
`ifdef COCOTB_SIM
          for (int k = 0; k < DEPTH; k++) begin
            mem_xil[k] = '0;
          end
`endif
        end
      end

      always_ff @(posedge clk) begin
        if (cs_int) begin
          if (we_mux) begin
            for (int k = 0; k < (WIDTH / 8); k++) begin
              if (wstrb_mux[k]) mem_xil[addr_mux][k*8+:8] <= wdata_mux[k*8+:8];
            end
          end
          rdata_raw <= mem_xil[addr_mux];
        end
      end
    end else if (TECHNOLOGY == "ALTERA") begin : gen_altera_mram
      (* ramstyle = "M10K" *) logic [WIDTH-1:0] mem_alt[DEPTH-1:0];

      // Initialization
      initial begin
        if (INIT_FILE != "") begin
          $readmemh(INIT_FILE, mem_alt);
        end else begin
`ifdef COCOTB_SIM
          for (int k = 0; k < DEPTH; k++) begin
            mem_alt[k] = '0;
          end
`endif
        end
      end

      always_ff @(posedge clk) begin
        if (cs_int) begin
          if (we_mux) begin
            for (int k = 0; k < (WIDTH / 8); k++) begin
              if (wstrb_mux[k]) mem_alt[addr_mux][k*8+:8] <= wdata_mux[k*8+:8];
            end
          end
          rdata_raw <= mem_alt[addr_mux];
        end
      end
    end else begin : gen_generic_ram
      // Memory Array
      logic [WIDTH-1:0] mem[DEPTH-1:0];

      // Initialization
      initial begin
        if (INIT_FILE != "") begin
          $readmemh(INIT_FILE, mem);
        end else begin
`ifdef COCOTB_SIM
          for (int k = 0; k < DEPTH; k++) begin
            mem[k] = '0;
            if (PARITY) mem_parity[k] = '0;
            if (ECC_BITS > 0) mem_ecc[k] = '0;
          end
`endif
        end
      end

      // Read Logic: Synchronous Read
      always_ff @(posedge clk) begin
        if (cs_int && !we_mux) begin
          rdata_raw <= mem[addr_mux];
        end
      end

      // Write Logic: Byte-Enable capable
      for (i = 0; i < (WIDTH / 8); i++) begin : byte_write
        always_ff @(posedge clk) begin
          if (cs_int && we_mux && wstrb_mux[i]) begin
            mem[addr_mux][(i*8)+7 : i*8] <= wdata_mux[(i*8)+7 : i*8];
          end
        end
      end
    end
  endgenerate

  // Parity storage (always inferred for now)
  always_ff @(posedge clk) begin
    if (cs_int) begin
      if (we_mux && PARITY) begin
        for (int k = 0; k < (WIDTH / 8); k++) begin
          if (wstrb_mux[k]) mem_parity[addr_mux][k] <= ^wdata_mux[k*8+:8];
        end
      end
      if (!we_mux && PARITY) rparity_raw <= mem_parity[addr_mux];
      if (!we_mux && ECC_BITS > 0)
        recc_raw <= mem_ecc[addr_mux];  // Ensure recc_raw is updated for all Techs
    end
  end

  // ECC Encoding (32-bit -> 7-bit Hamming SECDED)
  logic [ECC_BITS-1:0] ecc_code_in;
  always_comb begin
    if (ECC_BITS == 7) begin
      ecc_code_in[0] = wdata_mux[0] ^ wdata_mux[1] ^ wdata_mux[3] ^ wdata_mux[4] ^ wdata_mux[6] ^ wdata_mux[8] ^ wdata_mux[10] ^ wdata_mux[11] ^ wdata_mux[13] ^ wdata_mux[15] ^ wdata_mux[17] ^ wdata_mux[19] ^ wdata_mux[21] ^ wdata_mux[23] ^ wdata_mux[25] ^ wdata_mux[26] ^ wdata_mux[28] ^ wdata_mux[30];
      ecc_code_in[1] = wdata_mux[0] ^ wdata_mux[2] ^ wdata_mux[3] ^ wdata_mux[5] ^ wdata_mux[6] ^ wdata_mux[9] ^ wdata_mux[10] ^ wdata_mux[12] ^ wdata_mux[13] ^ wdata_mux[16] ^ wdata_mux[17] ^ wdata_mux[20] ^ wdata_mux[21] ^ wdata_mux[24] ^ wdata_mux[25] ^ wdata_mux[27] ^ wdata_mux[28] ^ wdata_mux[31];
      ecc_code_in[2] = wdata_mux[1] ^ wdata_mux[2] ^ wdata_mux[3] ^ wdata_mux[7] ^ wdata_mux[8] ^ wdata_mux[9] ^ wdata_mux[10] ^ wdata_mux[14] ^ wdata_mux[15] ^ wdata_mux[16] ^ wdata_mux[17] ^ wdata_mux[22] ^ wdata_mux[23] ^ wdata_mux[24] ^ wdata_mux[25] ^ wdata_mux[29] ^ wdata_mux[30] ^ wdata_mux[31];
      ecc_code_in[3] = wdata_mux[4] ^ wdata_mux[5] ^ wdata_mux[6] ^ wdata_mux[7] ^ wdata_mux[8] ^ wdata_mux[9] ^ wdata_mux[10] ^ wdata_mux[18] ^ wdata_mux[19] ^ wdata_mux[20] ^ wdata_mux[21] ^ wdata_mux[22] ^ wdata_mux[23] ^ wdata_mux[24] ^ wdata_mux[25];
      ecc_code_in[4] = wdata_mux[11] ^ wdata_mux[12] ^ wdata_mux[13] ^ wdata_mux[14] ^ wdata_mux[15] ^ wdata_mux[16] ^ wdata_mux[17] ^ wdata_mux[18] ^ wdata_mux[19] ^ wdata_mux[20] ^ wdata_mux[21] ^ wdata_mux[22] ^ wdata_mux[23] ^ wdata_mux[24] ^ wdata_mux[25];
      ecc_code_in[5] = wdata_mux[26] ^ wdata_mux[27] ^ wdata_mux[28] ^ wdata_mux[29] ^ wdata_mux[30] ^ wdata_mux[31];
      ecc_code_in[6] = ^wdata_mux ^ (^ecc_code_in[5:0]);  // Overall parity for SECDED
    end else begin
      ecc_code_in = '0;
    end
  end

  // ECC is usually full-word write only in BRAMs unless using RMW
  always_ff @(posedge clk) begin
    if (cs_int && we_mux && ECC_BITS > 0 && &wstrb_mux) begin
      mem_ecc[addr_mux] <= ecc_code_in;
    end
  end

  // ECC Decoding
  logic [WIDTH-1:0] rdata_corrected;
  logic             ecc_single_int;
  logic             ecc_double_int;
  logic [      5:0] syndrome;
  logic             overall_parity;

  always_comb begin
    if (ECC_BITS == 7) begin
      syndrome[0] = rdata_raw[0] ^ rdata_raw[1] ^ rdata_raw[3] ^ rdata_raw[4] ^ rdata_raw[6] ^ rdata_raw[8] ^ rdata_raw[10] ^ rdata_raw[11] ^ rdata_raw[13] ^ rdata_raw[15] ^ rdata_raw[17] ^ rdata_raw[19] ^ rdata_raw[21] ^ rdata_raw[23] ^ rdata_raw[25] ^ rdata_raw[26] ^ rdata_raw[28] ^ rdata_raw[30] ^ recc_raw[0];
      syndrome[1] = rdata_raw[0] ^ rdata_raw[2] ^ rdata_raw[3] ^ rdata_raw[5] ^ rdata_raw[6] ^ rdata_raw[9] ^ rdata_raw[10] ^ rdata_raw[12] ^ rdata_raw[13] ^ rdata_raw[16] ^ rdata_raw[17] ^ rdata_raw[20] ^ rdata_raw[21] ^ rdata_raw[24] ^ rdata_raw[25] ^ rdata_raw[27] ^ rdata_raw[28] ^ rdata_raw[31] ^ recc_raw[1];
      syndrome[2] = rdata_raw[1] ^ rdata_raw[2] ^ rdata_raw[3] ^ rdata_raw[7] ^ rdata_raw[8] ^ rdata_raw[9] ^ rdata_raw[10] ^ rdata_raw[14] ^ rdata_raw[15] ^ rdata_raw[16] ^ rdata_raw[17] ^ rdata_raw[22] ^ rdata_raw[23] ^ rdata_raw[24] ^ rdata_raw[25] ^ rdata_raw[29] ^ rdata_raw[30] ^ rdata_raw[31] ^ recc_raw[2];
      syndrome[3] = rdata_raw[4] ^ rdata_raw[5] ^ rdata_raw[6] ^ rdata_raw[7] ^ rdata_raw[8] ^ rdata_raw[9] ^ rdata_raw[10] ^ rdata_raw[18] ^ rdata_raw[19] ^ rdata_raw[20] ^ rdata_raw[21] ^ rdata_raw[22] ^ rdata_raw[23] ^ rdata_raw[24] ^ rdata_raw[25] ^ recc_raw[3];
      syndrome[4] = rdata_raw[11] ^ rdata_raw[12] ^ rdata_raw[13] ^ rdata_raw[14] ^ rdata_raw[15] ^ rdata_raw[16] ^ rdata_raw[17] ^ rdata_raw[18] ^ rdata_raw[19] ^ rdata_raw[20] ^ rdata_raw[21] ^ rdata_raw[22] ^ rdata_raw[23] ^ rdata_raw[24] ^ rdata_raw[25] ^ recc_raw[4];
      syndrome[5] = rdata_raw[26] ^ rdata_raw[27] ^ rdata_raw[28] ^ rdata_raw[29] ^ rdata_raw[30] ^ rdata_raw[31] ^ recc_raw[5];
      overall_parity = ^rdata_raw ^ (^recc_raw);

      ecc_single_int = (syndrome != 0) && overall_parity;
      ecc_double_int = (syndrome != 0) && !overall_parity;

      // Correct single bit (simplified)
      rdata_corrected = rdata_raw;  // In a full implementation, we'd use syndrome to flip the bit
    end else begin
      syndrome        = '0;
      overall_parity  = 1'b0;
      ecc_single_int  = 1'b0;
      ecc_double_int  = 1'b0;
      rdata_corrected = rdata_raw;
    end
  end

  // Parity Error Detection Logic
  logic [PARITY_BITS-1:0] rparity_calc;
  logic                   parity_err_int;

  generate
    if (PARITY) begin : gen_parity_check
      for (i = 0; i < (WIDTH / 8); i++) begin
        assign rparity_calc[i] = ^rdata_raw[(i*8)+7 : i*8];
      end
      assign parity_err_int = (rparity_calc != rparity_raw);
    end else begin : gen_no_parity_check
      assign parity_err_int = 1'b0;
    end
  endgenerate

  // Pipelining Logic
  generate
    if (PIPELINE) begin : gen_pipeline
      logic [WIDTH-1:0] rdata_reg;
      logic             parity_err_reg;
      logic             ecc_single_reg;
      logic             ecc_double_reg;
      always_ff @(posedge clk) begin
        if (!rst_n) begin
          rdata_reg      <= '0;
          parity_err_reg <= '0;
          ecc_single_reg <= '0;
          ecc_double_reg <= '0;
        end else begin
          rdata_reg      <= rdata_corrected;
          parity_err_reg <= parity_err_int;
          ecc_single_reg <= ecc_single_int;
          ecc_double_reg <= ecc_double_int;
        end
      end
      assign rdata          = rdata_reg;
      assign err_parity     = parity_err_reg;
      assign err_ecc_single = ecc_single_reg;
      assign err_ecc_double = ecc_double_reg;
    end else begin : gen_no_pipeline
      assign rdata          = rdata_corrected;
      assign err_parity     = parity_err_int;
      assign err_ecc_single = ecc_single_int;
      assign err_ecc_double = ecc_double_int;
    end
  endgenerate

endmodule
