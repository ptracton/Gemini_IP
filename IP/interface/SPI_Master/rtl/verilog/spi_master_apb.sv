//------------------------------------------------------------------------------
// SPI Master APB Wrapper (Enhanced)
//------------------------------------------------------------------------------



module spi_master_apb #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32,
    parameter FIFO_DEPTH = 16
) (
    input  logic                  pclk,
    input  logic                  presetn,
    input  logic [ADDR_WIDTH-1:0] paddr,
    input  logic                  psel,
    input  logic                  penable,
    input  logic                  pwrite,
    input  logic [DATA_WIDTH-1:0] pwdata,
    input  logic [           3:0] pstrb,
    input  logic [           2:0] pprot,
    output logic                  pready,
    output logic [DATA_WIDTH-1:0] prdata,
    output logic                  pslverr,

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
  logic [31:0] tx_data;
  logic        tx_push;
  logic        tx_full;
  logic        tx_almost_full;

  logic [31:0] rx_data;
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

  // Native Bus Signals (from adapter to registers)
  logic        reg_we;
  logic        reg_re;
  logic [31:0] reg_addr;
  logic [31:0] reg_wdata;
  logic [31:0] reg_rdata;

  // APB Slave Adapter
  apb_slave_adapter #(
      .ADDR_WIDTH(ADDR_WIDTH),
      .DATA_WIDTH(DATA_WIDTH)
  ) adapter_inst (
      .pclk(pclk),
      .presetn(presetn),
      .paddr(paddr),
      .psel(psel),
      .penable(penable),
      .pwrite(pwrite),
      .pwdata(pwdata),
      .pstrb(pstrb),
      .pprot(pprot),
      .pready(pready),
      .prdata(prdata),
      .pslverr(pslverr),

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
      .clk(pclk),
      .rst_n(presetn),
      .reg_we(reg_we),
      .reg_re(reg_re),
      .reg_addr(reg_addr),
      .reg_wdata(reg_wdata),
      .reg_rdata(reg_rdata),

      .rx_data(rx_data),
      .tx_full(tx_full),
      .tx_almost_full(tx_almost_full),
      .rx_empty(rx_empty),
      .rx_almost_empty(rx_almost_empty),
      .busy(busy),
      .done_intr(done_intr),

      .tx_data(tx_data),
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
      .clk(pclk),
      .rst_n(presetn),
      .sclk(spi_sclk),
      .mosi(spi_mosi),
      .miso(spi_miso),
      .tx_data(tx_data),
      .tx_push(tx_push),
      .tx_full(tx_full),
      .tx_almost_full(tx_almost_full),
      .rx_data(rx_data),
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
