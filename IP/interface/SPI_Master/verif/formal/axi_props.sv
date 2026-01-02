// AXI4-Lite Bus Protocol Properties (Yosys-native syntax)

module axi_props (
    input logic aclk,
    input logic aresetn,

    // Write Address Channel
    input logic awvalid,
    input logic awready,

    // Write Data Channel
    input logic wvalid,
    input logic wready,

    // Write Response Channel
    input logic       bvalid,
    input logic       bready,
    input logic [1:0] bresp,

    // Read Address Channel
    input logic arvalid,
    input logic arready,

    // Read Data Channel
    input logic       rvalid,
    input logic       rready,
    input logic [1:0] rresp
);

  reg past_valid = 0;
  reg past_awvalid, past_awready;
  reg past_wvalid, past_wready;
  reg past_arvalid, past_arready;
  reg past_bvalid, past_bready;
  reg past_rvalid, past_rready;

  always @(posedge aclk) begin
    past_valid   <= 1;
    past_awvalid <= awvalid;
    past_awready <= awready;
    past_wvalid  <= wvalid;
    past_wready  <= wready;
    past_arvalid <= arvalid;
    past_arready <= arready;
    past_bvalid  <= bvalid;
    past_bready  <= bready;
    past_rvalid  <= rvalid;
    past_rready  <= rready;
  end

  // AXI4-Lite Protocol Compliance

  // Once valid is asserted, it must remain until handshake
  always @(posedge aclk) begin
    if (aresetn && past_valid && past_awvalid && !past_awready) begin
      assert (awvalid);
    end
  end

  always @(posedge aclk) begin
    if (aresetn && past_valid && past_wvalid && !past_wready) begin
      assert (wvalid);
    end
  end

  always @(posedge aclk) begin
    if (aresetn && past_valid && past_arvalid && !past_arready) begin
      assert (arvalid);
    end
  end

  // Response valid must remain until accepted
  always @(posedge aclk) begin
    if (aresetn && past_valid && past_bvalid && !past_bready) begin
      assert (bvalid);
    end
  end

  always @(posedge aclk) begin
    if (aresetn && past_valid && past_rvalid && !past_rready) begin
      assert (rvalid);
    end
  end

endmodule
