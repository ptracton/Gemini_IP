// SPI Master Formal Properties
// Formal verification assertions for SymbiYosys (Yosys-native syntax)

module spi_master_props (
    input logic clk,
    input logic rst_n,

    // SPI Interface
    input logic sclk,
    input logic mosi,
    input logic miso,

    // FIFO Interface
    input logic tx_push,
    input logic tx_full,
    input logic rx_pop,
    input logic rx_empty,

    // Control
    input logic enable,
    input logic busy,
    input logic done_intr,

    // FSM State (for internal checks)
    input logic [1:0] state
);

  // Track previous values for temporal checks
  reg past_valid = 0;
  reg past_rst_n;
  reg [1:0] past_state;
  reg past_done_intr;

  always @(posedge clk) begin
    past_valid <= 1;
    past_rst_n <= rst_n;
    past_state <= state;
    past_done_intr <= done_intr;
  end

  // =========================================================================
  // FIFO Safety Properties
  // =========================================================================

  // No TX push when full
  always @(posedge clk) begin
    if (rst_n) begin
      assume (!(tx_full && tx_push));
    end
  end

  // No RX pop when empty
  always @(posedge clk) begin
    if (rst_n) begin
      assume (!(rx_empty && rx_pop));
    end
  end

  // =========================================================================
  // FSM Properties
  // =========================================================================

  // Reset behavior: FSM should be in IDLE after reset
  always @(posedge clk) begin
    if (past_valid && !past_rst_n) begin
      assert (state == 2'b00);
    end
  end

  // FSM should never be in an invalid state (always 0-3)
  always @(posedge clk) begin
    if (rst_n) begin
      assert (state <= 2'b11);
    end
  end

  // Busy should be high when not in IDLE
  always @(posedge clk) begin
    if (rst_n && state != 2'b00) begin
      assert (busy);
    end
  end

  // Done interrupt should only pulse for one cycle
  always @(posedge clk) begin
    if (past_valid && rst_n && past_done_intr) begin
      assert (!done_intr);
    end
  end

endmodule
