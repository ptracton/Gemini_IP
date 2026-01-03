/*
 * File: bus_apb_properties.sv
 * Description: Formal properties for APB4 interface wrapper.
 */

module bus_apb_properties #(
    parameter int WIDTH = 32,
    parameter int DEPTH = 1024
) (
    input logic pclk,
    input logic presetn,
    input logic psel,
    input logic penable,
    input logic pwrite,
    input logic [31:0] paddr,
    input logic [WIDTH-1:0] pwdata,
    input logic [(WIDTH/8)-1:0] pstrb,
    input logic pready,
    input logic [WIDTH-1:0] prdata,
    input logic pslverr,
    // Core interface as seen by the wrapper
    input logic mem_cs,
    input logic mem_we,
    input logic [$clog2(DEPTH)-1:0] mem_addr
);

  // -------------------------------------------------------------------------
  // Formal Reset Logic
  // -------------------------------------------------------------------------
  logic rst_occurred = 0;
  always @(posedge pclk) begin
    if (!presetn) rst_occurred <= 1;
  end

  logic formal_active;
  assign formal_active = rst_occurred && presetn;

  // -------------------------------------------------------------------------
  // APB Protocol Assumptions
  // -------------------------------------------------------------------------

  initial assume (!presetn);

  always @(posedge pclk) begin
    if (presetn) begin
      if (psel && $past(!psel)) assume (!penable);
      if ($past(psel && !penable)) assume (psel && penable);
      if ($past(psel && penable)) assume (!penable);
    end
  end

  // -------------------------------------------------------------------------
  // Interface Mapping Verification
  // -------------------------------------------------------------------------

  localparam int ADDR_LSB = $clog2(WIDTH / 8);
  logic [31:0] expected_mem_addr;
  assign expected_mem_addr = paddr[ADDR_LSB+$clog2(DEPTH)-1 : ADDR_LSB];

  always @(posedge pclk) begin
    if (formal_active) begin
      // 1. Chip Select
      assert (mem_cs == (psel && (!pwrite || penable)));

      // 2. Write Enable
      if (psel) assert (mem_we == pwrite);

      // 3. Address
      if (psel) assert (mem_addr == expected_mem_addr[$clog2(DEPTH)-1:0]);

      // 4. Out of Range
      if (psel && penable) begin
        if (paddr >= (DEPTH << ADDR_LSB))
          assert (pslverr);
          else assert (!pslverr);
      end
    end
  end

endmodule
