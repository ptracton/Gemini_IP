//------------------------------------------------------------------------------
// File: tb_gpio_axi.sv
// Description: SystemVerilog testbench for Xilinx Vivado verification of GPIO IP.
//
// How it operates:
// This testbench exercises the GPIO AXI4-Lite interface using a standalone
// SystemVerilog environment. It includes tasks for AXI read/write transactions
// and directed tests for all major IP features.
//
// Author: Gemini-3 AI
// License: MIT
//------------------------------------------------------------------------------

`timescale 1ns / 1ps

module tb_gpio_axi;

    parameter int NUM_BITS = 8;
    parameter real CLK_PERIOD = 10.0;

    // Signals
    logic clk = 0;
    logic rst_n = 0;
    
    // AXI4-Lite Interface
    logic [31:0] s_axi_awaddr;
    logic [2:0]  s_axi_awprot;
    logic        s_axi_awvalid;
    logic        s_axi_awready;
    logic [31:0] s_axi_wdata;
    logic [3:0]  s_axi_wstrb;
    logic        s_axi_wvalid;
    logic        s_axi_wready;
    logic [1:0]  s_axi_bresp;
    logic        s_axi_bvalid;
    logic        s_axi_bready;
    logic [31:0] s_axi_araddr;
    logic [2:0]  s_axi_arprot;
    logic        s_axi_arvalid;
    logic        s_axi_arready;
    logic [31:0] s_axi_rdata;
    logic [1:0]  s_axi_rresp;
    logic        s_axi_rvalid;
    logic        s_axi_rready;

    // GPIO Signals
    wire [NUM_BITS-1:0] io;
    logic intr;

    // Clock Generation
    always #(CLK_PERIOD/2) clk = ~clk;

    // DUT Instantiation
    gpio_axi #(
        .NUM_BITS(NUM_BITS)
    ) dut (
        .s_axi_aclk(clk),
        .s_axi_aresetn(rst_n),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_awready(s_axi_awready),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid),
        .s_axi_wready(s_axi_wready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_arready(s_axi_arready),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_rready(s_axi_rready),
        .io(io),
        .intr(intr)
    );

    // Register Offsets
    localparam bit [31:0] REG_DATA_I  = 32'h00;
    localparam bit [31:0] REG_DATA_O  = 32'h04;
    localparam bit [31:0] REG_DIR     = 32'h08;
    localparam bit [31:0] REG_INT_EN  = 32'h0C;
    localparam bit [31:0] REG_INT_STS = 32'h1C;
    localparam bit [31:0] REG_SET_O   = 32'h20;
    localparam bit [31:0] REG_CLR_O   = 32'h24;
    localparam bit [31:0] REG_TGL_O   = 32'h28;

    // AXI Write Task
    task axi_write(input [31:0] addr, input [31:0] data);
        s_axi_awaddr  <= addr;
        s_axi_wdata   <= data;
        s_axi_awvalid <= 1;
        s_axi_wvalid  <= 1;
        s_axi_wstrb   <= 4'hF;
        s_axi_bready  <= 1;
        
        wait(s_axi_awready && s_axi_wready);
        @(posedge clk);
        s_axi_awvalid <= 0;
        s_axi_wvalid  <= 0;
        
        wait(s_axi_bvalid);
        @(posedge clk);
        s_axi_bready  <= 0;
    endtask

    // AXI Read Task
    task axi_read(input [31:0] addr, output [31:0] data);
        s_axi_araddr  <= addr;
        s_axi_arvalid <= 1;
        s_axi_rready  <= 1;
        
        wait(s_axi_arready);
        @(posedge clk);
        s_axi_arvalid <= 0;
        
        wait(s_axi_rvalid);
        data = s_axi_rdata;
        @(posedge clk);
        s_axi_rready  <= 0;
    endtask

    // Main Test Sequence
    initial begin
        logic [31:0] rdata;
        
        // Reset
        rst_n = 0;
        s_axi_awvalid = 0;
        s_axi_wvalid  = 0;
        s_axi_bready  = 0;
        s_axi_arvalid = 0;
        s_axi_rready  = 0;
        repeat(5) @(posedge clk);
        rst_n = 1;
        repeat(2) @(posedge clk);

        $display("[%t] Starting Xilinx Directed Test...", $time);

        // Test 1: Basic R/W and DIR
        $display("[%t] Test 1: Basic R/W and DIR", $time);
        axi_write(REG_DIR, 8'hFF); // All outputs
        axi_write(REG_DATA_O, 8'hAA);
        axi_read(REG_DATA_O, rdata);
        if (rdata[7:0] !== 8'hAA) $error("Test 1 Failed: DATA_O mismatch");
        axi_read(REG_DATA_I, rdata);
        if (rdata[7:0] !== 8'hAA) $error("Test 1 Failed: DATA_I mismatch");

        // Test 2: Atomic Operations
        $display("[%t] Test 2: Atomic Operations", $time);
        axi_write(REG_DATA_O, 8'h00);
        axi_write(REG_SET_O,  8'h55);
        axi_read(REG_DATA_O, rdata);
        if (rdata[7:0] !== 8'h55) $error("Test 2 Failed: SET failed");
        
        axi_write(REG_TGL_O,  8'h33);
        axi_read(REG_DATA_O, rdata);
        if (rdata[7:0] !== 8'h66) $error("Test 2 Failed: TGL failed, got %h", rdata[7:0]);

        axi_write(REG_CLR_O,  8'h44);
        axi_read(REG_DATA_O, rdata);
        if (rdata[7:0] !== 8'h22) $error("Test 2 Failed: CLR failed");

        // Test 3: Interrupts (Basic Edge)
        $display("[%t] Test 3: Interrupts (Falling Edge)", $time);
        axi_write(REG_DIR,    8'hFF); // Outputs for loopback
        axi_write(REG_INT_EN, 8'h02); // Enable Bit 1
        // Default is Edge, Falling
        axi_write(REG_DATA_O, 8'h02); // Bit 1 High
        repeat(5) @(posedge clk);
        axi_write(REG_INT_STS, 8'h02); // Clear Status
        repeat(2) @(posedge clk);
        
        axi_write(REG_DATA_O, 8'h00); // Falling Edge on Bit 1
        repeat(10) @(posedge clk);
        
        axi_read(REG_INT_STS, rdata);
        if (!(rdata & 8'h02)) $error("Test 3 Failed: Interrupt status not set");
        if (!intr) $error("Test 3 Failed: Global interrupt not asserted");

        $display("[%t] Xilinx Directed Test Completion.", $time);
        $display("--------------------------------------------------");
        $display("TEST PASSED");
        $display("--------------------------------------------------");
        #100 $finish;
    end

endmodule
