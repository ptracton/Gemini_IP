//------------------------------------------------------------------------------
// SPI Master AXI4-Lite Wrapper (Enhanced)
//------------------------------------------------------------------------------



module spi_master_axi #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32,
    parameter FIFO_DEPTH = 16
) (
    input logic aclk,
    input logic aresetn,

    // AXI4-Lite Interface
    input  logic [  ADDR_WIDTH-1:0] awaddr,
    input  logic [             2:0] awprot,
    input  logic                    awvalid,
    output logic                    awready,
    input  logic [  DATA_WIDTH-1:0] wdata,
    input  logic [DATA_WIDTH/8-1:0] wstrb,
    input  logic                    wvalid,
    output logic                    wready,
    output logic [             1:0] bresp,
    output logic                    bvalid,
    input  logic                    bready,
    input  logic [  ADDR_WIDTH-1:0] araddr,
    input  logic [             2:0] arprot,
    input  logic                    arvalid,
    output logic                    arready,
    output logic [  DATA_WIDTH-1:0] rdata,
    output logic [             1:0] rresp,
    output logic                    rvalid,
    input  logic                    rready,

    // SPI Interface
    output logic spi_sclk,
    output logic spi_mosi,
    input  logic spi_miso,
    output logic spi_cs_n,

    // Status & Handshaking
    output logic intr,
    output logic dma_tx_req,
    input  logic dma_tx_ack,
    output logic dma_rx_req,
    input  logic dma_rx_ack
);

  // Internal Signals
  logic [31:0] tx_data_bus;
  logic        tx_push;
  logic        tx_full;
  logic        tx_almost_full;

  logic [31:0] rx_data_bus;
  logic        rx_pop;
  logic        rx_empty;
  logic        rx_almost_empty;

  logic        busy;
  logic        done_intr;

  // Configuration Signals
  logic        enable;
  logic        cpol;
  logic        cpha;
  logic        lsb_first;
  logic        loopback;
  logic [ 7:0] clk_div;
  logic [ 5:0] word_len;

  // Native Bus Signals
  logic        reg_we;
  logic        reg_re;
  logic [31:0] reg_addr;
  logic [31:0] reg_wdata;
  logic [31:0] reg_rdata;

  // AXI4-Lite Slave Adapter
  axi4lite_slave_adapter #(
      .ADDR_WIDTH(ADDR_WIDTH),
      .DATA_WIDTH(DATA_WIDTH)
  ) adapter_inst (
      .aclk(aclk),
      .aresetn(aresetn),

      .s_axi_awaddr (awaddr),
      .s_axi_awprot (awprot),
      .s_axi_awvalid(awvalid),
      .s_axi_awready(awready),
      .s_axi_wdata  (wdata),
      .s_axi_wstrb  (wstrb),
      .s_axi_wvalid (wvalid),
      .s_axi_wready (wready),
      .s_axi_bresp  (bresp),
      .s_axi_bvalid (bvalid),
      .s_axi_bready (bready),
      .s_axi_araddr (araddr),
      .s_axi_arprot (arprot),
      .s_axi_arvalid(arvalid),
      .s_axi_arready(arready),
      .s_axi_rdata  (rdata),
      .s_axi_rresp  (rresp),
      .s_axi_rvalid (rvalid),
      .s_axi_rready (rready),

      .reg_we(reg_we),
      .reg_re(reg_re),
      .reg_addr(reg_addr),
      .reg_wdata(reg_wdata),
      .reg_rdata(reg_rdata),
      .reg_be()
  );

  // Register Module
  spi_master_registers #(
      .ADDR_WIDTH(ADDR_WIDTH),
      .DATA_WIDTH(DATA_WIDTH)
  ) regs_inst (
      .clk(aclk),
      .rst_n(aresetn),
      .reg_we(reg_we),
      .reg_re(reg_re),
      .reg_addr(reg_addr),
      .reg_wdata(reg_wdata),
      .reg_rdata(reg_rdata),

      .rx_data(rx_data_bus),
      .tx_full(tx_full),
      .tx_almost_full(tx_almost_full),
      .rx_empty(rx_empty),
      .rx_almost_empty(rx_almost_empty),
      .busy(busy),
      .done_intr(done_intr),

      .tx_data(tx_data_bus),
      .tx_push(tx_push),
      .rx_pop(rx_pop),
      .cpol(cpol),
      .cpha(cpha),
      .clk_div(clk_div),
      .word_len(word_len),
      .lsb_first(lsb_first),
      .loopback(loopback),
      .enable(enable),

      .spi_cs_n(spi_cs_n),
      .intr(intr),
      .dma_tx_req(dma_tx_req),
      .dma_rx_req(dma_rx_req)
  );

  // SPI Core
  spi_master_core #(
      .FIFO_DEPTH(FIFO_DEPTH)
  ) core_inst (
      .clk(aclk),
      .rst_n(aresetn),
      .sclk(spi_sclk),
      .mosi(spi_mosi),
      .miso(spi_miso),
      .tx_data(tx_data_bus),
      .tx_push(tx_push),
      .tx_full(tx_full),
      .tx_almost_full(tx_almost_full),
      .rx_data(rx_data_bus),
      .rx_pop(rx_pop),
      .rx_empty(rx_empty),
      .rx_almost_empty(rx_almost_empty),
      .cpol(cpol),
      .cpha(cpha),
      .clk_div(clk_div),
      .word_len(word_len),
      .lsb_first(lsb_first),
      .loopback(loopback),
      .enable(enable),
      .busy(busy),
      .done_intr(done_intr)
  );

endmodule
