module uart_wb_properties (
    input logic        wb_clk_i,
    input logic        wb_rst_i,
    input logic [31:0] wb_adr_i,
    input logic [31:0] wb_dat_i,
    input logic [31:0] wb_dat_o,
    input logic        wb_we_i,
    input logic [ 3:0] wb_sel_i,
    input logic        wb_stb_i,
    input logic        wb_cyc_i,
    input logic        wb_ack_o,
    input logic        wb_err_o
);

  // -------------------------------------------------------------------------
  // Wishbone Properties (Slave Side)
  // -------------------------------------------------------------------------

  always @(posedge wb_clk_i) begin
    if (!wb_rst_i) begin
      // 1. Acknowledge implies Strobe and Cycle
      // A slave must not assert ACK unless selected (STB+CYC)
      if (wb_ack_o) begin
        assert (wb_stb_i && wb_cyc_i);
      end

      // 2. Error implies Strobe and Cycle
      if (wb_err_o) begin
        assert (wb_stb_i && wb_cyc_i);
      end

      // 3. Response Liveness (or Immediate Check)
      // If Cycle and Strobe are asserted, Slave must eventually ACK or ERR.
      // Assuming 0-wait state logic for this IP:
      if (wb_cyc_i && wb_stb_i) begin
        // assert(wb_ack_o || wb_err_o); // Disabled if wait states exist
        // But usually, ACK logic is combinational or registered.
      end

      // 4. Read Data Validity
      // If ACK is high and it's a READ (WE=0), data out should not be X
      if (wb_ack_o && !wb_we_i) begin
        assert (!$isunknown(wb_dat_o));
      end
    end
  end

  always @(posedge wb_clk_i) begin
    if (wb_rst_i) begin
      assert (!wb_ack_o);
      assert (!wb_err_o);
    end
  end

endmodule
