/*
 * tb_uart_core.sv
 *
 * Native SystemVerilog Testbench for UART Core.
 */

`timescale 1ns / 1ps

module tb_uart_core;

  // Parameters
  localparam CLK_PERIOD = 20;  // 50MHz
  localparam BAUD_DIV = 16'd27;  // 115200 @ 50MHz

  // Signals
  logic        clk;
  logic        rst_n;
  logic        uart_rxd;
  logic        uart_txd;
  logic        uart_cts_n;
  logic        uart_rts_n;
  logic        uart_de;
  logic [31:0] reg_addr;
  logic [31:0] reg_wdata;
  logic [31:0] reg_rdata;
  logic        reg_we;
  logic        reg_re;
  logic [ 3:0] reg_be;
  logic        dma_tx_req;
  logic        dma_rx_req;
  logic        intr;

  // Instantiate DUT
  uart_core #(.DEFAULT_BAUD_DIV(BAUD_DIV)) dut (.*);

  // External Loopback
  assign uart_rxd = uart_txd;

  // Clock Generation
  initial begin
    clk = 0;
    forever #(CLK_PERIOD / 2) clk = ~clk;
  end

  // Helper Tasks (Using Non-Blocking to avoid races)
  task write_reg(input [31:0] addr, input [31:0] data);
    @(posedge clk);
    reg_addr  <= addr;
    reg_wdata <= data;
    reg_we    <= 1;
    reg_be    <= 4'hF;
    @(posedge clk);
    reg_we <= 0;
  endtask

  task read_reg(input [31:0] addr, output [31:0] data);
    @(posedge clk);
    reg_addr <= addr;
    reg_re   <= 1;
    @(posedge clk);
    reg_re <= 0;
    @(posedge clk);  // Allow time for combinatorial return
    data = reg_rdata;
  endtask

  // Test Sequence
  initial begin
    // Initialize
    rst_n    <= 0;
    uart_cts_n <= 1;
    reg_addr  <= 32'hFFFF_FFFF; // Safe address
    reg_wdata <= 0;
    reg_we    <= 0;
    reg_re    <= 0;
    reg_be    <= 0;

    repeat (10) @(posedge clk);
    rst_n <= 1;
    repeat (10) @(posedge clk);

    $display("--- Starting UART Core Test ---");

    // 1. Configure UART
    // CR: TX_EN, RX_EN, 8N1 (bits 0 and 1)
    write_reg(32'h08, 32'h03);
    $display("Configured UART: 8N1, TX/RX Enabled");

    // 2. Transmit Data
    $display("Transmitting 0xA5...");
    write_reg(32'h00, 32'hA5);

    // 3. Wait for RX Ready in status register
    begin
      logic [31:0] status;
      status = 0;
      while (!(status & 32'h01)) begin
        read_reg(32'h04, status);
        repeat (100) @(posedge clk);
      end
      $display("RX Ready detected!");
    end

    // 4. Read Data
    begin
      logic [31:0] data;
      read_reg(32'h00, data);
      $display("Received Data: 0x%0h", data[7:0]);
      if (data[7:0] == 8'hA5) $display("PASS: Data matches!");
      else $display("FAIL: Data mismatch (Expected 0xA5)");
    end

    repeat (100) @(posedge clk);
    $display("--- UART Core Test Complete ---");
    $finish;
  end

endmodule
