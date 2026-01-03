/*
 * File: sp_memory_axi.sv
 * Description: AXI4-Lite Wrapper for Single Port Memory.
 * Author: Gemini-3 AI
 */

module sp_memory_axi #(
    parameter int WIDTH      = 32,
    parameter int DEPTH      = 1024,
    parameter bit PIPELINE   = 0,
    parameter bit PARITY     = 0,
    parameter bit ECC        = 0,
    parameter     TECHNOLOGY = "GENERIC"
) (
    input logic aclk,
    input logic aresetn,

    // Sideband Signals
    input  logic sleep,
    input  logic bist_en,
    output logic bist_done,
    output logic bist_pass,
    output logic err_parity,
    output logic err_ecc_single,
    output logic err_ecc_double,

    // AXI4 Slave Interface
    // Write Address Channel
    input  logic [         31:0] awaddr,
    input  logic [          7:0] awlen,    // Burst length
    input  logic [          2:0] awsize,   // Burst size
    input  logic [          1:0] awburst,  // Burst type
    input  logic [          2:0] awprot,
    input  logic                 awvalid,
    output logic                 awready,
    // Write Data Channel
    input  logic [    WIDTH-1:0] wdata,
    input  logic [(WIDTH/8)-1:0] wstrb,
    input  logic                 wlast,    // Last word of burst
    input  logic                 wvalid,
    output logic                 wready,
    // Write Response Channel
    output logic [          1:0] bresp,
    output logic                 bvalid,
    input  logic                 bready,
    // Read Address Channel
    input  logic [         31:0] araddr,
    input  logic [          7:0] arlen,    // Burst length
    input  logic [          2:0] arsize,   // Burst size
    input  logic [          1:0] arburst,  // Burst type
    input  logic [          2:0] arprot,
    input  logic                 arvalid,
    output logic                 arready,
    // Read Data Channel
    output logic [    WIDTH-1:0] rdata,
    output logic [          1:0] rresp,
    output logic                 rlast,    // Last word
    output logic                 rvalid,
    input  logic                 rready
);

  // Internal Signals
  logic                     mem_cs;
  logic                     mem_we;
  logic [$clog2(DEPTH)-1:0] mem_addr;
  logic [        WIDTH-1:0] mem_wdata;
  logic [    (WIDTH/8)-1:0] mem_wstrb;
  logic [        WIDTH-1:0] mem_rdata;

  // AXI4 State Machine
  typedef enum logic [1:0] {
    IDLE,
    WRITE_DATA,
    WRITE_RESP,
    READ_DATA
  } state_t;
  state_t state;

  // Burst Counters and Latches
  logic [31:0] curr_awaddr, curr_araddr;
  logic [7:0] len_awcount, len_arcount;
  logic [2:0] burst_size;
  logic [1:0] burst_type;

  localparam int ADDR_LSB = $clog2(WIDTH / 8);

  // Address Boundary Check
  logic w_addr_ok, r_addr_ok;
  assign w_addr_ok = (awaddr < (DEPTH << ADDR_LSB));
  assign r_addr_ok = (araddr < (DEPTH << ADDR_LSB));

  always_ff @(posedge aclk or negedge aresetn) begin
    if (!aresetn) begin
      state       <= IDLE;
      awready     <= 1'b0;
      wready      <= 1'b0;
      bvalid      <= 1'b0;
      bresp       <= 2'b00;
      arready     <= 1'b0;
      rvalid      <= 1'b0;
      rresp       <= 2'b00;
      rlast       <= 1'b0;
      len_awcount <= 0;
      len_arcount <= 0;
    end else begin
      case (state)
        IDLE: begin
          if (awvalid) begin
            awready     <= 1'b1;
            curr_awaddr <= awaddr;
            len_awcount <= awlen;
            bresp       <= w_addr_ok ? 2'b00 : 2'b11;  // OKAY or DECERR
            state       <= WRITE_DATA;
          end else if (arvalid) begin
            arready     <= 1'b1;
            curr_araddr <= araddr;
            len_arcount <= arlen;
            rresp       <= r_addr_ok ? 2'b00 : 2'b11;
            state       <= READ_DATA;
          end
        end

        WRITE_DATA: begin
          awready <= 1'b0;
          wready  <= 1'b1;
          if (wvalid && wready) begin
            curr_awaddr <= curr_awaddr + (1 << ADDR_LSB);
            if (len_awcount == 0 || wlast) begin
              wready <= 1'b0;
              state  <= WRITE_RESP;
            end else begin
              len_awcount <= len_awcount - 1;
            end
          end
        end

        WRITE_RESP: begin
          wready <= 1'b0;
          bvalid <= 1'b1;
          if (bvalid && bready) begin
            bvalid <= 1'b0;
            state  <= IDLE;
          end
        end

        READ_DATA: begin
          arready <= 1'b0;
          rvalid  <= 1'b1;
          rlast   <= (len_arcount == 0);
          if (rvalid && rready) begin
            curr_araddr <= curr_araddr + (1 << ADDR_LSB);
            if (len_arcount == 0) begin
              rvalid <= 1'b0;
              rlast  <= 1'b0;
              state  <= IDLE;
            end else begin
              len_arcount <= len_arcount - 1;
            end
          end
        end
      endcase
    end
  end

  // Memory interface mapping
  always_comb begin
    mem_cs    = 1'b0;
    mem_we    = 1'b0;
    mem_addr  = '0;
    mem_wdata = '0;
    mem_wstrb = '0;

    if (state == WRITE_DATA && wvalid) begin
      mem_cs    = 1'b1;
      mem_we    = 1'b1;
      mem_addr  = curr_awaddr[ADDR_LSB+$clog2(DEPTH)-1 : ADDR_LSB];
      mem_wdata = wdata;
      mem_wstrb = wstrb;
    end else if (state == READ_DATA) begin
      mem_cs   = 1'b1;
      mem_we   = 1'b0;
      mem_addr = curr_araddr[ADDR_LSB+$clog2(DEPTH)-1 : ADDR_LSB];
    end
  end

  sp_memory #(
      .WIDTH(WIDTH),
      .DEPTH(DEPTH),
      .PIPELINE(PIPELINE),
      .PARITY(PARITY),
      .ECC(ECC),
      .TECHNOLOGY(TECHNOLOGY)
  ) core (
      .clk(aclk),
      .rst_n(aresetn),
      .cs(mem_cs),
      .we(mem_we),
      .addr(mem_addr),
      .wdata(mem_wdata),
      .wstrb(mem_wstrb),
      .rdata(mem_rdata),
      .sleep(sleep),
      .bist_en(bist_en),
      .bist_done(bist_done),
      .bist_pass(bist_pass),
      .err_parity(err_parity),
      .err_ecc_single(err_ecc_single),
      .err_ecc_double(err_ecc_double)
  );

  assign rdata = mem_rdata;

`ifdef FORMAL
  bus_axi_properties #(
      .WIDTH(WIDTH),
      .DEPTH(DEPTH)
  ) formal_axi (
      .aclk   (aclk),
      .aresetn(aresetn),
      .awaddr (awaddr),
      .awvalid(awvalid),
      .awready(awready),
      .wdata  (wdata),
      .wvalid (wvalid),
      .wready (wready),
      .bresp  (bresp),
      .bvalid (bvalid),
      .bready (bready),
      .araddr (araddr),
      .arvalid(arvalid),
      .arready(arready),
      .rdata  (rdata),
      .rresp  (rresp),
      .rvalid (rvalid),
      .rready (rready),
      .mem_cs (mem_cs),
      .mem_we (mem_we),
      .mem_addr(mem_addr)
  );
`endif

endmodule
