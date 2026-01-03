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
    parameter TECHNOLOGY = "GENERIC"
) (
    input logic clk,
    input logic rst_n,  // Active low reset (unused for RAM core, kept for interface consistency)
    input logic cs,  // Chip Select / Enable
    input logic we,  // Write Enable (Global)
    input logic [$clog2(DEPTH)-1:0] addr,  // Address
    input logic [WIDTH-1:0] wdata,  // Write Data
    input logic [(WIDTH/8)-1:0] wstrb,  // Byte Enables
    output logic [WIDTH-1:0] rdata  // Read Data
);

  // Memory Array
  // Using simple behavioral array which efficient synthesis tools can infer as BRAM/MRAM
  // when using the correct write-byte patterns.
  logic [WIDTH-1:0] mem[DEPTH-1:0];

  // Read Logic: Synchronous Read
  always_ff @(posedge clk) begin
    if (cs) begin
      rdata <= mem[addr];
    end
  end

  // Write Logic: Byte-Enable capable
  // Using generate loop to allow synthesis tools to infer byte-write enable logic
  genvar i;
  generate
    for (i = 0; i < (WIDTH / 8); i++) begin : byte_write
      always_ff @(posedge clk) begin
        if (cs && we && wstrb[i]) begin
          mem[addr][(i*8)+7 : i*8] <= wdata[(i*8)+7 : i*8];
        end
      end
    end
  endgenerate

  // Initial block for simulation to clear memory (optional, good for verification)
  // Synthesis tools usually ignore this or treat it as init data (if supported)
  // valid for "GENERIC" or simulation.
  // For ASIC, you might want a different strategy, but behavioral is fine for this task.
`ifdef COCOTB_SIM
  initial begin
    for (int k = 0; k < DEPTH; k++) begin
      mem[k] = '0;
    end
  end
`endif

endmodule
