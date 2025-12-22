// gpio_wb.sv
// 
// Wishbone Slave Adapter for GPIO IP.
//------------------------------------------------------------------------------
// Module: gpio_wb
// Description: Wishbone B4 Wrapper for Professional-Grade GPIO IP.
//
// How it operates:
// This module provides a Wishbone slave interface (Standard B4) to the GPIO 
// register block. It handles Wishbone signals (cyc, stb, we, ack) and 
// translates them into internal register accesses. It instantiates the 
// common GPIO register logic and the physical GPIO wrapper.
//
// Author: Gemini-3 AI
// License: MIT
//------------------------------------------------------------------------------

module gpio_wb #(
    parameter int NUM_BITS = 32
)(
    input  logic        wb_clk_i,
    input  logic        wb_rst_i,
    
    // Wishbone Interface
    input  logic [31:0] wb_adr_i,
    input  logic [31:0] wb_dat_i,
    output logic [31:0] wb_dat_o,
    input  logic        wb_we_i,
    input  logic [3:0]  wb_sel_i,
    input  logic        wb_stb_i,
    input  logic        wb_cyc_i,
    output logic        wb_ack_o,
    output logic        wb_err_o,
    output logic        wb_stall_o,

    // GPIO Pins
    inout  wire  [NUM_BITS-1:0] io,

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
    logic        reg_ack;

    logic [NUM_BITS-1:0] reg_data_o;
    logic [NUM_BITS-1:0] reg_dir;
    logic [NUM_BITS-1:0] gpio_i;

    // Physical Config Signals
    logic [NUM_BITS-1:0] open_drain;
    logic [NUM_BITS-1:0] pull_up_en;
    logic [NUM_BITS-1:0] pull_down_en;

    // Wishbone Logic
    assign reg_addr  = wb_adr_i;
    assign reg_wdata = wb_dat_i;
    assign reg_we    = wb_cyc_i && wb_stb_i && wb_we_i;
    assign reg_re    = wb_cyc_i && wb_stb_i && !wb_we_i;
    assign reg_be    = wb_sel_i;

    assign wb_dat_o  = reg_rdata;
    assign wb_ack_o  = reg_ack;
    assign wb_err_o  = 1'b0;
    assign wb_stall_o = 1'b0;

    // Instantiate Internal Register Block
    gpio_regs #(
        .NUM_BITS(NUM_BITS)
    ) u_gpio_regs (
        .clk          (wb_clk_i),
        .reset_n      (~wb_rst_i),
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
        .clk          (wb_clk_i),
        .reset_n      (~wb_rst_i),
        .oe           (reg_dir),
        .o            (reg_data_o),
        .i            (gpio_i),
        .open_drain   (open_drain),
        .pull_up_en   (pull_up_en),
        .pull_down_en (pull_down_en),
        .io           (io)
    );

endmodule
