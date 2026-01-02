// Wishbone Bus Protocol Properties (Yosys-native syntax)

module wb_props (
    input logic clk_i,
    input logic rst_i,
    input logic cyc_i,
    input logic stb_i,
    input logic we_i,
    input logic ack_o,
    input logic err_o
);

  // Wishbone Protocol Compliance

  // stb requires cyc
  always @(posedge clk_i) begin
    if (!rst_i && stb_i) begin
      assert (cyc_i);
    end
  end

  // ack/err only during valid cycle
  always @(posedge clk_i) begin
    if (!rst_i && ack_o) begin
      assert (cyc_i && stb_i);
    end
  end

  always @(posedge clk_i) begin
    if (!rst_i && err_o) begin
      assert (cyc_i && stb_i);
    end
  end

  // ack and err are mutually exclusive
  always @(posedge clk_i) begin
    if (!rst_i) begin
      assert (!(ack_o && err_o));
    end
  end

endmodule
