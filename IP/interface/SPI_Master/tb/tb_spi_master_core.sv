

module tb_spi_master_core;

  logic        clk;
  logic        rst_n;
  logic        sclk;
  logic        mosi;
  logic        miso;
  logic [31:0] tx_data;
  logic        tx_push;
  logic        tx_full;
  logic [31:0] rx_data;
  logic        rx_pop;
  logic        rx_empty;
  logic cpol, cpha;
  logic [7:0] clk_div;
  logic [5:0] word_len;
  logic lsb_first, loopback, enable, busy, done_intr;

  // Instantiate DUT
  spi_master_core #(
      .FIFO_DEPTH(4)
  ) dut (
      .*,
      .tx_almost_full (),
      .rx_almost_empty()
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Loopback
  assign miso = (loopback) ? mosi : 1'b0;

  task reset_dut();
    rst_n = 0;
    tx_push = 0;
    rx_pop = 0;
    enable = 0;
    cpol = 0;
    cpha = 0;
    clk_div = 4;
    word_len = 8;
    lsb_first = 0;
    loopback = 1;
    #100 rst_n = 1;
    #100;
    enable = 1;
    #20;
  endtask

  task test_transfer(input [31:0] data, input [5:0] len, input lsb);
    $display("--- Starting transfer: len=%0d, lsb=%b, data=%h ---", len, lsb, data);
    word_len  = len;
    lsb_first = lsb;

    tx_data   = data;
    tx_push <= 1;
    @(posedge clk);
    tx_push <= 0;

    // Wait for core to signal done
    wait (done_intr);

    // Wait for FIFO data to be available (FWFT)
    wait (!rx_empty);
    @(posedge clk);
    #1;

    $display("Test Result: sent=%h, received=%h", data, rx_data);
    rx_pop <= 1;
    @(posedge clk);
    rx_pop <= 0;
    @(posedge clk);
  endtask

  initial begin
    reset_dut();

    // Mode 0, 8-bit
    test_transfer(32'h000000A5, 8, 0);

    // Mode 0, 16-bit
    test_transfer(32'h00001234, 16, 0);

    // Mode 0, 32-bit
    test_transfer(32'hDEADBEEF, 32, 0);

    // LSB First
    test_transfer(32'h00000ABC, 12, 1);

    $display("Enhanced SPI Core Test Complete");
    $finish;
  end

endmodule
