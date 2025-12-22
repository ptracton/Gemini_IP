//------------------------------------------------------------------------------
// Module: gpio_axi
// Description: AXI4-Lite Wrapper for Professional-Grade GPIO IP.
//
// How it operates:
// This module provides an AXI4-Lite slave interface to the GPIO register block.
// It handles AXI address/data phases and translates them into internal
// register accesses. It instantiates the common GPIO register logic and
// the physical GPIO wrapper.
//
// Author: Gemini-3 AI
// License: MIT
//------------------------------------------------------------------------------

module gpio_axi #(
    parameter int NUM_BITS = 32
)(
    // AXI4-Lite Interface
    input  logic        s_axi_aclk,
    input  logic        s_axi_aresetn,
    
    // Write Address Channel
    input  logic [31:0] s_axi_awaddr,
    /* verilator lint_off UNUSEDSIGNAL */
    input  logic [2:0]  s_axi_awprot,
    /* verilator lint_on UNUSEDSIGNAL */
    input  logic        s_axi_awvalid,
    output logic        s_axi_awready,
    
    // Write Data Channel
    input  logic [31:0] s_axi_wdata,
    input  logic [3:0]  s_axi_wstrb,
    input  logic        s_axi_wvalid,
    output logic        s_axi_wready,
    
    // Write Response Channel
    output logic [1:0]  s_axi_bresp,
    output logic        s_axi_bvalid,
    input  logic        s_axi_bready,
    
    // Read Address Channel
    input  logic [31:0] s_axi_araddr,
    /* verilator lint_off UNUSEDSIGNAL */
    input  logic [2:0]  s_axi_arprot,
    /* verilator lint_on UNUSEDSIGNAL */
    input  logic        s_axi_arvalid,
    output logic        s_axi_arready,
    
    // Read Data Channel
    output logic [31:0] s_axi_rdata,
    output logic [1:0]  s_axi_rresp,
    output logic        s_axi_rvalid,
    input  logic        s_axi_rready,

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

    // AXI Logic (Simplified)
    logic aw_en;
    always_ff @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
        if (!s_axi_aresetn) begin
            s_axi_awready <= 1'b0;
            aw_en <= 1'b1;
        end else begin
            if (~s_axi_awready && s_axi_awvalid && s_axi_wvalid && aw_en) begin
                s_axi_awready <= 1'b1;
                aw_en <= 1'b0;
            end else if (s_axi_bready && s_axi_bvalid) begin
                aw_en <= 1'b1;
                s_axi_awready <= 1'b0;
            end else begin
                s_axi_awready <= 1'b0;
            end
        end
    end

    always_ff @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
        if (!s_axi_aresetn) begin
            s_axi_wready <= 1'b0;
        end else begin
            if (~s_axi_wready && s_axi_wvalid && s_axi_awvalid && aw_en) begin
                s_axi_wready <= 1'b1;
            end else begin
                s_axi_wready <= 1'b0;
            end
        end
    end

    assign reg_we = s_axi_wready && s_axi_wvalid && s_axi_awready && s_axi_awvalid;
    assign reg_addr = reg_we ? s_axi_awaddr : s_axi_araddr;
    assign reg_wdata = s_axi_wdata;
    assign reg_be = s_axi_wstrb;

    always_ff @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
        if (!s_axi_aresetn) begin
            s_axi_bvalid <= 1'b0;
            s_axi_bresp  <= 2'b0;
        end else begin
            if (s_axi_awready && s_axi_awvalid && s_axi_wready && s_axi_wvalid && ~s_axi_bvalid) begin
                s_axi_bvalid <= 1'b1;
                s_axi_bresp  <= 2'b0;
            end else if (s_axi_bready && s_axi_bvalid) begin
                s_axi_bvalid <= 1'b0;
            end
        end
    end

    always_ff @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
        if (!s_axi_aresetn) begin
            s_axi_arready <= 1'b0;
        end else begin
            if (~s_axi_arready && s_axi_arvalid) begin
                s_axi_arready <= 1'b1;
            end else begin
                s_axi_arready <= 1'b0;
            end
        end
    end

    assign reg_re = s_axi_arready && s_axi_arvalid;

    always_ff @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
        if (!s_axi_aresetn) begin
            s_axi_rvalid <= 1'b0;
            s_axi_rresp  <= 2'b0;
        end else begin
            if (s_axi_arready && s_axi_arvalid && ~s_axi_rvalid) begin
                s_axi_rvalid <= 1'b1;
                s_axi_rresp  <= 2'b0;
            end else if (s_axi_rready && s_axi_rvalid) begin
                s_axi_rvalid <= 1'b0;
            end
        end
    end

    assign s_axi_rdata = reg_rdata;

    // Instantiate Internal Register Block
    gpio_regs #(
        .NUM_BITS(NUM_BITS)
    ) u_gpio_regs (
        .clk          (s_axi_aclk),
        .reset_n      (s_axi_aresetn),
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
        .clk          (s_axi_aclk),
        .reset_n      (s_axi_aresetn),
        .oe           (reg_dir),
        .o            (reg_data_o),
        .i            (gpio_i),
        .open_drain   (open_drain),
        .pull_up_en   (pull_up_en),
        .pull_down_en (pull_down_en),
        .io           (io)
    );

endmodule
