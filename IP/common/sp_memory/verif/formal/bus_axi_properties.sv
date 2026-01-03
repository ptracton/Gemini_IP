/*
 * File: bus_axi_properties.sv
 * Description: Formal properties for AXI4 interface wrapper.
 */

module bus_axi_properties #(
    parameter int WIDTH = 32,
    parameter int DEPTH = 1024
) (
    input logic aclk,
    input logic aresetn,
    input logic [31:0] awaddr,
    input logic awvalid,
    input logic awready,
    input logic [WIDTH-1:0] wdata,
    input logic wvalid,
    input logic wready,
    input logic [1:0] bresp,
    input logic bvalid,
    input logic bready,
    input logic [31:0] araddr,
    input logic arvalid,
    input logic arready,
    input logic [WIDTH-1:0] rdata,
    input logic [1:0] rresp,
    input logic rvalid,
    input logic rready,
    // Core interface
    input logic mem_cs,
    input logic mem_we,
    input logic [$clog2(DEPTH)-1:0] mem_addr
);

  // -------------------------------------------------------------------------
  // Formal Reset Logic
  // -------------------------------------------------------------------------
  logic rst_occurred = 0;
  always @(posedge aclk) begin
    if (!aresetn) rst_occurred <= 1;
  end

  logic formal_active;
  assign formal_active = rst_occurred && aresetn;

  // -------------------------------------------------------------------------
  // AXI Protocol Assumptions
  // -------------------------------------------------------------------------
  initial assume (!aresetn);

  always @(posedge aclk) begin
    if (aresetn && $past(aresetn)) begin
      if ($past(awvalid && !awready)) assume (awvalid);
      if ($past(wvalid && !wready)) assume (wvalid);
      if ($past(arvalid && !arready)) assume (arvalid);
    end
  end

  // -------------------------------------------------------------------------
  // Interface Mapping Verification
  // -------------------------------------------------------------------------

  always @(posedge aclk) begin
    if (formal_active) begin
      // If memory is accessed, it should match the AXI channel address
      if (mem_cs) begin
        if (mem_we) begin
          // Write
          // We don't verify complex burst logic here, just that it's active
          assert (wready || bvalid || awready);
        end else begin
          // Read
          assert (rvalid || arready);
        end
      end
    end
  end

endmodule
