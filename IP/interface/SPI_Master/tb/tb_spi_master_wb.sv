

module tb_spi_master_wb;

  localparam ADDR_WIDTH = 32;
  localparam DATA_WIDTH = 32;

  // Signals (Matching BFM expectations)
  logic                  wb_clk_i;
  logic                  wb_rst_i;

  // Wishbone Interface (wb_ prefix for BFM)
  logic [ADDR_WIDTH-1:0] wb_adr_i;
  logic [DATA_WIDTH-1:0] wb_dat_i;
  logic [DATA_WIDTH-1:0] wb_dat_o;
  logic                  wb_we_i;
  logic [           3:0] wb_sel_i;
  logic                  wb_stb_i;
  logic                  wb_cyc_i;
  logic                  wb_ack_o;
  logic                  wb_err_o;

  // Extra signals for BFM (B4 compliance) - driven by BFM tasks, unused by DUT
  logic [           2:0] wb_cti_i;
  logic [           1:0] wb_bte_i;

  logic                  spi_sclk;
  logic                  spi_mosi;
  logic                  spi_miso;
  logic                  spi_cs_n;

  logic                  intr;
  logic                  dma_tx_req;
  logic                  dma_tx_ack;
  logic                  dma_rx_req;
  logic                  dma_rx_ack;

  // Register Offsets
  localparam ADDR_DATA = 8'h00;
  localparam ADDR_SR = 8'h04;
  localparam ADDR_CR = 8'h08;
  localparam ADDR_CS = 8'h0C;
  localparam ADDR_FIFO_CTRL = 8'h10;
  localparam ADDR_FIFO_STAT = 8'h14;
  localparam ADDR_CR1 = 8'h18;

  // Instantiate DUT
  spi_master_wb #(
      .ADDR_WIDTH(ADDR_WIDTH),
      .DATA_WIDTH(DATA_WIDTH),
      .FIFO_DEPTH(4)
  ) dut (
      .clk_i(wb_clk_i),
      .rst_i(wb_rst_i),
      .adr_i(wb_adr_i),
      .dat_i(wb_dat_i),
      .dat_o(wb_dat_o),
      .we_i(wb_we_i),
      .sel_i(wb_sel_i),
      .stb_i(wb_stb_i),
      .cyc_i(wb_cyc_i),
      .ack_o(wb_ack_o),
      .err_o(wb_err_o),
      .spi_sclk(spi_sclk),
      .spi_mosi(spi_mosi),
      .spi_miso(spi_miso),
      .spi_cs_n(spi_cs_n),
      .intr(intr),
      .dma_tx_req(dma_tx_req),
      .dma_tx_ack(dma_tx_ack),
      .dma_rx_req(dma_rx_req),
      .dma_rx_ack(dma_rx_ack)
  );

  // Clock Generation
  initial begin
    wb_clk_i = 0;
    forever #5 wb_clk_i = ~wb_clk_i;
  end

  // Loopback
  assign spi_miso = spi_mosi;

  // Include Shared BFM Tasks
  `include "wb_bfm_tasks.sv"

  // Test Sequence
  initial begin
    // Initialize
    wb_rst_i = 1;
    wb_we_i = 0;
    wb_cyc_i = 0;
    wb_stb_i = 0;
    wb_sel_i = 0;
    wb_cti_i = 0;
    wb_bte_i = 0;
    dma_tx_ack = 0;
    dma_rx_ack = 0;

    #100 wb_rst_i = 0;
    #100;

    $display("--- Starting Wishbone Wrapper Test (Shared BFM) ---");

    $display("Configuring Control Register...");
    wb_write({24'h0, ADDR_CR}, 32'h0000_0401);

    // 32-bit transfer
    $display("Configuring CR1 Register...");
    wb_write({24'h0, ADDR_CR1}, 32'h0000_0020);

    $display("Selecting Slave 0...");
    wb_write({24'h0, ADDR_CS}, 32'h0000_0001);

    $display("Writing Data to TX FIFO...");
    wb_write({24'h0, ADDR_DATA}, 32'h12345678);

    $display("Waiting for Interrupt...");
    wait (intr);
    $display("Interrupt received!");

    $display("Reading Data from RX FIFO...");
    begin
      logic [31:0] read_val;
      wb_read({24'h0, ADDR_DATA}, read_val);
      $display("Read Data: %h", read_val);
      if (read_val === 32'h12345678) begin
        $display("TEST PASS: Data matched");
      end else begin
        $display("TEST FAIL: Data mismatch");
        $fatal(1, "Data mismatch in Wishbone test");
      end
    end

    $display("--- Wishbone Wrapper Test Complete ---");
    $finish;
  end

endmodule
