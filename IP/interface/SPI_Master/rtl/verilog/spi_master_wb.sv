//------------------------------------------------------------------------------
// SPI Master Wishbone Wrapper (Enhanced)
//------------------------------------------------------------------------------



module spi_master_wb #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32,
    parameter FIFO_DEPTH = 16
) (
    input  logic                  clk_i,
    input  logic                  rst_i,
    input  logic [ADDR_WIDTH-1:0] adr_i,
    input  logic [DATA_WIDTH-1:0] dat_i,
    output logic [DATA_WIDTH-1:0] dat_o,
    input  logic                  we_i,
    input  logic [           3:0] sel_i,
    input  logic                  stb_i,
    input  logic                  cyc_i,
    output logic                  ack_o,
    output logic                  err_o,

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

  // Wishbone Slave Adapter
  wb_slave_adapter #(
      .ADDR_WIDTH(ADDR_WIDTH),
      .DATA_WIDTH(DATA_WIDTH)
  ) adapter_inst (
      .wb_clk_i(clk_i),
      .wb_rst_i(rst_i),
      .wb_adr_i(adr_i),
      .wb_dat_i(dat_i),
      .wb_dat_o(dat_o),
      .wb_we_i(we_i),
      .wb_sel_i(sel_i),
      .wb_stb_i(stb_i),
      .wb_cyc_i(cyc_i),
      .wb_ack_o(ack_o),
      .wb_err_o(err_o),
      .wb_stall_o(),

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
      .clk(clk_i),
      .rst_n(!rst_i),  // Wishbone is active high reset usually, but regs takes active low
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
      .dma_rx_req(dma_rx_req),
      .dma_tx_ack(dma_tx_ack),
      .dma_rx_ack(dma_rx_ack)
  );

  // SPI Core
  spi_master_core #(
      .FIFO_DEPTH(FIFO_DEPTH)
  ) core_inst (
      .clk(clk_i),
      .rst_n(!rst_i),  // Active low reset for core
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
