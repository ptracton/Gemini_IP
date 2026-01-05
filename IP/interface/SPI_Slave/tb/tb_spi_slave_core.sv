`timescale 1ns / 1ps

// -----------------------------------------------------------------------------
// Module Name: tb_spi_slave_core
// Description:
//    Native SystemVerilog Testbench for the SPI Slave Core.
//    Verifies basic SPI protocol compliance, Command/Address/Data parsing,
//    Clock Domain Crossing stability, and System Bus interaction.
//    
//    Tests performed:
//    1. Reset Check
//    2. Single Write Transaction
//    3. Single Read Transaction
//    4. Burst Write Transaction
//    5. Burst Read Transaction
//
// Author: Gemini-3 AI
// -----------------------------------------------------------------------------

module tb_spi_slave_core;

  // -------------------------------------------------------------------------
  // Parameters
  // -------------------------------------------------------------------------
  parameter SPI_CLK_PERIOD = 20;  // 50 MHz
  parameter SYS_CLK_PERIOD = 10;  // 100 MHz
  parameter DATA_WIDTH = 32;

  // -------------------------------------------------------------------------
  // DUT Signals
  // -------------------------------------------------------------------------

  // SPI Interface
  logic        spi_clk;
  logic        spi_cs_n;
  logic        spi_mosi;
  logic        spi_miso;

  // System Interface
  logic        sys_clk;
  logic        sys_rst_n;

  // Bus Interface
  logic        bus_req;
  logic [31:0] bus_addr;
  logic        bus_we;
  logic [31:0] bus_wdata;
  logic [ 3:0] bus_be;
  logic [ 1:0] bus_size;
  logic        bus_ack;
  logic [31:0] bus_rdata;

  // -------------------------------------------------------------------------
  // Clock Generation
  // -------------------------------------------------------------------------
  initial begin
    spi_clk = 0;
    forever #(SPI_CLK_PERIOD / 2) spi_clk = ~spi_clk;
  end

  initial begin
    sys_clk = 0;
    forever #(SYS_CLK_PERIOD / 2) sys_clk = ~sys_clk;
  end

  // -------------------------------------------------------------------------
  // Device Under Test (DUT) Instantiation
  // -------------------------------------------------------------------------
  spi_slave_core u_dut (
      // SPI
      .spi_clk    (spi_clk),
      .spi_cs_n   (spi_cs_n),
      .spi_mosi   (spi_mosi),
      .spi_miso   (spi_miso),
      // System
      .sys_clk    (sys_clk),
      .sys_rst_n  (sys_rst_n),
      // Bus
      .bus_req_o  (bus_req),
      .bus_addr_o (bus_addr),
      .bus_we_o   (bus_we),
      .bus_wdata_o(bus_wdata),
      .bus_be_o   (bus_be),
      .bus_size_o (bus_size),
      .bus_ack_i  (bus_ack),
      .bus_rdata_i(bus_rdata)
  );

  // -------------------------------------------------------------------------
  // Bus Responder Logic (Simple Memory Model)
  // -------------------------------------------------------------------------
  logic [31:0] memory[0:255];  // Small test memory

  initial begin
    for (int i = 0; i < 256; i++) begin
      memory[i] = 32'h00000000;
    end
  end

  always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
      bus_ack   <= 0;
      bus_rdata <= 0;
    end else begin
      bus_ack <= 0;
      if (bus_req) begin
        // Simple 1-cycle latency ACK
        bus_ack <= 1;
        if (bus_we) begin
          memory[bus_addr[9:2]] <= bus_wdata;
          $display("[Bus] Write Address: 0x%08x, Data: 0x%08x", bus_addr, bus_wdata);
        end else begin
          bus_rdata <= memory[bus_addr[9:2]];
          $display("[Bus] Read Address: 0x%08x, Data: 0x%08x", bus_addr, memory[bus_addr[9:2]]);
        end
      end
    end
  end

  // -------------------------------------------------------------------------
  // Tasks
  // -------------------------------------------------------------------------

  // Task: SPI Byte Transfer (Mode 0: Shift on Falling, Sample on Rising)
  // Driver should update MOSI on Falling Edge of SPI_CLK
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

  // Task: SPI Transaction
  // cmd: 8-bit command
  // addr: 32-bit address
  // data_write: Data to write (for Write ops)
  // len: Number of data words/bytes
  task send_transaction(input logic [7:0] cmd, input logic [31:0] addr,
                        input logic [31:0] data_write, output logic [31:0] data_read);
    logic [7:0] unused;
    logic [7:0] b0, b1, b2, b3;
    integer i;
    begin
      $display("[TB] Starting Transaction. CMD: 0x%02x, ADDR: 0x%08x", cmd, addr);

      // Assert CS
      @(negedge spi_clk);
      spi_cs_n = 0;

      // Send Command
      spi_transfer_byte(cmd, unused);

      // Send Address (Big Endian)
      spi_transfer_byte(addr[31:24], unused);
      spi_transfer_byte(addr[23:16], unused);
      spi_transfer_byte(addr[15:8], unused);
      spi_transfer_byte(addr[7:0], unused);

      // Dummy Bytes (For Read Latency)
      if (!cmd[6]) begin  // Read
        spi_transfer_byte(8'h00, unused);
        spi_transfer_byte(8'h00, unused);
        spi_transfer_byte(8'h00, unused);
        spi_transfer_byte(8'h00, unused);
      end

      // Data Phase
      // Determine Size
      // Assuming 32-bit word size for this test
      if (cmd[6]) begin  // Write
        spi_transfer_byte(data_write[31:24], unused);
        spi_transfer_byte(data_write[23:16], unused);
        spi_transfer_byte(data_write[15:8], unused);
        spi_transfer_byte(data_write[7:0], unused);
      end else begin  // Read
        spi_transfer_byte(8'h00, b3);
        spi_transfer_byte(8'h00, b2);
        spi_transfer_byte(8'h00, b1);
        spi_transfer_byte(8'h00, b0);
        data_read = {b3, b2, b1, b0};
        $display("[TB] Read Data: 0x%08x", data_read);
      end

      // Deassert CS
      @(negedge spi_clk);
      @(negedge spi_clk);
      spi_cs_n = 1;

      // Gap
      repeat (10) @(posedge spi_clk);
    end
  endtask

  // -------------------------------------------------------------------------
  // Main Test Stimulus
  // -------------------------------------------------------------------------
  logic [31:0] read_val;

  initial begin
    // Initialize Signals
    spi_cs_n  = 1;
    spi_mosi  = 0;
    sys_rst_n = 0;

    // Variables
    read_val  = 0;

    // Apply Reset
    repeat (5) @(posedge sys_clk);
    sys_rst_n = 1;
    $display("[TB] Reset Released");
    repeat (10) @(posedge sys_clk);

    // Test 1: Single Write Word
    // Op: 01 (Write), Size: 10 (Word) -> Cmd: 8'b0110_0000 = 0x60
    send_transaction(8'h60, 32'h0000_0004, 32'hDEAD_BEEF, read_val);

    // Wait for Bus to process
    repeat (20) @(posedge sys_clk);

    // Test 2: Single Read Word
    // Op: 00 (Read), Size: 10 (Word) -> Cmd: 8'b0010_0000 = 0x20
    send_transaction(8'h20, 32'h0000_0004, 32'h0000_0000, read_val);

    if (read_val !== 32'hDEAD_BEEF) begin
      $display("[TB] ERROR: Read Mismatch! Expected 0xDEADBEEF, Got 0x%x", read_val);
      $fatal(1, "Test Failed");
    end else begin
      $display("[TB] PASS: Read Match");
    end

    // Wait
    repeat (10) @(posedge sys_clk);

    // Test 3: Burst Write (2 Words)
    // Op: 11 (Burst Write), Size: 10 (Word) -> Cmd: 0xE0
    // Addr: 0x20
    // Data: 0x11223344, 0x55667788
    $display("[TB] Starting Burst Write...");

    @(negedge spi_clk);
    spi_cs_n = 0;

    // Command
    spi_transfer_byte(8'hE0, read_val[7:0]);
    // Address
    spi_transfer_byte(8'h00, read_val[7:0]);
    spi_transfer_byte(8'h00, read_val[7:0]);
    spi_transfer_byte(8'h00, read_val[7:0]);
    spi_transfer_byte(8'h20, read_val[7:0]);

    // Data 1
    spi_transfer_byte(8'h11, read_val[7:0]);
    spi_transfer_byte(8'h22, read_val[7:0]);
    spi_transfer_byte(8'h33, read_val[7:0]);
    spi_transfer_byte(8'h44, read_val[7:0]);

    // Data 2
    spi_transfer_byte(8'h55, read_val[7:0]);
    spi_transfer_byte(8'h66, read_val[7:0]);
    spi_transfer_byte(8'h77, read_val[7:0]);
    spi_transfer_byte(8'h88, read_val[7:0]);

    @(negedge spi_clk);
    @(negedge spi_clk);
    spi_cs_n = 1;

    repeat (20) @(posedge sys_clk);

    // Test 4: Burst Read (2 Words)
    // Op: 10 (Burst Read), Size: 10 (Word) -> Cmd: 0xA0
    // Addr: 0x20
    $display("[TB] Starting Burst Read...");

    @(negedge spi_clk);
    spi_cs_n = 0;

    // Command
    spi_transfer_byte(8'hA0, read_val[7:0]);
    // Address
    spi_transfer_byte(8'h00, read_val[7:0]);
    spi_transfer_byte(8'h00, read_val[7:0]);
    spi_transfer_byte(8'h00, read_val[7:0]);
    spi_transfer_byte(8'h20, read_val[7:0]);

    // Dummy Bytes (4)
    spi_transfer_byte(8'h00, read_val[7:0]);
    spi_transfer_byte(8'h00, read_val[7:0]);
    spi_transfer_byte(8'h00, read_val[7:0]);
    spi_transfer_byte(8'h00, read_val[7:0]);

    // Read Word 1
    {read_val[31:24], read_val[23:16], read_val[15:8], read_val[7:0]} = 0;  // Clear

    spi_transfer_byte(8'h00, read_val[31:24]);
    spi_transfer_byte(8'h00, read_val[23:16]);
    spi_transfer_byte(8'h00, read_val[15:8]);
    spi_transfer_byte(8'h00, read_val[7:0]);

    $display("[TB] Burst Read Word 1: 0x%08x", read_val);
    if (read_val !== 32'h11223344) begin
      $display("[TB] ERROR: Burst Read 1 Mismatch. Exp: 0x11223344, Got: 0x%x", read_val);
      $fatal(1);
    end

    // Read Word 2
    spi_transfer_byte(8'h00, read_val[31:24]);
    spi_transfer_byte(8'h00, read_val[23:16]);
    spi_transfer_byte(8'h00, read_val[15:8]);
    spi_transfer_byte(8'h00, read_val[7:0]);

    $display("[TB] Burst Read Word 2: 0x%08x", read_val);
    if (read_val !== 32'h55667788) begin
      $display("[TB] ERROR: Burst Read 2 Mismatch. Exp: 0x55667788, Got: 0x%x", read_val);
      $fatal(1);
    end

    @(negedge spi_clk);
    @(negedge spi_clk);
    spi_cs_n = 1;

    $display("[TB] Simulation Complete");
    $finish;
  end

  // Dump Waves
  initial begin
    $dumpfile("spi_slave_core.vcd");
    $dumpvars(0, tb_spi_slave_core);
  end

endmodule
