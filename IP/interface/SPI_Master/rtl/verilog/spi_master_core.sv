//------------------------------------------------------------------------------
// SPI Master Core (Enhanced)
//------------------------------------------------------------------------------



module spi_master_core #(
    parameter int FIFO_DEPTH = 16
) (
    input logic clk,
    input logic rst_n,

    // SPI Interface
    output logic sclk,
    output logic mosi,
    input  logic miso,

    // CPU/Wrapper Interface
    input  logic [31:0] tx_data,
    input  logic        tx_push,
    output logic        tx_full,
    output logic        tx_almost_full,

    output logic [31:0] rx_data,
    input  logic        rx_pop,
    output logic        rx_empty,
    output logic        rx_almost_empty,

    // Configuration
    input logic       cpol,
    input logic       cpha,
    input logic [7:0] clk_div,
    input logic [5:0] word_len,
    input logic       lsb_first,
    input logic       loopback,
    input logic       enable,

    // Status
    output logic busy,
    output logic done_intr
);

  typedef enum logic [1:0] {
    IDLE,
    LOAD,
    TRANSFER,
    DONE
  } state_t;
  state_t        state;

  // Internal Signals
  logic   [31:0] shift_reg;
  logic   [ 5:0] bit_cnt;
  logic   [ 7:0] clk_cnt;
  logic          sclk_reg;
  logic          mosi_reg;
  logic          active_miso;

  // FIFO Signals (Declared BEFORE their usage in 'assign' or 'always' blocks)
  logic   [31:0] tx_fifo_out;
  logic          tx_fifo_empty;
  logic          tx_fifo_pop;

  logic   [31:0] rx_fifo_in;
  logic          rx_fifo_push;

  assign busy = (state != IDLE) || !tx_fifo_empty;
  assign sclk = (state == TRANSFER) ? sclk_reg : cpol;
  assign mosi = mosi_reg;
  assign active_miso = loopback ? mosi_reg : miso;

  // TX FIFO
  sync_fifo #(
      .WIDTH(32),
      .DEPTH(FIFO_DEPTH),
      .FWFT_MODE(1)
  ) tx_fifo_inst (
      .clk(clk),
      .rst_n(rst_n),
      .flush(!enable),
      .push(tx_push),
      .data_in(tx_data),
      .full(tx_full),
      .almost_full(tx_almost_full),
      .almost_empty(),
      .pop(tx_fifo_pop),
      .data_out(tx_fifo_out),
      .empty(tx_fifo_empty),
      .overflow(),
      .underflow(),
      .level(),
      .max_level()
  );

  // RX FIFO
  sync_fifo #(
      .WIDTH(32),
      .DEPTH(FIFO_DEPTH),
      .FWFT_MODE(1)
  ) rx_fifo_inst (
      .clk(clk),
      .rst_n(rst_n),
      .flush(!enable),
      .push(rx_fifo_push),
      .data_in(rx_fifo_in),
      .full(),
      .almost_full(),
      .pop(rx_pop),
      .data_out(rx_data),
      .empty(rx_empty),
      .almost_empty(rx_almost_empty),
      .overflow(),
      .underflow(),
      .level(),
      .max_level()
  );

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      state <= IDLE;
      bit_cnt <= 6'd0;
      clk_cnt <= 8'd0;
      sclk_reg <= 1'b0;
      mosi_reg <= 1'b1;
      shift_reg <= 32'd0;
      tx_fifo_pop <= 1'b0;
      rx_fifo_push <= 1'b0;
      rx_fifo_in <= 32'd0;
      done_intr <= 1'b0;
    end else begin
      tx_fifo_pop <= 1'b0;
      rx_fifo_push <= 1'b0;
      done_intr <= 1'b0;

      case (state)
        IDLE: begin
          if (enable && !tx_fifo_empty) begin
            state <= LOAD;
          end else begin
            mosi_reg <= 1'b1;
            sclk_reg <= cpol;
          end
        end

        LOAD: begin
          state <= TRANSFER;
          shift_reg <= tx_fifo_out;
          tx_fifo_pop <= 1'b1;
          bit_cnt <= 6'd0;
          clk_cnt <= 8'd1;
          sclk_reg <= cpol;
          if (lsb_first) mosi_reg <= tx_fifo_out[0];
          else mosi_reg <= tx_fifo_out[word_len-1];
        end

        TRANSFER: begin
          if (clk_cnt >= clk_div) begin
            clk_cnt  <= 8'd1;
            sclk_reg <= ~sclk_reg;

            if (sclk_reg == cpol) begin
              if (cpha == 0) begin
                if (lsb_first) shift_reg <= {active_miso, shift_reg[31:1]};
                else shift_reg <= {shift_reg[30:0], active_miso};
              end
            end else begin
              if (bit_cnt == (word_len - 1)) begin
                state <= DONE;
              end else begin
                bit_cnt <= bit_cnt + 1;
                if (cpha == 0) begin
                  if (lsb_first) mosi_reg <= shift_reg[0];
                  else mosi_reg <= shift_reg[word_len-1];
                end
              end
            end
          end else begin
            clk_cnt <= clk_cnt + 1;
          end
        end

        DONE: begin
          if (lsb_first) rx_fifo_in <= (shift_reg >> (32 - word_len)) & ((1 << word_len) - 1);
          else rx_fifo_in <= shift_reg & ((1 << word_len) - 1);

          rx_fifo_push <= 1'b1;
          done_intr <= 1'b1;
          mosi_reg <= 1'b1;
          state <= IDLE;
        end
      endcase
    end
  end

endmodule
