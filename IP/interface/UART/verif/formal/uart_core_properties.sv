module uart_core_properties #(
    parameter FIFO_DEPTH = 16
) (
    input logic clk,
    input logic rst_n,

    // RX FIFO signals
    input logic rx_push,
    input logic rx_pop,
    input logic rx_full,
    input logic rx_empty,
    input logic [$clog2(FIFO_DEPTH):0] rx_level,
    input logic rx_overrun,

    // Register Interface (for correlation)
    input logic [31:0] reg_addr,
    input logic reg_we,
    input logic reg_re
);

  // -------------------------------------------------------------------------
  // FIFO Properties
  // -------------------------------------------------------------------------

  always @(posedge clk) begin
    if (rst_n) begin
      // 1. If FIFO is Full, it cannot be empty (unless Depth=0)
      if (rx_full) assert (!rx_empty);

      // 2. If FIFO is Empty, level must be 0
      if (rx_empty) assert (rx_level == 0);

      // 3. If FIFO is Full, level must be DEPTH
      if (rx_full) assert (rx_level == FIFO_DEPTH);

      // 4. Overflow check: If push and full happened previously, overrun implies
      if ($past(rx_push && rx_full)) assert (rx_overrun);

      // 5. Level maintenance:
      // If push and !pop and !full happened, level should have incremented
      if ($past(rx_push && !rx_pop && !rx_full)) assert (rx_level == $past(rx_level) + 1);

      // If pop and !push and !empty happened, level should have decremented
      if ($past(rx_pop && !rx_push && !rx_empty)) assert (rx_level == $past(rx_level) - 1);
    end
  end

endmodule
