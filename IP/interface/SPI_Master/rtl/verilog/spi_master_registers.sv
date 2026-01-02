//------------------------------------------------------------------------------
// SPI Master Register Interface
//------------------------------------------------------------------------------



module spi_master_registers #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32
) (
    input logic clk,
    input logic rst_n,

    // Register Bus Interface
    input  logic                  reg_we,
    input  logic                  reg_re,
    input  logic [ADDR_WIDTH-1:0] reg_addr,
    input  logic [DATA_WIDTH-1:0] reg_wdata,
    output logic [DATA_WIDTH-1:0] reg_rdata,

    // Status Inputs from Core
    input logic [31:0] rx_data,
    input logic        tx_full,
    input logic        tx_almost_full,
    input logic        rx_empty,
    input logic        rx_almost_empty,
    input logic        busy,
    input logic        done_intr,

    // Control Outputs to Core
    output logic [31:0] tx_data,
    output logic        tx_push,
    output logic        rx_pop,
    output logic        cpol,
    output logic        cpha,
    output logic [ 7:0] clk_div,
    output logic [ 5:0] word_len,
    output logic        lsb_first,
    output logic        loopback,
    output logic        enable,

    // External Outputs
    output logic spi_cs_n,
    output logic intr,
    output logic dma_tx_req,
    output logic dma_rx_req
);

  // Register Offsets
  localparam ADDR_DATA = 8'h00;  // TX/RX Data (FIFO)
  localparam ADDR_SR = 8'h04;  // Status Register
  localparam ADDR_CR = 8'h08;  // Control Register 0 (Enable, CPOL, CPHA, etc)
  localparam ADDR_CS = 8'h0C;  // Chip Select Register
  localparam ADDR_FIFO_CTRL = 8'h10;  // FIFO Control/Thresholds
  localparam ADDR_FIFO_STAT = 8'h14;  // FIFO Status/Levels
  localparam ADDR_CR1 = 8'h18;  // Control Register 1 (WordLen, LSBFirst, Loopback)

  // Internal Registers
  logic [31:0] reg_cr;
  logic [31:0] reg_cr1;
  logic [31:0] reg_cs;
  logic [31:0] reg_fifo_ctrl;

  // Control Outputs Assignments
  assign enable    = reg_cr[0];
  assign cpol      = reg_cr[1];
  assign cpha      = reg_cr[2];
  assign clk_div   = reg_cr[15:8];
  assign word_len  = (reg_cr1[5:0] == 6'd0) ? 6'd8 : reg_cr1[5:0];
  assign lsb_first = reg_cr1[8];
  assign loopback  = reg_cr1[9];

  // Data/FIFO Control
  assign tx_data   = reg_wdata;
  assign tx_push   = reg_we && (reg_addr[7:0] == ADDR_DATA);
  assign rx_pop    = reg_re && (reg_addr[7:0] == ADDR_DATA);

  // Write Logic
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      reg_cr        <= 32'h0400;  // Default div=4
      reg_cr1       <= 32'h0008;  // Default 8-bit
      reg_cs        <= 32'h0001;
      reg_fifo_ctrl <= 32'h0000;
    end else if (reg_we) begin
      case (reg_addr[7:0])
        ADDR_CR:        reg_cr <= reg_wdata;
        ADDR_CR1:       reg_cr1 <= reg_wdata;
        ADDR_CS:        reg_cs <= reg_wdata;
        ADDR_FIFO_CTRL: reg_fifo_ctrl <= reg_wdata;
        default:        ;
      endcase
    end
  end

  // Read Logic
  always_comb begin
    reg_rdata = 32'h0;
    case (reg_addr[7:0])
      ADDR_DATA: begin
        reg_rdata = rx_data;
        if (reg_re)
          $display(
              "REG_READ: ADDR_DATA reg_addr=%h rx_data=%h reg_rdata=%h at time %t",
              reg_addr,
              rx_data,
              reg_rdata,
              $time
          );
      end
      ADDR_SR:        reg_rdata = {28'h0, rx_almost_empty, tx_almost_full, rx_empty, busy};
      ADDR_CR:        reg_rdata = reg_cr;
      ADDR_CR1:       reg_rdata = reg_cr1;
      ADDR_CS:        reg_rdata = reg_cs;
      ADDR_FIFO_STAT: reg_rdata = {31'h0, tx_full};  // Simplified status
      ADDR_FIFO_CTRL: reg_rdata = reg_fifo_ctrl;
      default:        reg_rdata = 32'h0;
    endcase
  end

  // External Signal Assignments
  assign spi_cs_n   = reg_cs[0];
  assign intr       = done_intr;
  assign dma_tx_req = !tx_almost_full;
  assign dma_rx_req = !rx_empty;

endmodule
