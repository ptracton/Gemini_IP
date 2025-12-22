//------------------------------------------------------------------------------
// File: tb_gpio_apb.sv
// Description: SystemVerilog testbench for native verification of GPIO IP (APB).
//
// Author: Gemini-3 AI
// License: MIT
//------------------------------------------------------------------------------

`timescale 1ns / 1ps

module tb_gpio_apb;

    parameter int NUM_BITS = 8;
    parameter real CLK_PERIOD = 10.0;

    // Signals
    logic clk = 0;
    logic rst_n = 0;
    
    // APB4 Interface
    logic [31:0] paddr;
    logic [2:0]  pprot;
    logic        psel;
    logic        penable;
    logic        pwrite;
    logic [31:0] pwdata;
    logic [3:0]  pstrb;
    logic        pready;
    logic [31:0] prdata;
    logic        pslverr;

    // GPIO Signals
    wire [NUM_BITS-1:0] io;
    logic intr;

    // Clock Generation
    always #(CLK_PERIOD/2) clk = ~clk;

    // DUT Instantiation
    gpio_apb #(
        .NUM_BITS(NUM_BITS)
    ) dut (
        .pclk(clk),
        .presetn(rst_n),
        .paddr(paddr),
        .pprot(pprot),
        .psel(psel),
        .penable(penable),
        .pwrite(pwrite),
        .pwdata(pwdata),
        .pstrb(pstrb),
        .pready(pready),
        .prdata(prdata),
        .pslverr(pslverr),
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

    // APB Write Task
    task apb_write(input [31:0] addr, input [31:0] data);
        paddr   = addr;
        pwdata  = data;
        pwrite  = 1;
        psel    = 1;
        pprot   = 3'b000;
        pstrb   = 4'hF;
        penable = 0;
        
        @(posedge clk);
        #1;
        penable = 1;
        
        wait(pready);
        @(posedge clk);
        #1;
        psel    = 0;
        penable = 0;
    endtask

    // APB Read Task
    task apb_read(input [31:0] addr, output [31:0] data);
        paddr   = addr;
        pwrite  = 0;
        psel    = 1;
        penable = 0;
        pprot   = 3'b000;
        
        @(posedge clk);
        #1;
        penable = 1;
        
        wait(pready);
        @(posedge clk);
        #1;
        data = prdata;
        psel    = 0;
        penable = 0;
    endtask

    // Main Test Sequence
    initial begin
        logic [31:0] rdata;
        int errors = 0;
        
        // Reset
        rst_n = 0;
        psel = 0;
        penable = 0;
        repeat(5) @(posedge clk);
        rst_n = 1;
        repeat(2) @(posedge clk);

        $display("[%t] Starting APB Native Directed Test...", $time);

        // Test 1: Basic R/W and DIR
        $display("[%t] Test 1: Basic R/W and DIR", $time);
        apb_write(REG_DIR, 32'hFF);
        apb_write(REG_DATA_O, 32'hAA);
        repeat(10) @(posedge clk); // Wait for synchronization/debouncing
        apb_read(REG_DATA_O, rdata);
        if (rdata[7:0] !== 8'hAA) begin
            $error("Test 1 Failed: DATA_O mismatch, got %h expected AA", rdata[7:0]);
            errors++;
        end
        apb_read(REG_DATA_I, rdata);
        if (rdata[7:0] !== 8'hAA) begin
            $error("Test 1 Failed: DATA_I mismatch, got %h expected AA", rdata[7:0]);
            errors++;
        end

        // Test 2: Atomic Operations
        $display("[%t] Test 2: Atomic Operations", $time);
        apb_write(REG_DATA_O, 32'h00);
        apb_write(REG_SET_O,  32'h55);
        apb_read(REG_DATA_O, rdata);
        if (rdata[7:0] !== 8'h55) begin
            $error("Test 2 Failed: SET failed, got %h expected 55", rdata[7:0]);
            errors++;
        end
        
        apb_write(REG_TGL_O,  32'h33);
        apb_read(REG_DATA_O, rdata);
        if (rdata[7:0] !== 8'h66) begin
            $error("Test 2 Failed: TGL failed, got %h expected 66", rdata[7:0]);
            errors++;
        end

        apb_write(REG_CLR_O,  32'h44);
        apb_read(REG_DATA_O, rdata);
        if (rdata[7:0] !== 8'h22) begin
            $error("Test 2 Failed: CLR failed, got %h expected 22", rdata[7:0]);
            errors++;
        end

        $display("[%t] APB Native Directed Test Completion.", $time);
        $display("--------------------------------------------------");
        if (errors == 0) begin
            $display("APB TEST PASSED");
        end else begin
            $display("APB TEST FAILED with %0d errors", errors);
        end
        $display("--------------------------------------------------");
        #100 $finish;
    end

    // Timeout Watchdog
    initial begin
        #1000000; // 1 ms timeout
        $display("TIMEOUT - Testbench hung");
        $finish;
    end

endmodule
