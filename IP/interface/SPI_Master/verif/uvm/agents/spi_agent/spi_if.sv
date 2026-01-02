`ifndef SPI_IF_SV
`define SPI_IF_SV

interface spi_if (
    input logic clk,
    input logic rst_n
);
  logic sclk;
  logic cs_n;
  logic mosi;
  logic miso;

  // Optional: Clocking blocks / Modports if needed
  // modport slave (input sclk, cs_n, mosi, output miso);
  // modport monitor (input sclk, cs_n, mosi, miso);

endinterface

`endif
