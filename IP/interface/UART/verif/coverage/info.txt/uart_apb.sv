//      // verilator_coverage annotation
        /*
         * uart_apb.sv
         *
         * APB4 Wrapper for UART IP.
         */
        
        `timescale 1ns / 1ps
        
        module uart_apb #(
            parameter DEFAULT_BAUD_DIV = 16'd27
        ) (
            // APB Slave Interface
%000000     input  logic        pclk,
%000000     input  logic        presetn,
%000000     input  logic [31:0] paddr,
%000000     input  logic [ 2:0] pprot,
%000000     input  logic        psel,
%000000     input  logic        penable,
%000000     input  logic        pwrite,
%000000     input  logic [31:0] pwdata,
%000000     input  logic [ 3:0] pstrb,
%000000     output logic        pready,
%000000     output logic [31:0] prdata,
%000000     output logic        pslverr,
        
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
        
          // Instantiate APB Slave Adapter
          apb_slave_adapter #(
              .ADDR_WIDTH(32),
              .DATA_WIDTH(32)
          ) adapter_inst (
              .pclk   (pclk),
              .presetn(presetn),
        
              // APB signals
              .paddr  (paddr),
              .pprot  (pprot),
              .psel   (psel),
              .penable(penable),
              .pwrite (pwrite),
              .pwdata (pwdata),
              .pstrb  (pstrb),
              .pready (pready),
              .prdata (prdata),
              .pslverr(pslverr),
        
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
              .clk       (pclk),
              .rst_n     (presetn),
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
        
