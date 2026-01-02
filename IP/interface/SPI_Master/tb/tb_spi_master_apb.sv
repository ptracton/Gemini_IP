

module tb_spi_master_apb;

  localparam ADDR_WIDTH = 32;
  localparam DATA_WIDTH = 32;

  // Signals (Matching BFM expectations)
  logic                  pclk;
  logic                  presetn;
  logic [ADDR_WIDTH-1:0] paddr;
  logic                  psel;
  logic                  penable;
  logic                  pwrite;
  logic [DATA_WIDTH-1:0] pwdata;
  logic [           3:0] pstrb;
  logic [           2:0] pprot;
  logic                  pready;
  logic [DATA_WIDTH-1:0] prdata;
  logic                  pslverr;

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
  spi_master_apb #(
      .ADDR_WIDTH(ADDR_WIDTH),
      .DATA_WIDTH(DATA_WIDTH),
      .FIFO_DEPTH(4)
  ) dut (
      .*
  );

  // Clock Generation
  initial begin
    pclk = 0;
    forever #5 pclk = ~pclk;
  end

  // Loopback
  assign spi_miso = spi_mosi;  // Simple loopback

  // Include Shared BFM Tasks
  `include "apb_bfm_tasks.sv"

  // Test Sequence
  initial begin
    // Initialize
    presetn = 0;
    psel    = 0;
    penable = 0;
    pwrite  = 0;
    pstrb   = 0;
    pprot   = 0;
    dma_tx_ack = 0;
    dma_rx_ack = 0;

    #100 presetn = 1;
    #100;

    $display("--- Starting APB Wrapper Test (Shared BFM) ---");

    // 1. Configure Core
    $display("Configuring Control Register...");
    apb_write({24'h0, ADDR_CR}, 32'h0000_0401);

    // 32-bit, MSB first
    $display("Configuring CR1 Register...");
    apb_write({24'h0, ADDR_CR1}, 32'h0000_0020);

    $display("Selecting Slave 0...");
    apb_write({24'h0, ADDR_CS}, 32'h0000_0001);

    // 3. Send Data
    $display("Writing Data to TX FIFO...");
    apb_write({24'h0, ADDR_DATA}, 32'hDEADBEEF);

    // 4. Wait for Interrupt
    $display("Waiting for Interrupt...");
    wait (intr);
    $display("Interrupt received!");

    // 5. Read Data
    $display("Reading Data from RX FIFO...");
    begin
      logic [31:0] read_val;
      apb_read({24'h0, ADDR_DATA}, read_val);
      $display("Read Data: %h", read_val);
      if (read_val === 32'hDEADBEEF) begin
        $display("TEST PASS: Data matched");
      end else begin
        $display("TEST FAIL: Data mismatch");
        $fatal(1, "Data mismatch in APB test");
      end
    end

    $display("--- APB Wrapper Test Complete ---");
    $finish;
  end

endmodule
