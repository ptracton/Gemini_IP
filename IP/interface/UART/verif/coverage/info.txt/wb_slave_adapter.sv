//      // verilator_coverage annotation
        //------------------------------------------------------------------------------
        // File: wb_slave_adapter.sv
        // Description: Generic Wishbone B4 Slave Adapter.
        // Converts Wishbone transactions into a simple native register bus.
        //
        // Author: Gemini-3 AI
        // License: MIT
        //------------------------------------------------------------------------------
        
        module wb_slave_adapter #(
            parameter int ADDR_WIDTH = 32,
            parameter int DATA_WIDTH = 32
        )(
%000000     input  logic                    wb_clk_i,
%000000     input  logic                    wb_rst_i,
            
            // Wishbone Interface
%000000     input  logic [ADDR_WIDTH-1:0]   wb_adr_i,
%000000     input  logic [DATA_WIDTH-1:0]   wb_dat_i,
%000000     output logic [DATA_WIDTH-1:0]   wb_dat_o,
%000000     input  logic                    wb_we_i,
%000000     input  logic                    wb_stb_i,
%000000     input  logic                    wb_cyc_i,
%000000     input  logic [(DATA_WIDTH/8)-1:0] wb_sel_i,
%000000     output logic                    wb_ack_o,
%000000     output logic                    wb_err_o,
%000000     output logic                    wb_stall_o,
        
            // Native Register Bus
%000000     output logic [ADDR_WIDTH-1:0]   reg_addr,
%000000     output logic [DATA_WIDTH-1:0]   reg_wdata,
%000000     input  logic [DATA_WIDTH-1:0]   reg_rdata,
%000000     output logic                    reg_we,
%000000     output logic                    reg_re,
%000000     output logic [(DATA_WIDTH/8)-1:0] reg_be
        );
        
            // Internal ACK register
%000000     logic ack_q;
        
            // Wishbone Logic
            assign wb_err_o   = 1'b0;
            assign wb_stall_o = 1'b0;
            assign wb_dat_o   = reg_rdata;
            assign wb_ack_o   = ack_q;
        
            // ACK Generation (1 wait state)
%000000     always_ff @(posedge wb_clk_i or posedge wb_rst_i) begin
%000000         if (wb_rst_i) begin
%000000             ack_q <= 1'b0;
%000000         end else begin
%000000             if (wb_cyc_i && wb_stb_i && !ack_q) begin
%000000                 ack_q <= 1'b1;
%000000             end else begin
%000000                 ack_q <= 1'b0;
                    end
                end
            end
        
            // Native Bus Assignments
            assign reg_addr  = wb_adr_i;
            assign reg_wdata = wb_dat_i;
            assign reg_be    = wb_sel_i;
            
            // Strobes active when CYC and STB are high
            // Gate reg_we with !ack_q to ensure single-cycle pulse for atomic writes.
            // Do NOT gate reg_re, as we need data valid during the Ack cycle.
            assign reg_we    = wb_cyc_i && wb_stb_i && wb_we_i && !wb_ack_o;
            assign reg_re    = wb_cyc_i && wb_stb_i && !wb_we_i;
        
        
        
        endmodule
        
