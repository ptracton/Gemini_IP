/*
 * File: bus_wb_properties.sv
 * Description: Formal properties for Wishbone B4 interface wrapper.
 */

module bus_wb_properties #(
    parameter int WIDTH = 32,
    parameter int DEPTH = 1024
) (
    input logic clk_i,
    input logic rst_i,
    input logic [31:0] adr_i,
    input logic [WIDTH-1:0] dat_i,
    input logic [(WIDTH/8)-1:0] sel_i,
    input logic we_i,
    input logic cyc_i,
    input logic stb_i,
    input logic [WIDTH-1:0] dat_o,
    input logic ack_o,
    input logic err_o,
    // Core interface
    input logic mem_cs,
    input logic mem_we,
    input logic [$clog2(DEPTH)-1:0] mem_addr
);

  // -------------------------------------------------------------------------
  // Formal Reset Logic
  // -------------------------------------------------------------------------
  logic rst_occurred = 0;
  always @(posedge clk_i) begin
    if (rst_i) rst_occurred <= 1;
  end

  logic formal_active;
  assign formal_active = rst_occurred && !rst_i;

  // -------------------------------------------------------------------------
  // Wishbone Protocol Assumptions
  // -------------------------------------------------------------------------
  initial assume (rst_i);

  always @(posedge clk_i) begin
    if (!rst_i && $past(!rst_i)) begin
      // If a transaction is in progress and not finished, signals stay stable
      if ($past(cyc_i && stb_i && !ack_o && !err_o)) begin
        assume (cyc_i);
        assume (stb_i);
        assume ($stable(adr_i));
        assume ($stable(we_i));
      end
    end
  end

  // -------------------------------------------------------------------------
  // Handshake (1-cycle delay)
  // -------------------------------------------------------------------------
  always @(posedge clk_i) begin
    if (formal_active) begin
      // If request made in past cycle, we should have a response now
      if ($past(!rst_i && cyc_i && stb_i && !ack_o && !err_o)) begin
        assert (ack_o || err_o);
      end
    end
  end

  // -------------------------------------------------------------------------
  // Interface Mapping
  // -------------------------------------------------------------------------
  localparam int ADDR_LSB = $clog2(WIDTH / 8);

  always @(posedge clk_i) begin
    if (formal_active) begin
      // Verify mapping during the request phase
      // Since mem_cs/mem_addr are purely combinational in the wrapper:
      if (cyc_i && stb_i && !ack_o && !err_o) begin
        assert (mem_cs);
        assert (mem_we == we_i);
        assert (mem_addr == adr_i[$clog2(DEPTH)+ADDR_LSB-1 : ADDR_LSB]);
      end
    end
  end

endmodule
