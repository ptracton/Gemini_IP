//      // verilator_coverage annotation
        /*
         * uart_core.sv
         *
         * Generic UART Core with Native Register Interface.
         * Supports configurable baud rate, parity, stop bits, and interrupts.
         */
        
        `timescale 1ns / 1ps
        
        module uart_core #(
            parameter DEFAULT_BAUD_DIV = 16'd27,  // Example for 115200 @ 50MHz
            parameter FIFO_DEPTH       = 16       // Internal FIFOs
        ) (
%000000     input logic clk,
%000000     input logic rst_n,
        
            // UART Physical Interface
%000000     input  logic uart_rxd,
%000000     output logic uart_txd,
%000000     output logic uart_rts_n,
%000000     input  logic uart_cts_n,
%000000     output logic uart_de,
        
            // Native Register Interface
%000000     input  logic [31:0] reg_addr,
%000000     input  logic [31:0] reg_wdata,
%000000     output logic [31:0] reg_rdata,
%000000     input  logic        reg_we,
%000000     input  logic        reg_re,
%000000     input  logic [ 3:0] reg_be,
        
            // DMA Handshake
%000000     output logic dma_tx_req,
%000000     output logic dma_rx_req,
        
            // Interrupt
%000000     output logic intr
        );
        
          //--------------------------------------------------------------------------
          // Type Definitions
          //--------------------------------------------------------------------------
          typedef enum logic {
            ST_TX_IDLE = 1'b0,
            ST_TX_SEND = 1'b1
          } tx_state_t;
        
          typedef enum logic [2:0] {
            ST_RX_IDLE       = 3'd0,
            ST_RX_START      = 3'd1,
            ST_RX_DATA       = 3'd2,
            ST_RX_PARITY     = 3'd3,
            ST_RX_STOP       = 3'd4,
            ST_RX_DONE       = 3'd5,
            ST_RX_AB_START   = 3'd6,
            ST_RX_AB_MEASURE = 3'd7
          } rx_state_t;
        
          typedef enum logic [1:0] {
            ST_AB_IDLE,
            ST_AB_MEASURE,
            ST_AB_CALC
          } ab_state_t;
        
          //--------------------------------------------------------------------------
          // Signal Declarations
          //--------------------------------------------------------------------------
%000000   logic [31:0] reg_sr;
%000000   logic [31:0] reg_cr;
%000000   logic [15:0] reg_baud;
%000000   logic [ 7:0] reg_baud_frac;
%000000   logic [31:0] reg_isr;
%000000   logic [31:0] reg_imr;
%000000   logic [31:0] reg_fcr;
%000000   logic [31:0] reg_dcr;
%000000   logic [31:0] reg_abcr;
        
%000000   logic [ 1:0] parity_cfg;
%000000   logic [ 1:0] stop_bits_cfg;
%000000   logic        fifo_en;
%000000   logic        loopback_en;
%000000   logic        auto_rts_en;
%000000   logic        auto_cts_en;
%000000   logic        rs485_en;
%000000   logic        irda_en;
%000000   logic        stick_parity;
%000000   logic rx_en, tx_en;
%000000   logic        rts_ctrl_bit;
%000000   logic [ 7:0] reg_addr_low;
%000000   logic        fcr_tx_flush_bit;
%000000   logic        fcr_rx_flush_bit;
%000000   logic [11:0] fcr_read_bits;
        
%000000   logic tx_push, tx_pop, tx_full, tx_empty, tx_almost_full, tx_busy;
%000000   logic [$clog2(FIFO_DEPTH):0] tx_level;
%000000   logic [8:0] tx_data_in, tx_data_out;
        
%000000   logic rx_push, rx_pop, rx_full, rx_empty, rx_almost_full, rx_overrun;
%000000   logic [$clog2(FIFO_DEPTH):0] rx_level;
%000000   logic [8:0] rx_data_in, rx_data_out;
        
%000000   logic tx_fifo_flush, rx_fifo_flush;
        
%000000   logic      [ 3:0] tx_tick_cnt;
%000000   logic      [ 3:0] tx_bit_cnt;
%000000   logic      [12:0] tx_shift_reg;
%000000   logic             tx_done_internal;
%000000   logic             irda_tx_pulse;
%000000   logic             uart_txd_internal;
%000000   tx_state_t        tx_state;
        
%000000   logic      [ 3:0] rx_tick_cnt;
%000000   logic      [ 3:0] rx_bit_cnt;
%000000   logic      [ 8:0] rx_shifter;
%000000   logic             rx_parity_bit;
%000000   logic             rx_in;
%000000   logic             stop_err_internal;
%000000   logic             parity_err_internal;
%000000   rx_state_t        rx_state;
        
%000000   logic      [31:0] ab_cnt;
%000000   logic             ab_last_rxd;
%000000   ab_state_t        ab_state;
        
%000000   logic      [15:0] tx_baud_cnt;
%000000   logic      [ 7:0] tx_frac_cnt;
%000000   logic             tx_baud_tick;
        
%000000   logic      [15:0] rx_baud_cnt;
%000000   logic      [ 7:0] rx_frac_cnt;
%000000   logic             rx_baud_tick;
        
          //--------------------------------------------------------------------------
          // Static Assignments
          //--------------------------------------------------------------------------
          assign tx_en = reg_cr[0];
          assign rx_en = reg_cr[1];
          assign stop_bits_cfg = reg_cr[5:4];
          assign parity_cfg = reg_cr[7:6];
          assign fifo_en = reg_cr[8];
          assign loopback_en = reg_cr[9];
          assign rts_ctrl_bit = reg_cr[10];
          assign auto_rts_en = reg_cr[11];
          assign auto_cts_en = reg_cr[12];
          assign rs485_en = reg_cr[13];
          assign irda_en = reg_cr[14];
          assign stick_parity = reg_cr[15];
          assign reg_addr_low = reg_addr[7:0];
          assign fcr_tx_flush_bit = reg_fcr[0];
          assign fcr_rx_flush_bit = reg_fcr[1];
          assign fcr_read_bits = reg_fcr[11:0];
        
          assign tx_fifo_flush = fcr_tx_flush_bit;
          assign rx_fifo_flush = fcr_rx_flush_bit;
        
          assign reg_sr = {
            21'd0,  // 31:11
            rx_overrun,  // 10
            tx_full,  // 9
            rx_full,  // 8
            stop_err_internal,  // 7
            parity_err_internal,  // 6
            tx_done_internal,  // 5
            tx_busy,  // 4
            1'b0,  // 3
            1'b1,  // 2
            1'b1,  // 1
            !rx_empty  // 0
          };
        
          //--------------------------------------------------------------------------
          // FIFOs
          //--------------------------------------------------------------------------
          sync_fifo #(
              .DEPTH(FIFO_DEPTH),
              .WIDTH(9),  // Changed from DATA_WIDTH
              .FWFT_MODE(1)
          ) tx_fifo (
              .clk         (clk),
              .rst_n       (rst_n),
%000000       .flush       (fcr_tx_flush),  // Using the renamed signal
              .push        (tx_push),
              .data_in     (tx_data_in),
              .pop         (tx_pop),
              .data_out    (tx_data_out),
              .full        (tx_full),
              .almost_full (),              // Removed connection
              .overflow    (),
              .empty       (tx_empty),
              .almost_empty(),
              .underflow   (),
              .level       (tx_level),
              .max_level   ()
          );
        
          sync_fifo #(
              .DEPTH(FIFO_DEPTH),
              .WIDTH(9),  // Changed from DATA_WIDTH
              .FWFT_MODE(1)
          ) rx_fifo (
              .clk         (clk),
              .rst_n       (rst_n),
%000000       .flush       (fcr_rx_flush),  // Using the renamed signal
              .push        (rx_push),
              .data_in     (rx_data_in),
              .pop         (rx_pop),
              .data_out    (rx_data_out),
              .full        (rx_full),
              .almost_full (),              // Removed connection
%000000       .overflow    (rx_overflow),   // Changed from rx_overrun
              .empty       (rx_empty),
              .almost_empty(),
              .underflow   (),
              .level       (rx_level),
              .max_level   ()
          );
        
          // DMA logic
          assign dma_tx_req = !tx_almost_full && reg_dcr[0];
          assign dma_rx_req = !rx_empty && reg_dcr[1];
        
          // RTS/CTS logic
%000000   always_comb begin
%000000     uart_rts_n = 1'b1;
%000000     if (rx_en) begin
%000000       if (auto_rts_en) uart_rts_n = rx_almost_full;
%000000       else uart_rts_n = !rts_ctrl_bit;
            end
          end
        
          //--------------------------------------------------------------------------
          // Register Read/Write Logic
          //--------------------------------------------------------------------------
%000000   always_ff @(posedge clk or negedge rst_n) begin
%000000     if (!rst_n) begin
%000000       reg_cr        <= 32'h0;
%000000       reg_baud      <= DEFAULT_BAUD_DIV;
%000000       reg_baud_frac <= 8'h0;
%000000       reg_imr       <= 32'h0;
%000000       reg_isr       <= 32'h0;
%000000       reg_fcr       <= 32'h0;
%000000       reg_dcr       <= 32'h0;
%000000       reg_abcr      <= 32'h0;
%000000       tx_push       <= 1'b0;
%000000       tx_data_in    <= 9'h0;
%000000       rx_pop        <= 1'b0;
%000000     end else begin
%000000       tx_push <= 1'b0;
%000000       rx_pop <= 1'b0;
%000000       reg_fcr[1:0] <= 2'b00;  // Only flush bits are self-clearing
        
              // Write Logic
%000000       if (reg_we) begin
%000000         case (reg_addr_low)
%000000           8'h00: begin
%000000             tx_data_in <= reg_wdata[8:0];
%000000             tx_push    <= 1'b1;
                  end
%000000           8'h08:   reg_cr <= reg_wdata;
%000000           8'h0C: begin
%000000             reg_baud      <= reg_wdata[15:0];
%000000             reg_baud_frac <= reg_wdata[23:16];
                  end
%000000           8'h10:   reg_isr <= reg_isr & ~reg_wdata;  // W1C
%000000           8'h14:   reg_imr <= reg_wdata;
%000000           8'h18:   reg_fcr <= reg_wdata;
%000000           8'h1C:   reg_dcr <= reg_wdata;
%000000           8'h20:   reg_abcr <= reg_wdata;
%000000           default: ;
                endcase
              end
        
              // Read Logic
%000000       if (reg_re) begin
%000000         if (reg_addr_low == 8'h00) rx_pop <= 1'b1;
              end
        
              // Interrupt Status Update
%000000       if (!rx_empty) reg_isr[0] <= 1'b1;
%000000       if (tx_empty) reg_isr[1] <= 1'b1;
            end
          end
        
          // Combinatorial Read Data
%000000   always_comb begin
%000000     reg_rdata = 32'h0;
%000000     case (reg_addr_low)
%000000       8'h00:   reg_rdata = {23'h0, rx_data_out};
%000000       8'h04:   reg_rdata = reg_sr;
%000000       8'h08:   reg_rdata = reg_cr;
%000000       8'h0C:   reg_rdata = {8'h0, reg_baud_frac, reg_baud};
%000000       8'h10:   reg_rdata = reg_isr;
%000000       8'h14:   reg_rdata = reg_imr;
%000000       8'h18:   reg_rdata = {20'h0, fcr_read_bits};
%000000       8'h1C:   reg_rdata = reg_dcr;
%000000       8'h20:   reg_rdata = reg_abcr;
%000000       default: reg_rdata = 32'hDEADBEEF;
            endcase
          end
        
          // Interrupt signal
          assign intr = |(reg_isr & reg_imr);
        
          //--------------------------------------------------------------------------
          // Baud Rate Generators
          //--------------------------------------------------------------------------
%000000   always_ff @(posedge clk or negedge rst_n) begin
%000000     if (!rst_n) begin
%000000       tx_baud_cnt  <= 16'h0;
%000000       tx_frac_cnt  <= 8'h0;
%000000       tx_baud_tick <= 1'b0;
%000000     end else if (tx_state == ST_TX_IDLE) begin
%000000       tx_baud_cnt  <= 16'h0;
%000000       tx_frac_cnt  <= 8'h0;
%000000       tx_baud_tick <= 1'b0;
%000000     end else if (reg_baud != 0) begin
%000000       tx_baud_tick <= 1'b0;
%000000       if (tx_baud_cnt >= reg_baud - 1 + (tx_frac_cnt < reg_baud_frac ? 1 : 0)) begin
%000000         tx_baud_cnt  <= 16'h0;
%000000         tx_baud_tick <= 1'b1;
%000000         tx_frac_cnt  <= tx_frac_cnt + 8'd1;
%000000       end else begin
%000000         tx_baud_cnt <= tx_baud_cnt + 16'd1;
              end
            end
          end
        
%000000   always_ff @(posedge clk or negedge rst_n) begin
%000000     if (!rst_n) begin
%000000       rx_baud_cnt  <= 16'h0;
%000000       rx_frac_cnt  <= 8'h0;
%000000       rx_baud_tick <= 1'b0;
%000000     end else if (rx_state == ST_RX_IDLE) begin
%000000       rx_baud_cnt  <= 16'h0;
%000000       rx_frac_cnt  <= 8'h0;
%000000       rx_baud_tick <= 1'b0;
%000000     end else if (reg_baud != 0) begin
%000000       rx_baud_tick <= 1'b0;
%000000       if (rx_baud_cnt >= reg_baud - 1 + (rx_frac_cnt < reg_baud_frac ? 1 : 0)) begin
%000000         rx_baud_cnt  <= 16'h0;
%000000         rx_baud_tick <= 1'b1;
%000000         rx_frac_cnt  <= rx_frac_cnt + 8'd1;
%000000       end else begin
%000000         rx_baud_cnt <= rx_baud_cnt + 16'd1;
              end
            end
          end
        
          //--------------------------------------------------------------------------
          // TX Engine
          //--------------------------------------------------------------------------
%000000   always_ff @(posedge clk or negedge rst_n) begin
%000000     if (!rst_n) begin
%000000       tx_state          <= ST_TX_IDLE;
%000000       uart_txd_internal <= 1'b1;
%000000       tx_busy           <= 1'b0;
%000000       tx_done_internal  <= 1'b0;
%000000       tx_tick_cnt       <= 4'd0;
%000000       tx_bit_cnt        <= 4'd0;
%000000       tx_shift_reg      <= 13'h1FFF;
%000000       tx_pop            <= 1'b0;
%000000       irda_tx_pulse     <= 1'b0;
%000000       uart_de           <= 1'b0;
%000000     end else begin
%000000       tx_done_internal <= 1'b0;
%000000       tx_pop           <= 1'b0;
%000000       irda_tx_pulse    <= 1'b0;
        
%000000       case (tx_state)
%000000         ST_TX_IDLE: begin
%000000           uart_txd_internal <= 1'b1;
%000000           uart_de           <= 1'b0;
%000000           tx_busy           <= 1'b0;
%000000           if (!tx_empty && tx_en && (!auto_cts_en || !uart_cts_n)) begin
%000000             tx_state          <= ST_TX_SEND;
%000000             tx_busy           <= 1'b1;
%000000             tx_pop            <= 1'b1;
%000000             tx_tick_cnt       <= 4'd0;
%000000             uart_txd_internal <= 1'b0;  // Start bit
%000000             uart_de           <= 1'b1;
%000000             if (parity_cfg[1]) begin
%000000               tx_shift_reg <= {
%000000                 4'b1111,
%000000                 (stick_parity ? !parity_cfg[0] : (^{tx_data_out[7:0]} ^ parity_cfg[0])),
%000000                 tx_data_out[7:0]
                      };
%000000               tx_bit_cnt <= (rs485_en ? 4'd10 : 4'd9) + {3'd0, stop_bits_cfg[0]};
%000000             end else begin
%000000               tx_shift_reg <= {5'h1F, tx_data_out[7:0]};
%000000               tx_bit_cnt   <= (rs485_en ? 4'd9 : 4'd8) + {3'd0, stop_bits_cfg[0]};
                    end
                  end
                end
        
%000000         ST_TX_SEND: begin
%000000           uart_de <= 1'b1;
%000000           if (tx_baud_tick) begin
%000000             if (tx_tick_cnt == 4'd15) begin
%000000               tx_tick_cnt       <= 4'd0;
%000000               uart_txd_internal <= tx_shift_reg[0];
%000000               tx_shift_reg      <= {1'b1, tx_shift_reg[12:1]};
%000000               if (tx_bit_cnt == 4'd0) begin
%000000                 tx_state         <= ST_TX_IDLE;
%000000                 tx_done_internal <= 1'b1;
%000000               end else begin
%000000                 tx_bit_cnt <= tx_bit_cnt - 4'd1;
                      end
%000000             end else begin
%000000               tx_tick_cnt <= tx_tick_cnt + 4'd1;
%000000               if (irda_en && !tx_shift_reg[0] && (tx_tick_cnt < 4'd3)) begin
%000000                 irda_tx_pulse <= 1'b1;
                      end
                    end
                  end
                end
%000000         default: tx_state <= ST_TX_IDLE;
              endcase
            end
          end
        
%000000   assign uart_txd = irda_en ? !irda_tx_pulse : uart_txd_internal;
        
          //--------------------------------------------------------------------------
          // RX Engine
          //--------------------------------------------------------------------------
%000000   assign rx_in = loopback_en ? uart_txd : uart_rxd;
        
%000000   always_ff @(posedge clk or negedge rst_n) begin
%000000     if (!rst_n) begin
%000000       rx_state            <= ST_RX_IDLE;
%000000       rx_data_in          <= 9'h0;
%000000       rx_push             <= 1'b0;
%000000       rx_tick_cnt         <= 4'd0;
%000000       rx_bit_cnt          <= 4'd0;
%000000       parity_err_internal <= 1'b0;
%000000       stop_err_internal   <= 1'b0;
%000000       rx_parity_bit       <= 1'b0;
%000000       rx_shifter          <= 9'h0;
%000000     end else begin
%000000       rx_push <= 1'b0;
        
%000000       case (rx_state)
%000000         ST_RX_IDLE: begin
%000000           if (!rx_in && rx_en) begin
%000000             rx_state    <= ST_RX_START;
%000000             rx_tick_cnt <= 4'd0;
                  end
                end
        
%000000         ST_RX_DONE: begin
%000000           rx_data_in <= rs485_en ? rx_shifter : {1'b0, rx_shifter[8:1]};
%000000           rx_push    <= 1'b1;
%000000           if (parity_cfg[1]) begin
%000000             if (stick_parity) begin
%000000               parity_err_internal <= (rx_parity_bit != !parity_cfg[0]);
%000000             end else begin
%000000               parity_err_internal <=
%000000                   (rx_parity_bit != (parity_cfg[0] ? ~(^rx_shifter[7:0]) : (^rx_shifter[7:0])));
                    end
%000000           end else begin
%000000             parity_err_internal <= 1'b0;
                  end
%000000           rx_state <= ST_RX_IDLE;
                end
        
%000000         default: begin
%000000           if (rx_baud_tick) begin
%000000             case (rx_state)
%000000               ST_RX_START: begin
%000000                 if (rx_tick_cnt == 4'd7) begin
%000000                   if (!rx_in) begin
%000000                     rx_tick_cnt <= 4'd0;
%000000                     rx_bit_cnt  <= 4'd0;
%000000                     rx_state    <= ST_RX_DATA;
%000000                   end else begin
%000000                     rx_state <= ST_RX_IDLE;
                          end
%000000                 end else begin
%000000                   rx_tick_cnt <= rx_tick_cnt + 4'd1;
                        end
                      end
        
%000000               ST_RX_DATA: begin
%000000                 if (rx_tick_cnt == 4'd15) begin
%000000                   rx_tick_cnt <= 4'd0;
%000000                   rx_shifter  <= {rx_in, rx_shifter[8:1]};
%000000                   if (rx_bit_cnt == (rs485_en ? 4'd8 : 4'd7)) begin
%000000                     if (parity_cfg[1]) rx_state <= ST_RX_PARITY;
%000000                     else rx_state <= ST_RX_STOP;
%000000                     rx_bit_cnt <= 4'd0;
%000000                   end else begin
%000000                     rx_bit_cnt <= rx_bit_cnt + 4'd1;
                          end
%000000                 end else begin
%000000                   rx_tick_cnt <= rx_tick_cnt + 4'd1;
                        end
                      end
        
%000000               ST_RX_PARITY: begin
%000000                 if (rx_tick_cnt == 4'd15) begin
%000000                   rx_tick_cnt   <= 4'd0;
%000000                   rx_parity_bit <= rx_in;
%000000                   rx_state      <= ST_RX_STOP;
%000000                 end else begin
%000000                   rx_tick_cnt <= rx_tick_cnt + 4'd1;
                        end
                      end
        
%000000               ST_RX_STOP: begin
%000000                 if (rx_tick_cnt == 4'd15) begin
%000000                   rx_tick_cnt <= 4'd0;
%000000                   if (rx_in) begin
%000000                     stop_err_internal <= 1'b0;
%000000                     if (stop_bits_cfg[0] && rx_bit_cnt == 4'd0) begin
%000000                       rx_bit_cnt <= 4'd1;
%000000                     end else begin
%000000                       rx_state <= ST_RX_DONE;
                            end
%000000                   end else begin
%000000                     stop_err_internal <= 1'b1;
%000000                     rx_state          <= ST_RX_DONE;
                          end
%000000                 end else begin
%000000                   rx_tick_cnt <= rx_tick_cnt + 4'd1;
                        end
                      end
%000000               default: rx_state <= ST_RX_IDLE;
                    endcase
                  end
                end
              endcase
            end
          end
        
          //--------------------------------------------------------------------------
          // Auto-Baud Detection
          //--------------------------------------------------------------------------
%000000   always_ff @(posedge clk or negedge rst_n) begin
%000000     if (!rst_n) begin
%000000       ab_state      <= ST_AB_IDLE;
%000000       ab_cnt        <= 32'd0;
%000000       ab_last_rxd   <= 1'b1;
%000000       reg_abcr[2:1] <= 2'b00;  // Error, Done
%000000     end else begin
%000000       ab_last_rxd <= rx_in;
        
%000000       case (ab_state)
%000000         ST_AB_IDLE: begin
%000000           if (reg_abcr[0]) begin
%000000             ab_state      <= ST_AB_MEASURE;
%000000             ab_cnt        <= 32'd0;
%000000             reg_abcr[2:1] <= 2'b00;
                  end
                end
        
%000000         ST_AB_MEASURE: begin
%000000           if (ab_last_rxd && !rx_in) begin
%000000             ab_cnt <= 32'd0;
%000000           end else if (!rx_in) begin
%000000             ab_cnt <= ab_cnt + 1;
%000000           end else if (!ab_last_rxd && rx_in) begin
%000000             ab_state <= ST_AB_CALC;
                  end
%000000           if (ab_cnt > 32'h00FFFFFF) begin
%000000             ab_state    <= ST_AB_IDLE;
%000000             reg_abcr[2] <= 1'b1;
%000000             reg_abcr[1] <= 1'b1;
                  end
                end
        
%000000         ST_AB_CALC: begin
%000000           reg_baud      <= ab_cnt[19:4];
%000000           reg_baud_frac <= {ab_cnt[3:0], 4'h0};
%000000           reg_abcr[1]   <= 1'b1;
%000000           ab_state      <= ST_AB_IDLE;
                end
%000000         default: ab_state <= ST_AB_IDLE;
              endcase
            end
          end
        
        endmodule
        
