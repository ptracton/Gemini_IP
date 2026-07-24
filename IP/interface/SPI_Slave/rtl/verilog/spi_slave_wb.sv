// -----------------------------------------------------------------------------
// Module Name: spi_slave_wb
// Description:
//    Wishbone B4 Wrapper for the SPI Slave IP.
//    Instantiates spi_slave_core and maps the Generic Bus Master interface
//    tostandard Wishbone Master signals.
//
// Author: Gemini-3 AI
// -----------------------------------------------------------------------------

module spi_slave_wb (
    // SPI Interface
    input  logic spi_clk,   // SPI Clock
    input  logic spi_cs_n,  // SPI Chip Select
    input  logic spi_mosi,  // SPI MOSI
    output logic spi_miso,  // SPI MISO

    // Wishbone Master Interface
    input  logic        wb_clk_i,   // System Clock
    input  logic        wb_rst_i,   // System Reset (Active High)
    output logic        wb_cyc_o,   // Cycle Valid
    output logic        wb_stb_o,   // Strobe
    output logic        wb_we_o,    // Write Enable
    output logic [31:0] wb_addr_o,  // Address
    output logic [31:0] wb_data_o,  // Write Data
    output logic [ 3:0] wb_sel_o,   // Byte Select
    input  logic        wb_ack_i,   // Acknowledge
    input  logic [31:0] wb_data_i   // Read Data
);

  // ---------------------------------------------------------
  // Signal Declarations
  // ---------------------------------------------------------
  logic        core_req;
  logic [31:0] core_addr;
  logic        core_we;
  logic [31:0] core_wdata;
  logic [ 3:0] core_be;
  logic [ 1:0] core_size;  // Unused for WB (we use SEL)

  // Invert Reset for Core (if Core uses Active Low)
  // Check: spi_slave_core uses sys_rst_n (Active Low)
  logic        sys_rst_n;
  assign sys_rst_n = ~wb_rst_i;

  // ---------------------------------------------------------
  // Core Instantiation
  // ---------------------------------------------------------
  spi_slave_core u_core (
      .spi_clk (spi_clk),
      .spi_cs_n(spi_cs_n),
      .spi_mosi(spi_mosi),
      .spi_miso(spi_miso),

      .sys_clk  (wb_clk_i),
      .sys_rst_n(sys_rst_n),

      .bus_req_o  (core_req),
      .bus_addr_o (core_addr),
      .bus_we_o   (core_we),
      .bus_wdata_o(core_wdata),
      .bus_be_o   (core_be),
      .bus_size_o (core_size),

      .bus_ack_i  (wb_ack_i),
      .bus_rdata_i(wb_data_i)
  );

  // ---------------------------------------------------------
  // Wishbone Mapping
  // ---------------------------------------------------------
  // Standard Wishbone B4 Master Logic
  // CYC and STB are asserted when Request is active.
  assign wb_cyc_o  = core_req;
  assign wb_stb_o  = core_req;
  assign wb_we_o   = core_we;
  assign wb_addr_o = core_addr;
  assign wb_data_o = core_wdata;
  assign wb_sel_o  = core_be;

endmodule
