// -----------------------------------------------------------------------------
// Module Name: spi_slave_ahb
// Description:
//    AHB Master Wrapper for the SPI Slave IP.
//
// Author: Gemini-3 AI
// -----------------------------------------------------------------------------

module spi_slave_ahb (
    // SPI Interface
    input  logic spi_clk,
    input  logic spi_cs_n,
    input  logic spi_mosi,
    output logic spi_miso,

    // AHB Master Interface
    input  logic        hclk,
    input  logic        hresetn,
    output logic [31:0] haddr,
    output logic [ 2:0] hburst,
    output logic        hmastlock,
    output logic [ 3:0] hprot,
    output logic [ 2:0] hsize,
    output logic [ 1:0] htrans,
    output logic [31:0] hwdata,
    output logic        hwrite,
    input  logic [31:0] hrdata,
    input  logic        hready,
    input  logic        hresp
);

  // ---------------------------------------------------------
  // Core Signals
  // ---------------------------------------------------------
  logic        bus_req;
  logic [31:0] bus_addr;
  logic        bus_we;
  logic [31:0] bus_wdata;
  logic [ 3:0] bus_be;
  logic [ 1:0] bus_size;
  logic        bus_ack;
  logic [31:0] bus_rdata;

  // ---------------------------------------------------------
  // Core Instantiation
  // ---------------------------------------------------------
  spi_slave_core u_core (
      .spi_clk (spi_clk),
      .spi_cs_n(spi_cs_n),
      .spi_mosi(spi_mosi),
      .spi_miso(spi_miso),

      .sys_clk  (hclk),
      .sys_rst_n(hresetn),

      .bus_req_o  (bus_req),
      .bus_addr_o (bus_addr),
      .bus_we_o   (bus_we),
      .bus_wdata_o(bus_wdata),
      .bus_be_o   (bus_be),
      .bus_size_o (bus_size),

      .bus_ack_i  (bus_ack),
      .bus_rdata_i(bus_rdata)
  );

  // ---------------------------------------------------------
  // AHB State Machine
  // ---------------------------------------------------------
  typedef enum logic [1:0] {
    IDLE,
    ADDR,
    DATA
  } ahb_state_t;

  ahb_state_t        state;
  logic              we_buf;
  logic       [31:0] wdata_buf;

  assign hburst    = 3'b000;  // SINGLE
  assign hmastlock = 1'b0;
  assign hprot     = 4'b0011;  // Data, User, Non-buffered, Non-cacheable

  always_ff @(posedge hclk or negedge hresetn) begin
    if (!hresetn) begin
      state <= IDLE;
      htrans <= 2'b00;  // IDLE
      haddr <= '0;
      hwrite <= 1'b0;
      hsize <= 3'b010;  // Word default
      hwdata <= '0;
      bus_ack <= 1'b0;
      bus_rdata <= '0;
      we_buf <= 1'b0;
      wdata_buf <= '0;
    end else begin
      bus_ack <= 1'b0;

      case (state)
        IDLE: begin
          if (bus_req) begin
            state <= ADDR;
            haddr <= bus_addr;
            hwrite <= bus_we;
            htrans <= 2'b10;  // NONSEQ
            hsize <= {1'b0, bus_size};  // 00->000(8b), 01->001(16b), 10->010(32b)
            we_buf <= bus_we;
            wdata_buf <= bus_wdata;
          end else begin
            htrans <= 2'b00;  // IDLE
          end
        end

        ADDR: begin
          if (hready) begin
            state  <= DATA;
            htrans <= 2'b00;  // IDLE for next
            if (we_buf) hwdata <= wdata_buf;
          end
        end

        DATA: begin
          if (hready) begin
            bus_rdata <= hrdata;
            bus_ack <= 1'b1;
            state <= IDLE;
          end
        end

        default: state <= IDLE;
      endcase
    end
  end

endmodule
