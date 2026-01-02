// APB Bus Protocol Properties (Yosys-native syntax)

module apb_props (
    input logic pclk,
    input logic presetn,
    input logic psel,
    input logic penable,
    input logic pwrite,
    input logic pready,
    input logic pslverr
);

  reg past_valid = 0;
  reg past_psel;
  reg past_penable;

  always @(posedge pclk) begin
    past_valid <= 1;
    past_psel <= psel;
    past_penable <= penable;
  end

  // APB Protocol Compliance

  // SETUP phase: if psel was high and penable was low, now penable should be high
  always @(posedge pclk) begin
    if (presetn && past_valid && past_psel && !past_penable) begin
      assert (psel && penable);
    end
  end

  // penable cannot be high without psel
  always @(posedge pclk) begin
    if (presetn && penable) begin
      assert (psel);
    end
  end

  // No error without valid transaction
  always @(posedge pclk) begin
    if (presetn && !(psel && penable)) begin
      assert (!pslverr);
    end
  end

endmodule
