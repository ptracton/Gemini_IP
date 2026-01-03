/*
 * File: tb_sp_memory.sv
 * Description: Native Testbench for Single Port Memory Core
 * Author: Gemini-3 AI
 */

`timescale 1ns / 1ps

module tb_sp_memory;

  // Parameters
  parameter int WIDTH = 32;
  parameter int DEPTH = 256;
  parameter string TECHNOLOGY = "GENERIC";

  // Signals
  logic                     clk;
  logic                     rst_n;
  logic                     cs;
  logic                     we;
  logic [$clog2(DEPTH)-1:0] addr;
  logic [        WIDTH-1:0] wdata;
  logic [    (WIDTH/8)-1:0] wstrb;
  logic [        WIDTH-1:0] rdata;

  // DUT Instantiation
  sp_memory #(
      .WIDTH(WIDTH),
      .DEPTH(DEPTH),
      .TECHNOLOGY(TECHNOLOGY)
  ) dut (
      .clk(clk),
      .rst_n(rst_n),
      .cs(cs),
      .we(we),
      .addr(addr),
      .wdata(wdata),
      .wstrb(wstrb),
      .rdata(rdata),
      .sleep(1'b0),
      .bist_en(1'b0),
      .bist_done(),
      .bist_pass(),
      .err_parity(),
      .err_ecc_single(),
      .err_ecc_double()
  );

  // Clock Generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test Tasks
  task write_word(input logic [$clog2(DEPTH)-1:0] w_addr, input logic [WIDTH-1:0] w_data,
                  input logic [(WIDTH/8)-1:0] w_strb);
    @(posedge clk);
    cs    <= 1'b1;
    we    <= 1'b1;
    addr  <= w_addr;
    wdata <= w_data;
    wstrb <= w_strb;
    @(posedge clk);
    cs    <= 1'b0;
    we    <= 1'b0;
    wdata <= '0;
    wstrb <= '0;
  endtask

  task read_check(input logic [$clog2(DEPTH)-1:0] r_addr, input logic [WIDTH-1:0] expected_data);
    @(posedge clk);
    cs   <= 1'b1;
    we   <= 1'b0;
    addr <= r_addr;
    @(posedge clk);
    cs <= 1'b0;
    // Data ready in this cycle (synchronous read)
    @(negedge clk);
    if (rdata !== expected_data) begin
      $display("ERROR: Addr 0x%0h: Expected 0x%0h, Got 0x%0h", r_addr, expected_data, rdata);
    end else begin
      $display("PASS:  Addr 0x%0h: Got 0x%0h", r_addr, rdata);
    end
  endtask

  // Main Test Sequence
  initial begin
    // Initialize
    rst_n = 0;
    cs = 0;
    we = 0;
    addr = 0;
    wdata = 0;
    wstrb = 0;

    #20;
    rst_n = 1;
    #20;

    $display("Starting Test...");

    if (WIDTH == 32) begin
      // 1. Basic Read/Write Full Word
      $display("Test 1: Basic Write/Read");
      write_word(8'h10, 32'hDEADBEEF, 4'b1111);
      write_word(8'h20, 32'hCAFEBABE, 4'b1111);

      read_check(8'h10, 32'hDEADBEEF);
      read_check(8'h20, 32'hCAFEBABE);

      // 2. Byte Enable Test
      $display("Test 2: Byte Enables");
      // Write pattern
      write_word(8'h30, 32'h12345678, 4'b1111);
      // Overwrite only lower byte
      write_word(8'h30, 32'h000000AA, 4'b0001);
      read_check(8'h30, 32'h123456AA);

      // Overwrite upper byte
      write_word(8'h30, 32'hBB000000, 4'b1000);
      read_check(8'h30, 32'hBB3456AA);

      // Overwrite middle bytes
      write_word(8'h30, 32'h00CCDD00, 4'b0110);
      read_check(8'h30, 32'hBBCCDDAA);
    end else begin
      // Wide Access Test
      $display("Test 3: Wide Access (WIDTH=%0d)", WIDTH);
      // Write full width all 1s
      write_word(8'h40, {WIDTH{1'b1}}, {(WIDTH / 8) {1'b1}});
      read_check(8'h40, {WIDTH{1'b1}});

      // Write alternating pattern
      write_word(8'h50, {(WIDTH / 32) {32'h55555555}}, {(WIDTH / 8) {1'b1}});
      read_check(8'h50, {(WIDTH / 32) {32'h55555555}});
    end

    $display("Test Complete.");
    $finish;
  end

  // Dump waves
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_sp_memory);
  end

endmodule
