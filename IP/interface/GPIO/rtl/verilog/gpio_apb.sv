//------------------------------------------------------------------------------
// Module: gpio_apb
// Description: APB Wrapper for Professional-Grade GPIO IP.
//
// How it operates:
// This module provides an APB slave interface to the GPIO register block.
// It translates APB bus transactions (PSEL, PENABLE, PWRITE) into internal
// register accesses. It instantiates the common GPIO register logic and
// the physical GPIO wrapper.
//
// Author: Gemini-3 AI
// License: MIT
//------------------------------------------------------------------------------

// gpio_apb.sv
// 
// APB Slave Adapter for GPIO IP.

module gpio_apb #(
    parameter int NUM_BITS = 32
)(
    input  logic        pclk,
    input  logic        presetn,
    
    // APB Interface
    input  logic [31:0] paddr,
    /* verilator lint_off UNUSEDSIGNAL */
    input  logic [2:0]  pprot,
    /* verilator lint_on UNUSEDSIGNAL */
    input  logic        psel,
    input  logic        penable,
    input  logic        pwrite,
    input  logic [31:0] pwdata,
    input  logic [3:0]  pstrb,    // APB4
    output logic [31:0] prdata,
    output logic        pready,
    output logic        pslverr,

    // GPIO Pins
`ifndef FORMAL
    inout  wire  [NUM_BITS-1:0] io,
`else
    input  wire  [NUM_BITS-1:0] io,
`endif

    // Interrupt
    output logic                intr
);

    // Internal Bus Signals
    logic [31:0] reg_addr;
    logic [31:0] reg_wdata;
    logic [31:0] reg_rdata;
    logic        reg_we;
    logic        reg_re;
    logic [3:0]  reg_be;
    /* verilator lint_off UNUSEDSIGNAL */
    logic        reg_ack;
    /* verilator lint_on UNUSEDSIGNAL */

    logic [NUM_BITS-1:0] reg_data_o;
    logic [NUM_BITS-1:0] reg_dir;
    logic [NUM_BITS-1:0] gpio_i;

    // Physical Config Signals
    logic [NUM_BITS-1:0] open_drain;
    logic [NUM_BITS-1:0] pull_up_en;
    logic [NUM_BITS-1:0] pull_down_en;

    // APB Logic
    assign reg_addr  = paddr;
    assign reg_wdata = pwdata;
    assign reg_we    = psel && pwrite && penable;
    assign reg_re    = psel && !pwrite;
    assign reg_be    = pstrb;

    assign pready   = 1'b1; 
    assign pslverr  = 1'b0;
    assign prdata   = reg_rdata;

    // Instantiate Internal Register Block
    gpio_regs #(
        .NUM_BITS(NUM_BITS)
    ) u_gpio_regs (
        .clk          (pclk),
        .reset_n      (presetn),
        .addr         (reg_addr),
        .wdata        (reg_wdata),
        .rdata        (reg_rdata),
        .we           (reg_we),
        .re           (reg_re),
        .be           (reg_be),
        .ack          (reg_ack),
        .reg_data_o   (reg_data_o),
        .reg_dir      (reg_dir),
        .gpio_i       (gpio_i),
        .open_drain   (open_drain),
        .pull_up_en   (pull_up_en),
        .pull_down_en (pull_down_en),
        .intr         (intr)
    );

    // Instantiate GPIO Wrapper
    gpio_wrapper #(
        .NUM_BITS(NUM_BITS)
    ) u_gpio_wrapper (
        .clk          (pclk),
        .reset_n      (presetn),
        .oe           (reg_dir),
        .o            (reg_data_o),
        .i            (gpio_i),
        .open_drain   (open_drain),
        .pull_up_en   (pull_up_en),
        .pull_down_en (pull_down_en),
        .io           (io)
    );

endmodule
