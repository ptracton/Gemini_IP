/*
 * File: bus_ahb_properties.sv
 * Description: Formal properties for AHB-Lite interface wrapper.
 */

module bus_ahb_properties #(
    parameter int WIDTH = 32,
    parameter int DEPTH = 1024
) (
    input logic hclk,
    input logic hresetn,
    input logic hsel,
    input logic [31:0] haddr,
    input logic [1:0] htrans,
    input logic hwrite,
    input logic [WIDTH-1:0] hwdata,
    input logic hready,
    input logic hreadyout,
    input logic hresp,
    input logic [WIDTH-1:0] hrdata,
    // Core interface
    input logic mem_cs,
    input logic mem_we,
    input logic [$clog2(DEPTH)-1:0] mem_addr
);

  // -------------------------------------------------------------------------
  // Formal Reset Logic
  // -------------------------------------------------------------------------
  logic rst_occurred = 0;
  always @(posedge hclk) begin
    if (!hresetn) rst_occurred <= 1;
  end

  logic formal_active;
  assign formal_active = rst_occurred && hresetn;

  // -------------------------------------------------------------------------
  // AHB Protocol Assumptions
  // -------------------------------------------------------------------------
  initial assume (!hresetn);

  // -------------------------------------------------------------------------
  // Interface Mapping
  // -------------------------------------------------------------------------
  always @(posedge hclk) begin
    if (formal_active) begin
      if (mem_cs) begin
        if (mem_we) begin
          // Write happens in Data Phase
          assert (hreadyout);
        end else begin
          // Read
          // We don't verify complex wait state timing here, just connectivity
        end
      end
    end
  end

endmodule
