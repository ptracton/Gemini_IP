//------------------------------------------------------------------------------
// File: tb_gpio_wb.sv
// Description: SystemVerilog testbench for native verification of GPIO IP (Wishbone).
//
// Author: Gemini-3 AI
// License: MIT
//------------------------------------------------------------------------------

`timescale 1ns / 1ps

module tb_gpio_wb;

    parameter int NUM_BITS = 8;
    parameter real CLK_PERIOD = 10.0;

    // Signals
    logic clk = 0;
    logic rst = 0;
    
    // Wishbone Interface
    logic [31:0] wb_adr_i;
    logic [31:0] wb_dat_i;
    logic [31:0] wb_dat_o;
    logic [3:0]  wb_sel_i;
    logic        wb_we_i;
    logic        wb_cyc_i;
    logic        wb_stb_i;
    logic [2:0]  wb_cti_i;
    logic [1:0]  wb_bte_i;
    logic        wb_ack_o;
    logic        wb_err_o;

    // GPIO Signals
    wire [NUM_BITS-1:0] io;
    logic intr;

    // Clock Generation
    always #(CLK_PERIOD/2) clk = ~clk;

    // DUT Instantiation
    gpio_wb #(
        .NUM_BITS(NUM_BITS)
    ) dut (
        .wb_clk_i(clk),
        .wb_rst_i(rst),
        .wb_adr_i(wb_adr_i),
        .wb_dat_i(wb_dat_i),
        .wb_dat_o(wb_dat_o),
        .wb_sel_i(wb_sel_i),
        .wb_we_i(wb_we_i),
        .wb_cyc_i(wb_cyc_i),
        .wb_stb_i(wb_stb_i),
        .s_wb_cti(wb_cti_i),
        .s_wb_bte(wb_bte_i),
        .wb_ack_o(wb_ack_o),
        .wb_err_o(wb_err_o),
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

    // Wishbone Write Task
    task wb_write(input [31:0] addr, input [31:0] data);
        wb_adr_i = addr;
        wb_dat_i = data;
        wb_we_i  = 1;
        wb_cyc_i = 1;
        wb_stb_i = 1;
        wb_sel_i = 4'hF;
        wb_cti_i = 3'b000;
        wb_bte_i = 2'b00;
        
        wait(wb_ack_o);
        @(posedge clk);
        #1;
        wb_cyc_i = 0;
        wb_stb_i = 0;
        wb_we_i  = 0;
    endtask

    // Wishbone Read Task
    task wb_read(input [31:0] addr, output [31:0] data);
        wb_adr_i = addr;
        wb_we_i  = 0;
        wb_cyc_i = 1;
        wb_stb_i = 1;
        wb_sel_i = 4'hF;
        
        wait(wb_ack_o);
        @(posedge clk);
        #1;
        data = wb_dat_o;
        wb_cyc_i = 0;
        wb_stb_i = 0;
    endtask

    // Main Test Sequence
    initial begin
        logic [31:0] rdata;
        int errors = 0;
        
        // Reset
        rst = 1;
        wb_cyc_i = 0;
        wb_stb_i = 0;
        repeat(5) @(posedge clk);
        rst = 0;
        repeat(2) @(posedge clk);

        $display("[%t] Starting Wishbone Native Directed Test...", $time);

        // Test 1: Basic R/W and DIR
        $display("[%t] Test 1: Basic R/W and DIR", $time);
        wb_write(REG_DIR, 32'hFF);
        wb_write(REG_DATA_O, 32'hAA);
        repeat(10) @(posedge clk);
        wb_read(REG_DATA_O, rdata);
        if (rdata[7:0] !== 8'hAA) begin
            $error("Test 1 Failed: DATA_O mismatch, got %h expected AA", rdata[7:0]);
            errors++;
        end
        wb_read(REG_DATA_I, rdata);
        if (rdata[7:0] !== 8'hAA) begin
            $error("Test 1 Failed: DATA_I mismatch, got %h expected AA", rdata[7:0]);
            errors++;
        end

        // Test 2: Atomic Operations
        $display("[%t] Test 2: Atomic Operations", $time);
        wb_write(REG_DATA_O, 32'h00);
        wb_write(REG_SET_O,  32'h55);
        wb_read(REG_DATA_O, rdata);
        if (rdata[7:0] !== 8'h55) begin
            $error("Test 2 Failed: SET failed, got %h expected 55", rdata[7:0]);
            errors++;
        end
        
        wb_write(REG_TGL_O,  32'h33);
        wb_read(REG_DATA_O, rdata);
        if (rdata[7:0] !== 8'h66) begin
            $error("Test 2 Failed: TGL failed, got %h expected 66", rdata[7:0]);
            errors++;
        end

        wb_write(REG_CLR_O,  32'h44);
        wb_read(REG_DATA_O, rdata);
        if (rdata[7:0] !== 8'h22) begin
            $error("Test 2 Failed: CLR failed, got %h expected 22", rdata[7:0]);
            errors++;
        end

        // Test 3: Interrupts (Basic)
        $display("[%t] Test 3: Interrupts (Basic)", $time);
        wb_write(REG_DIR,    32'hFF); // Outputs
        wb_write(REG_INT_EN, 32'h01); // Enable Bit 0
        wb_write(REG_DATA_O, 32'h01); // Bit 0 High
        repeat(5) @(posedge clk);
        wb_write(REG_INT_STS, 32'h01); // Clear Status
        repeat(2) @(posedge clk);
        
        wb_write(REG_DATA_O, 32'h00); // Falling Edge on Bit 0
        repeat(10) @(posedge clk);
        
        wb_read(REG_INT_STS, rdata);
        if (!(rdata & 32'h01)) begin
             $error("Test 3 Failed: Interrupt status not set");
             errors++;
        end
        if (!intr) begin
             $error("Test 3 Failed: Global interrupt not asserted");
             errors++;
        end
        wb_write(REG_INT_STS, 32'h01); // Clear

        $display("[%t] Wishbone Native Directed Test Completion.", $time);
        $display("--------------------------------------------------");
        if (errors == 0) begin
            $display("WISHBONE TEST PASSED");
        end else begin
            $display("WISHBONE TEST FAILED with %0d errors", errors);
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
