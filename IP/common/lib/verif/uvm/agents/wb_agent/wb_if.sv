/*
 * File: wb_if.sv
 * Description: Wishbone B4 SystemVerilog Interface
 */
interface wb_if (input logic clk, input logic rst_n);
    logic        cyc;
    logic        stb;
    logic        we;
    logic [31:0] adr;
    logic [31:0] dat_i; // To Slave
    logic [31:0] dat_o; // From Slave
    logic [3:0]  sel;
    logic        ack;
    
    clocking cb @(posedge clk);
        output cyc, stb, we, adr, dat_i, sel;
        input  ack, dat_o;
    endclocking
    
    modport master (clocking cb, input clk, rst_n);
    modport monitor (input clk, rst_n, cyc, stb, we, adr, dat_i, sel, ack, dat_o);

endinterface
