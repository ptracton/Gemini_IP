// Bus Interface Bind Modules

module apb_binds;
  bind spi_master_apb apb_props props_apb (
      .pclk(pclk),
      .presetn(presetn),
      .psel(psel),
      .penable(penable),
      .pwrite(pwrite),
      .pready(pready),
      .pslverr(pslverr)
  );
endmodule

module axi_binds;
  bind spi_master_axi axi_props props_axi (
      .aclk(aclk),
      .aresetn(aresetn),
      .awvalid(awvalid),
      .awready(awready),
      .wvalid(wvalid),
      .wready(wready),
      .bvalid(bvalid),
      .bready(bready),
      .bresp(bresp),
      .arvalid(arvalid),
      .arready(arready),
      .rvalid(rvalid),
      .rready(rready),
      .rresp(rresp)
  );
endmodule

module wb_binds;
  bind spi_master_wb wb_props props_wb (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .cyc_i(cyc_i),
      .stb_i(stb_i),
      .we_i (we_i),
      .ack_o(ack_o),
      .err_o(err_o)
  );
endmodule
