module uart_apb_bind;
  bind uart_apb uart_apb_properties props (
      .pclk(pclk),
      .presetn(presetn),
      .paddr(paddr),
      .psel(psel),
      .penable(penable),
      .pwrite(pwrite),
      .pwdata(pwdata),
      .pready(pready),
      .prdata(prdata),
      .pslverr(pslverr)
  );
endmodule
