

module tb_spi_master_axi;

  localparam ADDR_WIDTH = 32;
  localparam DATA_WIDTH = 32;

  // Signals (Matching BFM expectations)
  logic                    aclk;
  logic                    aresetn;

  // AXI4-Lite Interface (s_axi_ prefix for BFM)
  logic [  ADDR_WIDTH-1:0] s_axi_awaddr;
  logic [             2:0] s_axi_awprot;
  logic                    s_axi_awvalid;
  logic                    s_axi_awready;
  logic [  DATA_WIDTH-1:0] s_axi_wdata;
  logic [DATA_WIDTH/8-1:0] s_axi_wstrb;
  logic                    s_axi_wvalid;
  logic                    s_axi_wready;
  logic [             1:0] s_axi_bresp;
  logic                    s_axi_bvalid;
  logic                    s_axi_bready;
  logic [  ADDR_WIDTH-1:0] s_axi_araddr;
  logic [             2:0] s_axi_arprot;
  logic                    s_axi_arvalid;
  logic                    s_axi_arready;
  logic [  DATA_WIDTH-1:0] s_axi_rdata;
  logic [             1:0] s_axi_rresp;
  logic                    s_axi_rvalid;
  logic                    s_axi_rready;

  logic                    spi_sclk;
  logic                    spi_mosi;
  logic                    spi_miso;
  logic                    spi_cs_n;

  logic                    intr;
  logic                    dma_tx_req;
  logic                    dma_tx_ack;
  logic                    dma_rx_req;
  logic                    dma_rx_ack;

  // Register Offsets
  localparam ADDR_DATA = 8'h00;
  localparam ADDR_SR = 8'h04;
  localparam ADDR_CR = 8'h08;
  localparam ADDR_CS = 8'h0C;
  localparam ADDR_FIFO_CTRL = 8'h10;
  localparam ADDR_FIFO_STAT = 8'h14;
  localparam ADDR_CR1 = 8'h18;

  // Instantiate DUT
  spi_master_axi #(
      .ADDR_WIDTH(ADDR_WIDTH),
      .DATA_WIDTH(DATA_WIDTH),
      .FIFO_DEPTH(4)
  ) dut (
      .aclk(aclk),
      .aresetn(aresetn),
      .awaddr(s_axi_awaddr),
      .awprot(s_axi_awprot),
      .awvalid(s_axi_awvalid),
      .awready(s_axi_awready),
      .wdata(s_axi_wdata),
      .wstrb(s_axi_wstrb),
      .wvalid(s_axi_wvalid),
      .wready(s_axi_wready),
      .bresp(s_axi_bresp),
      .bvalid(s_axi_bvalid),
      .bready(s_axi_bready),
      .araddr(s_axi_araddr),
      .arprot(s_axi_arprot),
      .arvalid(s_axi_arvalid),
      .arready(s_axi_arready),
      .rdata(s_axi_rdata),
      .rresp(s_axi_rresp),
      .rvalid(s_axi_rvalid),
      .rready(s_axi_rready),
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
    aclk = 0;
    forever #5 aclk = ~aclk;
  end

  // Loopback
  assign spi_miso = spi_mosi;

  // Include Shared BFM Tasks
  `include "axi_bfm_tasks.sv"

  // Test Sequence
  initial begin
    // Initialize
    aresetn = 0;

    // Default drives needed for signals not driven by BFM init
    s_axi_awvalid = 0;
    s_axi_wvalid = 0;
    s_axi_arvalid = 0;
    s_axi_bready = 0;
    s_axi_rready = 0;
    s_axi_awprot = 0;
    s_axi_arprot = 0;

    dma_tx_ack = 0;
    dma_rx_ack = 0;

    #100 aresetn = 1;
    #100;

    $display("--- Starting AXI Wrapper Test (Shared BFM) ---");

    $display("Configuring Control Register...");
    axi_write({24'h0, ADDR_CR}, 32'h0000_0401);

    // 32-bit transfer
    $display("Configuring CR1 Register...");
    axi_write({24'h0, ADDR_CR1}, 32'h0000_0020);

    $display("Selecting Slave 0...");
    axi_write({24'h0, ADDR_CS}, 32'h0000_0001);

    $display("Writing Data to TX FIFO...");
    axi_write({24'h0, ADDR_DATA}, 32'hCAFEBABE);

    $display("Waiting for Interrupt...");
    wait (intr);
    $display("Interrupt received!");

    $display("Reading Data from RX FIFO...");
    begin
      logic [31:0] read_val;
      axi_read({24'h0, ADDR_DATA}, read_val);
      $display("Read Data: %h", read_val);
      if (read_val === 32'hCAFEBABE) begin
        $display("TEST PASS: Data matched");
      end else begin
        $display("TEST FAIL: Data mismatch");
        $fatal(1, "Data mismatch in AXI test");
      end
    end

    $display("--- AXI Wrapper Test Complete ---");
    $finish;
  end

endmodule
