// SPI Master Formal Bindings

module spi_master_binds;

  bind spi_master_core spi_master_props props_inst (
      .clk(clk),
      .rst_n(rst_n),
      .sclk(sclk),
      .mosi(mosi),
      .miso(miso),
      .tx_push(tx_push),
      .tx_full(tx_full),
      .rx_pop(rx_pop),
      .rx_empty(rx_empty),
      .enable(enable),
      .busy(busy),
      .done_intr(done_intr),
      .state(state)
  );

endmodule
