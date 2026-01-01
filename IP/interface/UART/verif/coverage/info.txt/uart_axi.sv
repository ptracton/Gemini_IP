//      // verilator_coverage annotation
        /*
         * uart_axi.sv
         *
         * AXI4-Lite Wrapper for UART IP.
         */
        
        `timescale 1ns / 1ps
        
        module uart_axi #(
            parameter DEFAULT_BAUD_DIV = 16'd27
        ) (
            // AXI4-Lite Slave Interface
%000000     input  logic        s_axi_aclk,
%000000     input  logic        s_axi_aresetn,
%000000     input  logic [31:0] s_axi_awaddr,
%000000     input  logic [ 2:0] s_axi_awprot,
%000000     input  logic        s_axi_awvalid,
%000000     output logic        s_axi_awready,
%000000     input  logic [31:0] s_axi_wdata,
%000000     input  logic [ 3:0] s_axi_wstrb,
%000000     input  logic        s_axi_wvalid,
%000000     output logic        s_axi_wready,
%000000     output logic [ 1:0] s_axi_bresp,
%000000     output logic        s_axi_bvalid,
%000000     input  logic        s_axi_bready,
%000000     input  logic [31:0] s_axi_araddr,
%000000     input  logic [ 2:0] s_axi_arprot,
%000000     input  logic        s_axi_arvalid,
%000000     output logic        s_axi_arready,
%000000     output logic [31:0] s_axi_rdata,
%000000     output logic [ 1:0] s_axi_rresp,
%000000     output logic        s_axi_rvalid,
%000000     input  logic        s_axi_rready,
        
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
        
          // Instantiate AXI4-Lite Slave Adapter
          axi4lite_slave_adapter #(
              .ADDR_WIDTH(32),
              .DATA_WIDTH(32)
          ) adapter_inst (
              .aclk   (s_axi_aclk),
              .aresetn(s_axi_aresetn),
        
              // AXI signals
              .s_axi_awaddr (s_axi_awaddr),
              .s_axi_awprot (s_axi_awprot),
              .s_axi_awvalid(s_axi_awvalid),
              .s_axi_awready(s_axi_awready),
              .s_axi_wdata  (s_axi_wdata),
              .s_axi_wstrb  (s_axi_wstrb),
              .s_axi_wvalid (s_axi_wvalid),
              .s_axi_wready (s_axi_wready),
              .s_axi_bresp  (s_axi_bresp),
              .s_axi_bvalid (s_axi_bvalid),
              .s_axi_bready (s_axi_bready),
              .s_axi_araddr (s_axi_araddr),
              .s_axi_arprot (s_axi_arprot),
              .s_axi_arvalid(s_axi_arvalid),
              .s_axi_arready(s_axi_arready),
              .s_axi_rdata  (s_axi_rdata),
              .s_axi_rresp  (s_axi_rresp),
              .s_axi_rvalid (s_axi_rvalid),
              .s_axi_rready (s_axi_rready),
        
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
              .clk       (s_axi_aclk),
              .rst_n     (s_axi_aresetn),
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
        
