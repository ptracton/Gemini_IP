//      // verilator_coverage annotation
        /*
         * uart_wb.sv
         *
         * Wishbone B4 Wrapper for UART IP.
         */
        
        `timescale 1ns / 1ps
        
        module uart_wb #(
            parameter DEFAULT_BAUD_DIV = 16'd27
        ) (
            // Wishbone Slave Interface
%000000     input  logic        wb_clk_i,
%000000     input  logic        wb_rst_i,
%000000     input  logic [31:0] wb_adr_i,
%000000     input  logic [31:0] wb_dat_i,
%000000     output logic [31:0] wb_dat_o,
%000000     input  logic        wb_we_i,
%000000     input  logic [ 3:0] wb_sel_i,
%000000     input  logic        wb_stb_i,
%000000     input  logic        wb_cyc_i,
%000000     output logic        wb_ack_o,
%000000     output logic        wb_err_o,
        
            // UART Physical Interface
%000000     input  logic uart_rxd,
%000000     output logic uart_txd,
%000000     output logic uart_rts_n,
%000000     input  logic uart_cts_n,
%000000     output logic uart_de,
        
            // DMA Handshake
%000000     output logic dma_tx_req,
%000000     output logic dma_rx_req,
        
            // Interrupt
%000000     output logic intr
        );
        
          // Native Register Interface signals
%000000   logic [31:0] reg_addr;
%000000   logic [31:0] reg_wdata;
%000000   logic [31:0] reg_rdata;
%000000   logic        reg_we;
%000000   logic        reg_re;
%000000   logic [ 3:0] reg_be;
        
          // Wishbone uses active-high reset, UART core uses active-low
%000000   logic        rst_n;
          assign rst_n = !wb_rst_i;
        
          // Instantiate Wishbone Slave Adapter
          wb_slave_adapter #(
              .ADDR_WIDTH(32),
              .DATA_WIDTH(32)
          ) adapter_inst (
              .wb_clk_i(wb_clk_i),
              .wb_rst_i(wb_rst_i),
        
              // Wishbone signals
              .wb_adr_i(wb_adr_i),
              .wb_dat_i(wb_dat_i),
              .wb_dat_o(wb_dat_o),
              .wb_we_i(wb_we_i),
              .wb_sel_i(wb_sel_i),
              .wb_stb_i(wb_stb_i),
              .wb_cyc_i(wb_cyc_i),
              .wb_ack_o(wb_ack_o),
              .wb_err_o(wb_err_o),
              .wb_stall_o(),  // Unused
        
              // Native Interface
              .reg_addr (reg_addr),
              .reg_wdata(reg_wdata),
              .reg_rdata(reg_rdata),
              .reg_we   (reg_we),
              .reg_re   (reg_re),
              .reg_be   (reg_be)
          );
        
          // Instantiate UART Core
          uart_core #(
              .DEFAULT_BAUD_DIV(DEFAULT_BAUD_DIV)
          ) core_inst (
              .clk       (wb_clk_i),
              .rst_n     (!wb_rst_i),
              .uart_rxd  (uart_rxd),
              .uart_txd  (uart_txd),
              .uart_rts_n(uart_rts_n),
              .uart_cts_n(uart_cts_n),
              .uart_de   (uart_de),
              .reg_addr  (reg_addr),
              .reg_wdata (reg_wdata),
              .reg_rdata (reg_rdata),
              .reg_we    (reg_we),
              .reg_re    (reg_re),
              .reg_be    (reg_be),
              .dma_tx_req(dma_tx_req),
              .dma_rx_req(dma_rx_req),
              .intr      (intr)
          );
        
        endmodule
        
