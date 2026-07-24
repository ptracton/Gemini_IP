`timescale 1ns / 1ps

// -----------------------------------------------------------------------------
// Module Name: tb_spi_slave_wb
// Description:
//    Testbench for the SPI Slave Wishbone Wrapper.
//    Verifies that SPI commands are correctly translated to Wishbone transactions.
//
// Author: Gemini-3 AI
// -----------------------------------------------------------------------------

module tb_spi_slave_wb;

  // -------------------------------------------------------------------------
  // Parameters
  // -------------------------------------------------------------------------
  parameter SPI_CLK_PERIOD = 20;  // 50 MHz
  parameter WB_CLK_PERIOD = 10;  // 100 MHz

  // -------------------------------------------------------------------------
  // Signals
  // -------------------------------------------------------------------------

  // SPI Interface
  logic        spi_clk;
  logic        spi_cs_n;
  logic        spi_mosi;
  logic        spi_miso;

  // Wishbone Interface
  logic        wb_clk;
  logic        wb_rst;  // Active High
  logic        wb_cyc;
  logic        wb_stb;
  logic        wb_we;
  logic [31:0] wb_addr;
  logic [31:0] wb_data_o;  // Master -> Slave
  logic [ 3:0] wb_sel;
  logic        wb_ack;
  logic [31:0] wb_data_i;  // Slave -> Master

  // -------------------------------------------------------------------------
  // Clock Generation
  // -------------------------------------------------------------------------
  initial begin
    spi_clk = 0;
    forever #(SPI_CLK_PERIOD / 2) spi_clk = ~spi_clk;
  end

  initial begin
    wb_clk = 0;
    forever #(WB_CLK_PERIOD / 2) wb_clk = ~wb_clk;
  end

  // -------------------------------------------------------------------------
  // DUT Instantiation
  // -------------------------------------------------------------------------
  spi_slave_wb u_dut (
      .spi_clk (spi_clk),
      .spi_cs_n(spi_cs_n),
      .spi_mosi(spi_mosi),
      .spi_miso(spi_miso),

      .wb_clk_i (wb_clk),
      .wb_rst_i (wb_rst),
      .wb_cyc_o (wb_cyc),
      .wb_stb_o (wb_stb),
      .wb_we_o  (wb_we),
      .wb_addr_o(wb_addr),
      .wb_data_o(wb_data_o),
      .wb_sel_o (wb_sel),
      .wb_ack_i (wb_ack),
      .wb_data_i(wb_data_i)
  );

  // -------------------------------------------------------------------------
  // Wishbone Slave Model (Memory)
  // -------------------------------------------------------------------------
  logic [31:0] memory[0:255];

  initial begin
    for (int i = 0; i < 256; i++) begin
      memory[i] = 32'h00000000;
    end
  end

  always @(posedge wb_clk or posedge wb_rst) begin
    if (wb_rst) begin
      wb_ack    <= 0;
      wb_data_i <= 0;
    end else begin
      wb_ack <= 0;
      if (wb_cyc && wb_stb) begin
        // Simple 1-cycle latency ACK
        wb_ack <= 1;
        if (wb_we) begin
          memory[wb_addr[9:2]] <= wb_data_o;
          $display("[WB Slave] Write Addr: 0x%08x, Data: 0x%08x, Sel: %b", wb_addr, wb_data_o,
                   wb_sel);
        end else begin
          wb_data_i <= memory[wb_addr[9:2]];
          $display("[WB Slave] Read Addr: 0x%08x, Data: 0x%08x", wb_addr, memory[wb_addr[9:2]]);
        end
      end
    end
  end

  // -------------------------------------------------------------------------
  // SPI Tasks (Reused from Core TB)
  // -------------------------------------------------------------------------
  task spi_transfer_byte(input logic [7:0] data_out, output logic [7:0] data_in);
    integer i;
    begin
      for (i = 7; i >= 0; i = i - 1) begin
        @(negedge spi_clk);
        spi_mosi = data_out[i];
        @(posedge spi_clk);
        data_in[i] = spi_miso;
      end
    end
  endtask

  task spi_transfer_word(input logic [31:0] data_out, output logic [31:0] data_in);
    logic [7:0] b0, b1, b2, b3;
    logic [7:0] unused;
    begin
      spi_transfer_byte(data_out[31:24], b3);
      spi_transfer_byte(data_out[23:16], b2);
      spi_transfer_byte(data_out[15:8], b1);
      spi_transfer_byte(data_out[7:0], b0);
      data_in = {b3, b2, b1, b0};
    end
  endtask

  // -------------------------------------------------------------------------
  // Stimulus
  // -------------------------------------------------------------------------
  logic [31:0] read_val;

  initial begin
    logic [31:0] wdata  [4];
    logic [31:0] rdata  [4];
    logic [ 7:0] unused;

    spi_cs_n = 1;
    spi_mosi = 0;
    wb_rst   = 1;

    repeat (5) @(posedge wb_clk);
    wb_rst = 0;
    $display("[TB] Reset Released");
    repeat (10) @(posedge wb_clk);

    // Test 1: Single Write
    $display("[TB] Single Write...");
    @(negedge spi_clk);
    spi_cs_n = 0;
    spi_transfer_byte(8'h60, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(8'h04, unused);
    spi_transfer_word(32'hDEADBEEF, unused);
    @(negedge spi_clk);
    @(negedge spi_clk);
    spi_cs_n = 1;
    repeat (20) @(posedge wb_clk);

    // Test 2: Single Read
    $display("[TB] Single Read...");
    @(negedge spi_clk);
    spi_cs_n = 0;
    spi_transfer_byte(8'h20, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(8'h04, unused);
    repeat (4) spi_transfer_byte(8'h0, unused);  // Dummy
    spi_transfer_word(32'h0, rdata[0]);
    @(negedge spi_clk);
    @(negedge spi_clk);
    spi_cs_n = 1;

    if (rdata[0] !== 32'hDEADBEEF) begin
      $display("[TB] ERROR: Read Mismatch! Got 0x%x", rdata[0]);
      $fatal(1);
    end
    $display("[TB] PASS: Wishbone Single Match");

    // Test 3: Burst Write
    $display("[TB] Burst Write...");
    wdata[0] = 32'h11111111;
    wdata[1] = 32'h22222222;
    wdata[2] = 32'h33333333;
    wdata[3] = 32'h44444444;
    @(negedge spi_clk);
    spi_cs_n = 0;
    spi_transfer_byte(8'hE0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(8'h10, unused);
    for (int i = 0; i < 4; i++) spi_transfer_word(wdata[i], unused);
    @(negedge spi_clk);
    @(negedge spi_clk);
    spi_cs_n = 1;
    repeat (20) @(posedge wb_clk);

    // Test 4: Burst Read
    $display("[TB] Burst Read...");
    @(negedge spi_clk);
    spi_cs_n = 0;
    spi_transfer_byte(8'hA0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(8'h10, unused);
    repeat (4) spi_transfer_byte(8'h0, unused);  // Dummy
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
    $display("[TB] PASS: Wishbone Burst Match");

    $finish;
  end

  // Dump Waves
  initial begin
    $dumpfile("spi_slave_wb.vcd");
    $dumpvars(0, tb_spi_slave_wb);
  end

endmodule
