//------------------------------------------------------------------------------
// File: sync_fifo_wb.sv
// Description: Wishbone Wrapper for Synchronous FIFO IP.
//
// Author: Gemini-3 AI
// License: MIT
//------------------------------------------------------------------------------

module sync_fifo_wb #(
    parameter int ADDR_WIDTH = 32,
    parameter int DATA_WIDTH = 32,
    parameter int FIFO_DEPTH = 16,
    parameter bit FWFT_MODE  = 1
) (
    input logic wb_clk_i,
    input logic wb_rst_i,

    // Wishbone Interface
    input  logic [    ADDR_WIDTH-1:0] wb_adr_i,
    input  logic [    DATA_WIDTH-1:0] wb_dat_i,
    output logic [    DATA_WIDTH-1:0] wb_dat_o,
    input  logic                      wb_we_i,
    input  logic                      wb_stb_i,
    input  logic                      wb_cyc_i,
    input  logic [(DATA_WIDTH/8)-1:0] wb_sel_i,
    output logic                      wb_ack_o,
    output logic                      wb_err_o,
    output logic                      wb_stall_o
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

  // Wishbone Slave Adapter
  wb_slave_adapter #(
      .ADDR_WIDTH(ADDR_WIDTH),
      .DATA_WIDTH(DATA_WIDTH)
  ) u_wb_adapter (
      .wb_clk_i  (wb_clk_i),
      .wb_rst_i  (wb_rst_i),
      .wb_adr_i  (wb_adr_i),
      .wb_dat_i  (wb_dat_i),
      .wb_dat_o  (wb_dat_o),
      .wb_we_i   (wb_we_i),
      .wb_stb_i  (wb_stb_i),
      .wb_cyc_i  (wb_cyc_i),
      .wb_sel_i  (wb_sel_i),
      .wb_ack_o  (wb_ack_o),
      .wb_err_o  (wb_err_o),
      .wb_stall_o(wb_stall_o),
      .reg_addr  (reg_addr),
      .reg_wdata (reg_wdata),
      .reg_rdata (reg_rdata),
      .reg_we    (reg_we),
      .reg_re    (reg_re),
      .reg_be    (reg_be)
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
  // Edge detection for reg_re because it is not strobed in the adapter
  logic reg_re_d;
  always_ff @(posedge wb_clk_i or posedge wb_rst_i) begin
    if (wb_rst_i) begin
      reg_re_d <= 1'b0;
    end else begin
      reg_re_d <= reg_re;
    end
  end

  assign fifo_pop = reg_re && !reg_re_d && addr_is_data;

  logic [DATA_WIDTH-1:0] internal_rdata;
  logic [DATA_WIDTH-1:0] stored_rdata;

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

  // Latch read data
  // We must latch the data on the SAME cycle we determine the read valid (first cycle of reg_re)
  // to prevent the FIFO advancing seen by the master if it waits a cycle.
  always_ff @(posedge wb_clk_i or posedge wb_rst_i) begin
    if (wb_rst_i) begin
      stored_rdata <= '0;
    end else if (reg_re && !reg_re_d) begin
      stored_rdata <= internal_rdata;
    end
  end

  // Use latched data for everything to ensure data stability
  assign reg_rdata = stored_rdata;

  // FIFO Instance
  sync_fifo #(
      .WIDTH(DATA_WIDTH),
      .DEPTH(FIFO_DEPTH),
      .FWFT_MODE(FWFT_MODE)
  ) u_fifo (
      .clk  (wb_clk_i),
      .rst_n(!wb_rst_i),  // Wishbone is typically active high reset
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
