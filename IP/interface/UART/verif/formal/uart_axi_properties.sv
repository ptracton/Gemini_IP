module uart_axi_properties (
    input logic        s_axi_aclk,
    input logic        s_axi_aresetn,
    input logic [31:0] s_axi_awaddr,
    input logic        s_axi_awvalid,
    input logic        s_axi_awready,
    input logic [31:0] s_axi_wdata,
    input logic [ 3:0] s_axi_wstrb,
    input logic        s_axi_wvalid,
    input logic        s_axi_wready,
    input logic [ 1:0] s_axi_bresp,
    input logic        s_axi_bvalid,
    input logic        s_axi_bready,
    input logic [31:0] s_axi_araddr,
    input logic        s_axi_arvalid,
    input logic        s_axi_arready,
    input logic [31:0] s_axi_rdata,
    input logic [ 1:0] s_axi_rresp,
    input logic        s_axi_rvalid,
    input logic        s_axi_rready
);

  // -------------------------------------------------------------------------
  // AXI4-Lite Properties (Subset)
  // -------------------------------------------------------------------------

  always @(posedge s_axi_aclk) begin
    if (s_axi_aresetn) begin
      // 1. Write Address Channel
      // If valid goes high, it must stay high until ready
      if ($past(s_axi_awvalid && !s_axi_awready)) assert (s_axi_awvalid);

      // Stable Address
      if ($past(s_axi_awvalid && !s_axi_awready)) assert (s_axi_awaddr == $past(s_axi_awaddr));

      // 2. Write Data Channel
      if ($past(s_axi_wvalid && !s_axi_wready)) assert (s_axi_wvalid);

      if ($past(s_axi_wvalid && !s_axi_wready)) begin
        assert (s_axi_wdata == $past(s_axi_wdata));
        assert (s_axi_wstrb == $past(s_axi_wstrb));
      end

      // 3. Write Response Channel
      if ($past(s_axi_bvalid && !s_axi_bready)) assert (s_axi_bvalid);

      if ($past(s_axi_bvalid && !s_axi_bready)) assert (s_axi_bresp == $past(s_axi_bresp));

      // 4. Read Address Channel
      if ($past(s_axi_arvalid && !s_axi_arready)) assert (s_axi_arvalid);

      if ($past(s_axi_arvalid && !s_axi_arready)) assert (s_axi_araddr == $past(s_axi_araddr));

      // 5. Read Data Channel
      if ($past(s_axi_rvalid && !s_axi_rready)) assert (s_axi_rvalid);

      if ($past(s_axi_rvalid && !s_axi_rready)) begin
        assert (s_axi_rdata == $past(s_axi_rdata));
        assert (s_axi_rresp == $past(s_axi_rresp));
      end
    end
  end

  // Reset Checks
  always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) begin
      assert (!s_axi_awready);
      assert (!s_axi_wready);
      assert (!s_axi_bvalid);
      assert (!s_axi_arready);
      assert (!s_axi_rvalid);
    end
  end

endmodule
