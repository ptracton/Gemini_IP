`timescale 1ns / 1ps

// -----------------------------------------------------------------------------
// Module Name: tb_spi_slave_axi
// Description:
//    Testbench for the SPI Slave AXI4-Lite Wrapper.
//
// Author: Gemini-3 AI
// -----------------------------------------------------------------------------

module tb_spi_slave_axi;

  parameter SPI_CLK_PERIOD = 20;
  parameter AXI_CLK_PERIOD = 10;

  logic spi_clk, spi_cs_n, spi_mosi, spi_miso;
  logic aclk, aresetn;

  // AXI Channels
  logic [31:0] m_axi_awaddr;
  logic [ 2:0] m_axi_awprot;
  logic m_axi_awvalid, m_axi_awready;
  logic [31:0] m_axi_wdata;
  logic [ 3:0] m_axi_wstrb;
  logic m_axi_wvalid, m_axi_wready;
  logic [1:0] m_axi_bresp;
  logic m_axi_bvalid, m_axi_bready;
  logic [31:0] m_axi_araddr;
  logic [ 2:0] m_axi_arprot;
  logic m_axi_arvalid, m_axi_arready;
  logic [31:0] m_axi_rdata;
  logic [ 1:0] m_axi_rresp;
  logic m_axi_rvalid, m_axi_rready;

  initial begin
    spi_clk = 0;
    forever #(SPI_CLK_PERIOD / 2) spi_clk = ~spi_clk;
  end
  initial begin
    aclk = 0;
    forever #(AXI_CLK_PERIOD / 2) aclk = ~aclk;
  end

  spi_slave_axi u_dut (.*);

  // AXI Slave Model
  logic [31:0] memory[0:255];

  initial begin
    for (int i = 0; i < 256; i++) memory[i] = 0;
  end

  // Write Logic
  always_ff @(posedge aclk or negedge aresetn) begin
    if (!aresetn) begin
      m_axi_awready <= 1'b0;
      m_axi_wready  <= 1'b0;
      m_axi_bvalid  <= 1'b0;
      m_axi_bresp   <= 2'b00;
    end else begin
      m_axi_awready <= 1'b1;  // Always ready for simplicity
      m_axi_wready  <= 1'b1;

      if (m_axi_awvalid && m_axi_wvalid) begin
        memory[m_axi_awaddr[9:2]] <= m_axi_wdata;
        m_axi_bvalid <= 1'b1;
        $display("[AXI Slave] Write Addr: 0x%08x, Data: 0x%08x", m_axi_awaddr, m_axi_wdata);
      end

      if (m_axi_bready && m_axi_bvalid) begin
        m_axi_bvalid <= 1'b0;
      end
    end
  end

  // Read Logic
  always_ff @(posedge aclk or negedge aresetn) begin
    if (!aresetn) begin
      m_axi_arready <= 1'b0;
      m_axi_rvalid  <= 1'b0;
      m_axi_rdata   <= '0;
    end else begin
      m_axi_arready <= 1'b1;

      if (m_axi_arvalid) begin
        m_axi_rdata  <= memory[m_axi_araddr[9:2]];
        m_axi_rvalid <= 1'b1;
        $display("[AXI Slave] Read Addr: 0x%08x, Data: 0x%08x", m_axi_araddr,
                 memory[m_axi_araddr[9:2]]);
      end

      if (m_axi_rready && m_axi_rvalid) begin
        m_axi_rvalid <= 1'b0;
      end
    end
  end

  // SPI Tasks
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

  initial begin
    logic [31:0] wdata  [4];
    logic [31:0] rdata  [4];
    logic [ 7:0] unused;

    spi_cs_n = 1;
    spi_mosi = 0;
    aresetn  = 0;
    repeat (10) @(posedge aclk);
    aresetn = 1;
    repeat (10) @(posedge aclk);

    // Test Single
    $display("[TB] Single Write...");
    @(negedge spi_clk);
    spi_cs_n = 0;
    spi_transfer_byte(8'h60, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(8'h04, unused);
    spi_transfer_word(32'hFEEDFACE, unused);
    @(negedge spi_clk);
    @(negedge spi_clk);
    spi_cs_n = 1;
    repeat (20) @(posedge aclk);

    $display("[TB] Single Read...");
    @(negedge spi_clk);
    spi_cs_n = 0;
    spi_transfer_byte(8'h20, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(8'h04, unused);
    repeat (4) spi_transfer_byte(8'h0, unused);
    spi_transfer_word(32'h0, rdata[0]);
    @(negedge spi_clk);
    @(negedge spi_clk);
    spi_cs_n = 1;

    if (rdata[0] !== 32'hFEEDFACE) begin
      $display("[TB] ERROR: Read Mismatch! Got 0x%x", rdata[0]);
      $fatal(1);
    end
    $display("[TB] PASS: AXI Single Match");

    // Test Burst
    $display("[TB] Burst Write...");
    wdata[0] = 32'h5555AAAA;
    wdata[1] = 32'h12345678;
    wdata[2] = 32'hABCDEF01;
    wdata[3] = 32'h99887766;
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
    repeat (20) @(posedge aclk);

    $display("[TB] Burst Read...");
    @(negedge spi_clk);
    spi_cs_n = 0;
    spi_transfer_byte(8'hA0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(32'h0, unused);
    spi_transfer_byte(8'h10, unused);
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
    $display("[TB] PASS: AXI Burst Match");

    $finish;
  end

  initial begin
    $dumpfile("spi_slave_axi.vcd");
    $dumpvars(0, tb_spi_slave_axi);
  end

endmodule
