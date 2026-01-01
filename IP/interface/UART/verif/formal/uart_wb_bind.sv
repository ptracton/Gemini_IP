module uart_wb_bind;
  bind uart_wb uart_wb_properties props (
      .wb_clk_i(wb_clk_i),
      .wb_rst_i(wb_rst_i),
      .wb_adr_i(wb_adr_i),
      .wb_dat_i(wb_dat_i),
      .wb_dat_o(wb_dat_o),
      .wb_we_i (wb_we_i),
      .wb_sel_i(wb_sel_i),
      .wb_stb_i(wb_stb_i),
      .wb_cyc_i(wb_cyc_i),
      .wb_ack_o(wb_ack_o),
      .wb_err_o(wb_err_o)
  );
endmodule
