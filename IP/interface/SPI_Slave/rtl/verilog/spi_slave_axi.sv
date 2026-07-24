// -----------------------------------------------------------------------------
// Module Name: spi_slave_axi
// Description:
//    AXI4-Lite Master Wrapper for the SPI Slave IP.
//
// Author: Gemini-3 AI
// -----------------------------------------------------------------------------

module spi_slave_axi (
    // SPI Interface
    input  logic spi_clk,
    input  logic spi_cs_n,
    input  logic spi_mosi,
    output logic spi_miso,

    // AXI4-Lite Master Interface
    input logic aclk,
    input logic aresetn,

    // Write Address Channel
    output logic [31:0] m_axi_awaddr,
    output logic [ 2:0] m_axi_awprot,
    output logic        m_axi_awvalid,
    input  logic        m_axi_awready,

    // Write Data Channel
    output logic [31:0] m_axi_wdata,
    output logic [ 3:0] m_axi_wstrb,
    output logic        m_axi_wvalid,
    input  logic        m_axi_wready,

    // Write Response Channel
    input  logic [1:0] m_axi_bresp,
    input  logic       m_axi_bvalid,
    output logic       m_axi_bready,

    // Read Address Channel
    output logic [31:0] m_axi_araddr,
    output logic [ 2:0] m_axi_arprot,
    output logic        m_axi_arvalid,
    input  logic        m_axi_arready,

    // Read Data Channel
    input  logic [31:0] m_axi_rdata,
    input  logic [ 1:0] m_axi_rresp,
    input  logic        m_axi_rvalid,
    output logic        m_axi_rready
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

      .sys_clk  (aclk),
      .sys_rst_n(aresetn),

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
  // AXI4-Lite State Machine
  // ---------------------------------------------------------
  typedef enum logic [2:0] {
    IDLE,
    WADDR,
    WDATA,
    WRESP,
    RADDR,
    RDATA
  } axi_state_t;

  axi_state_t state;

  assign m_axi_awprot = 3'b000;
  assign m_axi_arprot = 3'b000;

  always_ff @(posedge aclk or negedge aresetn) begin
    if (!aresetn) begin
      state <= IDLE;
      m_axi_awaddr <= '0;
      m_axi_awvalid <= 1'b0;
      m_axi_wdata <= '0;
      m_axi_wstrb <= '0;
      m_axi_wvalid <= 1'b0;
      m_axi_bready <= 1'b0;
      m_axi_araddr <= '0;
      m_axi_arvalid <= 1'b0;
      m_axi_rready <= 1'b0;
      bus_ack <= 1'b0;
      bus_rdata <= '0;
    end else begin
      bus_ack <= 1'b0;

      case (state)
        IDLE: begin
          if (bus_req) begin
            if (bus_we) begin
              state <= WADDR;
              m_axi_awaddr <= bus_addr;
              m_axi_awvalid <= 1'b1;
              m_axi_wdata <= bus_wdata;
              m_axi_wstrb <= bus_be;
              m_axi_wvalid <= 1'b1;
            end else begin
              state <= RADDR;
              m_axi_araddr <= bus_addr;
              m_axi_arvalid <= 1'b1;
            end
          end
        end

        WADDR: begin
          if (m_axi_awready) m_axi_awvalid <= 1'b0;
          if (m_axi_wready) m_axi_wvalid <= 1'b0;

          if ((m_axi_awready || !m_axi_awvalid) && (m_axi_wready || !m_axi_wvalid)) begin
            state <= WRESP;
            m_axi_bready <= 1'b1;
          end
        end

        WRESP: begin
          if (m_axi_bvalid) begin
            m_axi_bready <= 1'b0;
            bus_ack <= 1'b1;
            state <= IDLE;
          end
        end

        RADDR: begin
          if (m_axi_arready) begin
            m_axi_arvalid <= 1'b0;
            state <= RDATA;
            m_axi_rready <= 1'b1;
          end
        end

        RDATA: begin
          if (m_axi_rvalid) begin
            m_axi_rready <= 1'b0;
            bus_rdata <= m_axi_rdata;
            bus_ack <= 1'b1;
            state <= IDLE;
          end
        end

        default: state <= IDLE;
      endcase
    end
  end

endmodule
