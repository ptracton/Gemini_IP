module uart_core_bind;
  bind uart_core uart_core_properties #(
      .FIFO_DEPTH(FIFO_DEPTH)
  ) props (
      .clk(clk),
      .rst_n(rst_n),
      .rx_push(rx_push),
      .rx_pop(rx_pop),
      .rx_full(rx_full),
      .rx_empty(rx_empty),
      .rx_level(rx_level),
      .rx_overrun(rx_overrun),
      .reg_addr(reg_addr),
      .reg_we(reg_we),
      .reg_re(reg_re)
  );
endmodule
