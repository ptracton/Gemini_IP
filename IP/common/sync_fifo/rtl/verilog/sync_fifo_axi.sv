//------------------------------------------------------------------------------
// File: sync_fifo_axi.sv
// Description: AXI4-Lite Wrapper for Synchronous FIFO IP.
//
// Author: Gemini-3 AI
// License: MIT
//------------------------------------------------------------------------------

module sync_fifo_axi #(
    parameter int ADDR_WIDTH = 32,
    parameter int DATA_WIDTH = 32,
    parameter int FIFO_DEPTH = 16,
    parameter bit FWFT_MODE  = 1    // Default to 1 for AXI latency compatibility
) (
    input logic aclk,
    input logic aresetn,

    // AXI4-Lite Interface
    input  logic [    ADDR_WIDTH-1:0] s_axi_awaddr,
    input  logic [               2:0] s_axi_awprot,
    input  logic                      s_axi_awvalid,
    output logic                      s_axi_awready,
    input  logic [    DATA_WIDTH-1:0] s_axi_wdata,
    input  logic [(DATA_WIDTH/8)-1:0] s_axi_wstrb,
    input  logic                      s_axi_wvalid,
    output logic                      s_axi_wready,
    output logic [               1:0] s_axi_bresp,
    output logic                      s_axi_bvalid,
    input  logic                      s_axi_bready,
    input  logic [    ADDR_WIDTH-1:0] s_axi_araddr,
    input  logic [               2:0] s_axi_arprot,
    input  logic                      s_axi_arvalid,
    output logic                      s_axi_arready,
    output logic [    DATA_WIDTH-1:0] s_axi_rdata,
    output logic [               1:0] s_axi_rresp,
    output logic                      s_axi_rvalid,
    input  logic                      s_axi_rready
);

  // Register Offsets
  localparam logic [3:0] ADDR_DATA = 4'h0;
  localparam logic [3:0] ADDR_STATUS = 4'h4;
  localparam logic [3:0] ADDR_CONTROL = 4'h8;
  localparam logic [3:0] ADDR_MAX_LEVEL = 4'hC;

  // Internal Signals
  // verilator lint_off UNUSEDSIGNAL
  logic [      ADDR_WIDTH-1:0] reg_addr;
  logic [      DATA_WIDTH-1:0] reg_wdata;
  logic [      DATA_WIDTH-1:0] reg_rdata;
  logic                        reg_we;
  logic                        reg_re;
  logic [  (DATA_WIDTH/8)-1:0] reg_be;
  // verilator lint_on UNUSEDSIGNAL

  // FIFO Signals
  logic                        fifo_flush;
  logic                        fifo_push;
  logic [      DATA_WIDTH-1:0] fifo_data_in;
  logic                        fifo_full;
  logic                        fifo_almost_full;
  logic                        fifo_overflow;

  logic                        fifo_pop;
  logic [      DATA_WIDTH-1:0] fifo_data_out;
  logic                        fifo_empty;
  logic                        fifo_almost_empty;
  logic                        fifo_underflow;

  logic [$clog2(FIFO_DEPTH):0] fifo_level;
  logic [$clog2(FIFO_DEPTH):0] fifo_max_level;

  // AXI Slave Adapter
  axi4lite_slave_adapter #(
      .ADDR_WIDTH(ADDR_WIDTH),
      .DATA_WIDTH(DATA_WIDTH)
  ) u_axi_adapter (
      .aclk         (aclk),
      .aresetn      (aresetn),
      .s_axi_awaddr (s_axi_awaddr),
      .s_axi_awprot (s_axi_awprot),
      .s_axi_awvalid(s_axi_awvalid),
      .s_axi_awready(s_axi_awready),
      .s_axi_wdata  (s_axi_wdata),
      .s_axi_wstrb  (s_axi_wstrb),
      .s_axi_wvalid (s_axi_wvalid),
      .s_axi_wready (s_axi_wready),
      .s_axi_bresp  (s_axi_bresp),
      .s_axi_bvalid (s_axi_bvalid),
      .s_axi_bready (s_axi_bready),
      .s_axi_araddr (s_axi_araddr),
      .s_axi_arprot (s_axi_arprot),
      .s_axi_arvalid(s_axi_arvalid),
      .s_axi_arready(s_axi_arready),
      .s_axi_rdata  (s_axi_rdata),
      .s_axi_rresp  (s_axi_rresp),
      .s_axi_rvalid (s_axi_rvalid),
      .s_axi_rready (s_axi_rready),
      .reg_addr     (reg_addr),
      .reg_wdata    (reg_wdata),
      .reg_rdata    (reg_rdata),
      .reg_we       (reg_we),
      .reg_re       (reg_re),
      .reg_be       (reg_be)
  );

  // Register Logic

  // Address Decode
  logic addr_is_data;
  logic addr_is_status;
  logic addr_is_control;
  logic addr_is_max_level;

  assign addr_is_data      = (reg_addr[3:0] == ADDR_DATA);
  assign addr_is_status    = (reg_addr[3:0] == ADDR_STATUS);
  assign addr_is_control   = (reg_addr[3:0] == ADDR_CONTROL);
  assign addr_is_max_level = (reg_addr[3:0] == ADDR_MAX_LEVEL);

  // Write Logic
  // FIFO Push on Write to DATA
  // Flush on Write to CONTROL[0]

  always_comb begin
    fifo_push = 1'b0;
    fifo_flush = 1'b0;
    fifo_data_in = reg_wdata;

    if (reg_we) begin
      if (addr_is_data) begin
        fifo_push = 1'b1;
      end
      if (addr_is_control) begin
        if (reg_wdata[0]) fifo_flush = 1'b1;
      end
    end
  end

  // Read Logic
  // FIFO Pop on Read from DATA
  assign fifo_pop = reg_re && addr_is_data;

  logic [DATA_WIDTH-1:0] internal_rdata;


  always_comb begin
    internal_rdata = '0;
    if (addr_is_data) begin
      internal_rdata = fifo_data_out;
    end else if (addr_is_status) begin
      internal_rdata[0] = fifo_empty;
      internal_rdata[1] = fifo_full;
      internal_rdata[2] = fifo_almost_empty;
      internal_rdata[3] = fifo_almost_full;
      internal_rdata[4] = fifo_overflow;
      internal_rdata[5] = fifo_underflow;
      internal_rdata[31:16] = {{(16 - ($clog2(FIFO_DEPTH) + 1)) {1'b0}}, fifo_level};
    end else if (addr_is_max_level) begin
      internal_rdata[31:0] = {{(32 - ($clog2(FIFO_DEPTH) + 1)) {1'b0}}, fifo_max_level};
    end
  end

  // Latch read data for AXI Slave compliance
  // The SV adapter extracts reg_rdata continuously, but we must ensure it stays stable
  // during the read response phase.


  assign reg_rdata = internal_rdata;

  // FIFO Instance
  sync_fifo #(
      .WIDTH(DATA_WIDTH),
      .DEPTH(FIFO_DEPTH),
      .FWFT_MODE(FWFT_MODE)
  ) u_fifo (
      .clk  (aclk),
      .rst_n(aresetn),
      .flush(fifo_flush),

      .push       (fifo_push),
      .data_in    (fifo_data_in),
      .full       (fifo_full),
      .almost_full(fifo_almost_full),
      .overflow   (fifo_overflow),

      .pop         (fifo_pop),
      .data_out    (fifo_data_out),
      .empty       (fifo_empty),
      .almost_empty(fifo_almost_empty),
      .underflow   (fifo_underflow),

      .level    (fifo_level),
      .max_level(fifo_max_level)
  );

endmodule
