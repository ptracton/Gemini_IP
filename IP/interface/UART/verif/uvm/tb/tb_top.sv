`timescale 1ps / 1ps
module tb_top;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import uart_test_pkg::*;

  // Clock and Reset
  logic pclk;
  logic presetn;

  // Interfaces
  apb_if apbf (
      pclk,
      presetn
  );
  axi_if axif (
      pclk,
      presetn
  );
  wb_if wbif (
      pclk,
      presetn
  );

  uart_if uartf (
      pclk,
      presetn
  );

  // DUT Instantiation based on define
`ifdef TEST_APB
  uart_apb dut (
      .pclk   (pclk),
      .presetn(presetn),
      .paddr  (apbf.paddr),
      .psel   (apbf.psel),
      .penable(apbf.penable),
      .pwrite (apbf.pwrite),
      .pwdata (apbf.pwdata),
      .pready (apbf.pready),
      .prdata (apbf.prdata),
      .pslverr(apbf.pslverr),

      .uart_txd(uartf.txd),
      .uart_rxd(uartf.rxd),
      .uart_rts_n(uartf.rts_n),
      .uart_cts_n(uartf.cts_n),
      .uart_de(),
      .dma_tx_req(),
      .dma_rx_req()
  );
`elsif TEST_AXI
  uart_axi dut (
      .s_axi_aclk   (pclk),
      .s_axi_aresetn(presetn),
      // Write Address
      .s_axi_awaddr (axif.awaddr),
      .s_axi_awprot (axif.awprot),
      .s_axi_awvalid(axif.awvalid),
      .s_axi_awready(axif.awready),
      // Write Data
      .s_axi_wdata  (axif.wdata),
      .s_axi_wstrb  (axif.wstrb),
      .s_axi_wvalid (axif.wvalid),
      .s_axi_wready (axif.wready),
      // Write Resp
      .s_axi_bresp  (axif.bresp),
      .s_axi_bvalid (axif.bvalid),
      .s_axi_bready (axif.bready),
      // Read Address
      .s_axi_araddr (axif.araddr),
      .s_axi_arprot (axif.arprot),
      .s_axi_arvalid(axif.arvalid),
      .s_axi_arready(axif.arready),
      // Read Data
      .s_axi_rdata  (axif.rdata),
      .s_axi_rresp  (axif.rresp),
      .s_axi_rvalid (axif.rvalid),
      .s_axi_rready (axif.rready),

      .uart_txd(uartf.txd),
      .uart_rxd(uartf.rxd),
      .uart_rts_n(uartf.rts_n),
      .uart_cts_n(uartf.cts_n),
      .uart_de(),
      .dma_tx_req(),
      .dma_rx_req()
  );
`elsif TEST_WB
  uart_wb dut (
      .wb_clk_i(pclk),
      .wb_rst_i(!presetn),    // Wishbone uses active-high reset
      .wb_cyc_i(wbif.cyc),
      .wb_stb_i(wbif.stb),
      .wb_we_i (wbif.we),
      .wb_adr_i(wbif.adr),
      .wb_dat_i(wbif.dat_i),
      .wb_sel_i(wbif.sel),
      .wb_ack_o(wbif.ack),
      .wb_dat_o(wbif.dat_o),
      .wb_err_o(),

      .uart_txd(uartf.txd),
      .uart_rxd(uartf.rxd),
      .uart_rts_n(uartf.rts_n),
      .uart_cts_n(uartf.cts_n),
      .uart_de(),
      .dma_tx_req(),
      .dma_rx_req()
  );
`endif

  // UVM Start
  initial begin
    uvm_config_db#(virtual apb_if)::set(null, "*", "apb_vif", apbf);
    uvm_config_db#(virtual axi_if)::set(null, "*", "axi_vif", axif);
    uvm_config_db#(virtual wb_if)::set(null, "*", "wb_vif", wbif);

    uvm_config_db#(virtual uart_if)::set(null, "*", "uart_vif", uartf);

    run_test();
  end

  // Clock Gen
  initial begin
    pclk = 0;
    forever #5 pclk = ~pclk;  // 100MHz
  end

  // Reset Gen
  initial begin
    presetn = 0;
    #100;
    presetn = 1;
  end


endmodule
