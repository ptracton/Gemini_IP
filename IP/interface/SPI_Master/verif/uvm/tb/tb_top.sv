`timescale 1ns / 1ps

`include "uvm_macros.svh"
import uvm_pkg::*;

import spi_agent_pkg::*;
import apb_agent_pkg::*;
import spi_master_test_pkg::*;

module tb_top;

  logic clk;
  logic rst_n;

  // SPI Signals (DUT output, TB input/output)
  wire  sclk;
  wire  mosi;
  wire  miso;  // Driven by TB (SPI Agent)
  wire  cs_n;

  // Interrupts/DMA
  wire  intr;
  wire  dma_tx_req;
  wire  dma_tx_ack;
  wire  dma_rx_req;
  wire  dma_rx_ack;

  // Interface Instances
  spi_if spi_vif (
      clk,
      rst_n
  );
  apb_if apb_vif (
      clk,
      rst_n
  );
  dma_if dma_vif (
      clk,
      rst_n
  );

  // Clock Generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 100MHz
  end

  // Reset Generation
  initial begin
    rst_n = 0;
    #100;
    rst_n = 1;
  end

  // DUT Instance
  spi_master_apb #(
      .ADDR_WIDTH(32),
      .DATA_WIDTH(32),
      .FIFO_DEPTH(16)
  ) dut (
      // APB Interface
      .pclk(clk),
      .presetn(rst_n),
      .paddr(apb_vif.paddr),
      .psel(apb_vif.psel),
      .penable(apb_vif.penable),
      .pwrite(apb_vif.pwrite),
      .pwdata(apb_vif.pwdata),
      .pstrb(apb_vif.pstrb),
      .pprot(apb_vif.pprot),
      .pready(apb_vif.pready),
      .prdata(apb_vif.prdata),
      .pslverr(apb_vif.pslverr),

      // SPI Interface (Host side)
      .spi_sclk(sclk),
      .spi_mosi(mosi),
      .spi_miso(miso),
      .spi_cs_n(cs_n),

      // Sideband
      .intr(intr),
      .dma_tx_req(dma_vif.tx_req),
      .dma_tx_ack(dma_vif.tx_ack),
      .dma_rx_req(dma_vif.rx_req),
      .dma_rx_ack(dma_vif.rx_ack)
  );

  // Connect SPI Virtual Interface to DUT signals
  assign spi_vif.sclk = sclk;
  assign spi_vif.cs_n = cs_n;
  assign spi_vif.mosi = mosi;
  assign miso = spi_vif.miso;  // SPI Agent drives this

  // Dummy reference to force package elaboration
  spi_master_sanity_test   force_sanity;
  spi_master_tx_test       force_tx;
  spi_master_coverage_test force_cov;
  spi_slave_seq            force_spi_seq;
  spi_master_base_test     force_base;

  initial begin
    // Set Virtual Interfaces
    uvm_config_db#(virtual spi_if)::set(null, "*", "vif", spi_vif);
    uvm_config_db#(virtual apb_if)::set(null, "*", "vif", apb_vif);
    uvm_config_db#(virtual dma_if)::set(null, "*", "dma_vif", dma_vif);

    run_test();
  end

endmodule
