//------------------------------------------------------------------------------
// File: sync_fifo_apb.sv
// Description: APB4 Wrapper for Synchronous FIFO IP.
//
// Author: Gemini-3 AI
// License: MIT
//------------------------------------------------------------------------------

module sync_fifo_apb #(
    parameter int ADDR_WIDTH = 32,
    parameter int DATA_WIDTH = 32,
    parameter int FIFO_DEPTH = 16,
    parameter bit FWFT_MODE  = 1
) (
    input logic pclk,
    input logic presetn,

    // APB4 Interface
    input  logic [    ADDR_WIDTH-1:0] paddr,
    input  logic [               2:0] pprot,
    input  logic                      psel,
    input  logic                      penable,
    input  logic                      pwrite,
    input  logic [    DATA_WIDTH-1:0] pwdata,
    input  logic [(DATA_WIDTH/8)-1:0] pstrb,
    output logic [    DATA_WIDTH-1:0] prdata,
    output logic                      pready,
    output logic                      pslverr
`ifdef SIMULATION
    ,
    output logic                      mon_flush,
    output logic                      mon_push,
    output logic [    DATA_WIDTH-1:0] mon_data_in,
    output logic                      mon_full,
    output logic                      mon_almost_full,
    output logic                      mon_overflow,
    output logic                      mon_pop,
    output logic [    DATA_WIDTH-1:0] mon_data_out,
    output logic                      mon_empty,
    output logic                      mon_almost_empty,
    output logic                      mon_underflow,
    output logic [              31:0] mon_level,
    output logic [              31:0] mon_max_level
`endif
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

  // APB Slave Adapter
  apb_slave_adapter #(
      .ADDR_WIDTH(ADDR_WIDTH),
      .DATA_WIDTH(DATA_WIDTH)
  ) u_apb_adapter (
      .pclk     (pclk),
      .presetn  (presetn),
      .paddr    (paddr),
      .pprot    (pprot),
      .psel     (psel),
      .penable  (penable),
      .pwrite   (pwrite),
      .pwdata   (pwdata),
      .pstrb    (pstrb),
      .prdata   (prdata),
      .pready   (pready),
      .pslverr  (pslverr),
      .reg_addr (reg_addr),
      .reg_wdata(reg_wdata),
      .reg_rdata(reg_rdata),
      .reg_we   (reg_we),
      .reg_re   (reg_re),
      .reg_be   (reg_be)
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
  // FIFO Pop on Read from DATA (Qualified by PENABLE for single cycle)
  // Note: reg_re is psel && !pwrite. We need strobed read.
  // Using top-level penable.
  assign fifo_pop = reg_re && penable && addr_is_data;

  always_comb begin
    reg_rdata = '0;
    if (addr_is_data) begin
      reg_rdata = fifo_data_out;
    end else if (addr_is_status) begin
      reg_rdata[0] = fifo_empty;
      reg_rdata[1] = fifo_full;
      reg_rdata[2] = fifo_almost_empty;
      reg_rdata[3] = fifo_almost_full;
      reg_rdata[4] = fifo_overflow;
      reg_rdata[5] = fifo_underflow;
      reg_rdata[31:16] = {{(16 - ($clog2(FIFO_DEPTH) + 1)) {1'b0}}, fifo_level};
    end else if (addr_is_max_level) begin
      reg_rdata[31:0] = {{(32 - ($clog2(FIFO_DEPTH) + 1)) {1'b0}}, fifo_max_level};
    end
  end

  // FIFO Instance
  sync_fifo #(
      .WIDTH(DATA_WIDTH),
      .DEPTH(FIFO_DEPTH),
      .FWFT_MODE(FWFT_MODE)
  ) u_fifo (
      .clk  (pclk),
      .rst_n(presetn),
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

`ifdef SIMULATION
  assign mon_flush        = fifo_flush;
  assign mon_push         = fifo_push;
  assign mon_data_in      = fifo_data_in;
  assign mon_full         = fifo_full;
  assign mon_almost_full  = fifo_almost_full;
  assign mon_overflow     = fifo_overflow;
  assign mon_pop          = fifo_pop;
  assign mon_data_out     = fifo_data_out;
  assign mon_empty        = fifo_empty;
  assign mon_almost_empty = fifo_almost_empty;
  assign mon_underflow    = fifo_underflow;
  assign mon_level        = {27'b0, fifo_level};
  assign mon_max_level    = {27'b0, fifo_max_level};
`endif

endmodule
