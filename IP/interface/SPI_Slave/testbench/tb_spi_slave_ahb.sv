`timescale 1ns / 1ps

// -----------------------------------------------------------------------------
// Module Name: tb_spi_slave_ahb
// Description:
//    Testbench for the SPI Slave AHB Master Wrapper.
//
// Author: Gemini-3 AI
// -----------------------------------------------------------------------------

module tb_spi_slave_ahb;

  parameter SPI_CLK_PERIOD = 20;
  parameter AHB_CLK_PERIOD = 10;

  logic spi_clk, spi_cs_n, spi_mosi, spi_miso;
  logic hclk, hresetn;

  // AHB Interface
  logic [31:0] haddr;
  logic [2:0] hburst, hsize;
  logic hmastlock, hwrite, hready, hresp;
  logic [1:0] htrans;
  logic [3:0] hprot;
  logic [31:0] hwdata, hrdata;

  initial begin
    spi_clk = 0;
    forever #(SPI_CLK_PERIOD / 2) spi_clk = ~spi_clk;
  end
  initial begin
    hclk = 0;
    forever #(AHB_CLK_PERIOD / 2) hclk = ~hclk;
  end

  spi_slave_ahb u_dut (.*);

  // AHB Slave Model
  logic [31:0] memory      [0:255];
  logic [31:0] haddr_reg;
  logic        hwrite_reg;
  logic        hactive_reg;

  initial begin
    for (int i = 0; i < 256; i++) memory[i] = 0;
  end

  // Combinatorial Read Data
  always_comb begin
    if (hactive_reg && !hwrite_reg) hrdata = memory[haddr_reg[9:2]];
    else hrdata = 32'h0;
  end

  always_ff @(posedge hclk or negedge hresetn) begin
    if (!hresetn) begin
      hready <= 1'b1;
      hresp <= 1'b0;
      haddr_reg <= '0;
      hwrite_reg <= 1'b0;
      hactive_reg <= 1'b0;
    end else begin
      hready <= 1'b1;

      // Data Phase (Write)
      if (hactive_reg && hwrite_reg) begin
        memory[haddr_reg[9:2]] <= hwdata;
        $display("[AHB Slave] Write Addr: 0x%08x, Data: 0x%08x", haddr_reg, hwdata);
      end

      // Address Phase Capture
      if (htrans == 2'b10) begin  // NONSEQ
        haddr_reg   <= haddr;
        hwrite_reg  <= hwrite;
        hactive_reg <= 1'b1;
      end else begin
        hactive_reg <= 1'b0;
      end
    end
  end

  // SPI Tasks (Reuse from AXI TB)
  task spi_transfer_byte(input logic [7:0] data_out, output logic [7:0] data_in);
    integer i;
    for (i = 7; i >= 0; i = i - 1) begin
      @(negedge spi_clk);
      spi_mosi = data_out[i];
      @(posedge spi_clk);
      data_in[i] = spi_miso;
    end
  endtask

  task spi_transfer_word(input logic [31:0] data_out, output logic [31:0] data_read);
    logic [7:0] b0, b1, b2, b3;
    logic [7:0] unused;
    begin
      spi_transfer_byte(data_out[31:24], b3);
      spi_transfer_byte(data_out[23:16], b2);
      spi_transfer_byte(data_out[15:8], b1);
      spi_transfer_byte(data_out[7:0], b0);
      data_read = {b3, b2, b1, b0};
    end
  endtask

  logic [31:0] read_val;
  initial begin
    logic [31:0] wdata  [4];
    logic [31:0] rdata  [4];
    logic [ 7:0] unused;

    spi_cs_n = 1;
    spi_mosi = 0;
    hresetn  = 0;
    repeat (10) @(posedge hclk);
    hresetn = 1;
    repeat (10) @(posedge hclk);

    // Test Single
    $display("[TB] Single Write...");
    @(negedge spi_clk);
    spi_cs_n = 0;
    spi_transfer_byte(8'h60, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(8'h08, unused);
    spi_transfer_word(32'hAAAA5555, unused);
    @(negedge spi_clk);
    @(negedge spi_clk);
    spi_cs_n = 1;
    repeat (20) @(posedge hclk);

    $display("[TB] Single Read...");
    @(negedge spi_clk);
    spi_cs_n = 0;
    spi_transfer_byte(8'h20, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(8'h08, unused);
    repeat (4) spi_transfer_byte(8'h0, unused);
    spi_transfer_word(32'h0, rdata[0]);
    @(negedge spi_clk);
    @(negedge spi_clk);
    spi_cs_n = 1;

    if (rdata[0] !== 32'hAAAA5555) begin
      $display("[TB] ERROR: Read Mismatch! Got 0x%x", rdata[0]);
      $fatal(1);
    end
    $display("[TB] PASS: AHB Single Match");

    // Test Burst
    $display("[TB] Burst Write...");
    wdata[0] = 32'h12345678;
    wdata[1] = 32'h9ABCDEF0;
    wdata[2] = 32'h0FEDCBA9;
    wdata[3] = 32'h87654321;
    @(negedge spi_clk);
    spi_cs_n = 0;
    spi_transfer_byte(8'hE0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(8'h20, unused);
    for (int i = 0; i < 4; i++) spi_transfer_word(wdata[i], unused);
    @(negedge spi_clk);
    @(negedge spi_clk);
    spi_cs_n = 1;
    repeat (20) @(posedge hclk);

    $display("[TB] Burst Read...");
    @(negedge spi_clk);
    spi_cs_n = 0;
    spi_transfer_byte(8'hA0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(8'h20, unused);
    repeat (4) spi_transfer_byte(8'h0, unused);
    for (int i = 0; i < 4; i++) spi_transfer_word(32'h0, rdata[i]);
    @(negedge spi_clk);
    @(negedge spi_clk);
    spi_cs_n = 1;

    for (int i = 0; i < 4; i++) begin
      if (rdata[i] !== wdata[i]) begin
        $display("[TB] ERROR: Burst Mismatch at index %0d! Exp: 0x%x, Got 0x%x", i, wdata[i],
                 rdata[i]);
        $fatal(1);
      end
    end
    $display("[TB] PASS: AHB Burst Match");

    $finish;
  end

  initial begin
    $dumpfile("spi_slave_ahb.vcd");
    $dumpvars(0, tb_spi_slave_ahb);
  end

endmodule
