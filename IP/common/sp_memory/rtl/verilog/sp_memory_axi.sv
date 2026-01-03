/*
 * File: sp_memory_axi.sv
 * Description: AXI4-Lite Wrapper for Single Port Memory.
 * Author: Gemini-3 AI
 */

module sp_memory_axi #(
    parameter WIDTH = 32,
    parameter DEPTH = 1024,
    parameter TECHNOLOGY = "GENERIC"
) (
    input logic aclk,
    input logic aresetn,

    // AXI4-Lite Slave Interface
    // Write Address Channel
    input  logic [         31:0] awaddr,
    input  logic [          2:0] awprot,
    input  logic                 awvalid,
    output logic                 awready,
    // Write Data Channel
    input  logic [    WIDTH-1:0] wdata,
    input  logic [(WIDTH/8)-1:0] wstrb,
    input  logic                 wvalid,
    output logic                 wready,
    // Write Response Channel
    output logic [          1:0] bresp,
    output logic                 bvalid,
    input  logic                 bready,
    // Read Address Channel
    input  logic [         31:0] araddr,
    input  logic [          2:0] arprot,
    input  logic                 arvalid,
    output logic                 arready,
    // Read Data Channel
    output logic [    WIDTH-1:0] rdata,
    output logic [          1:0] rresp,
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

  // AXI4-Lite Slave Controller Logic
  // Simple state machine or direct combinatorial mapping depending on latency requirements.
  // Supporting 1-cycle latency integration.

  // Using a library adapter or custom logic?
  // Let's implement a clean custom adapter for this specific IP to minimize external dependencies for this example,
  // matching standard Gemini IP patterns.

  typedef enum logic [1:0] {
    IDLE,
    R_ACCESS,
    W_ACCESS
  } state_t;
  state_t state, next_state;

  // Address Decode
  // Assumption: Base address handled by interconnect, we see offset.
  // Align address to word boundaries.
  localparam int ADDR_LSB = $clog2(WIDTH / 8);

  // Buffers for channels
  logic aw_done, w_done, b_done;
  logic ar_done, r_done;

  // Handshake Logic
  always_ff @(posedge aclk or negedge aresetn) begin
    if (!aresetn) begin
      awready <= 1'b0;
      wready  <= 1'b0;
      bvalid  <= 1'b0;
      bresp   <= 2'b00;  // OKAY
      arready <= 1'b0;
      rvalid  <= 1'b0;
      rresp   <= 2'b00;  // OKAY
      aw_done <= 1'b0;
      w_done  <= 1'b0;
      ar_done <= 1'b0;
    end else begin
      // Write Channel
      if (awvalid && !awready && !aw_done) awready <= 1'b1;
      else awready <= 1'b0;

      if (wvalid && !wready && !w_done) wready <= 1'b1;
      else wready <= 1'b0;

      if (awready && awvalid) aw_done <= 1'b1;
      if (wready && wvalid) w_done <= 1'b1;

      if (aw_done && w_done && !bvalid) begin
        bvalid  <= 1'b1;
        aw_done <= 1'b0;
        w_done  <= 1'b0;
      end else if (bready && bvalid) begin
        bvalid <= 1'b0;
      end

      // Read Channel
      if (arvalid && !arready && !ar_done) begin
        arready <= 1'b1;
        ar_done <= 1'b1;
      end else begin
        arready <= 1'b0;
      end

      if (rready && rvalid) begin
        rvalid  <= 1'b0;
        ar_done <= 1'b0;  // Ready for next
      end else if (ar_done && !rvalid) begin
        // Simple 1-cycle definition logic
        // For BRAM, data is ready 1 cycle after address
        // We need to wait for memory latency.
        // Assuming memory is synchronous with clk.
        // If arready was high cycle N, data is valid cycle N+1.
        // WE simulate this delay via the state/control flow effectively.
        rvalid <= 1'b1;
      end
    end
  end

  // Memory Mapping
  logic [31:0] latched_waddr, latched_raddr;
  logic [WIDTH-1:0] latched_wdata;
  logic [(WIDTH/8)-1:0] latched_wstrb;

  always_ff @(posedge aclk) begin
    if (awvalid && awready) latched_waddr <= awaddr;
    if (wvalid && wready) begin
      latched_wdata <= wdata;
      latched_wstrb <= wstrb;
    end
    if (arvalid && arready) latched_raddr <= araddr;
  end

  // Memory Control
  // Priority: Writes or Reads? Reads usually simple, Writes require B channel response.
  // AXI4-Lite doesn't support simultaneous R/W transactions efficiently on same ID (implicit).
  // Note: Simple arbitration if both valid.

  logic [$clog2(DEPTH)-1:0] w_slice_addr, r_slice_addr;
  assign w_slice_addr = latched_waddr[$clog2(DEPTH)+ADDR_LSB-1 : ADDR_LSB];
  assign r_slice_addr = araddr[$clog2(DEPTH)+ADDR_LSB-1 : ADDR_LSB];

  // Wait, BRAM needs CS during the clock edge of operation.
  // WRITE: access happens when aw_done & w_done are true (data ready to write)
  // READ: access happens when arvalid & arready are true (address captured)

  always_comb begin
    mem_we = 1'b0;
    mem_addr = '0;
    mem_wdata = '0;
    mem_wstrb = '0;

    // Write Operation (Trigger when both addr and data latched/valid)
    if (aw_done && w_done && !bvalid) begin
      mem_cs = 1'b1;
      mem_we = 1'b1;  // Trigger Write
      mem_addr = w_slice_addr;
      mem_wdata = latched_wdata;
      mem_wstrb = latched_wstrb;
    end  // Read Operation
    else if (arvalid && arready) begin
      // Trigger Read
      mem_cs = 1'b1;
      mem_we = 1'b0;
      mem_addr = r_slice_addr;
      mem_wdata = '0;
      mem_wstrb = '0;
    end else begin
      mem_cs = 1'b0;
    end
  end

  // Instantiate Core
  sp_memory #(
      .WIDTH(WIDTH),
      .DEPTH(DEPTH),
      .TECHNOLOGY(TECHNOLOGY)
  ) core (
      .clk(aclk),
      .rst_n(aresetn),
      .cs(mem_cs),
      .we(mem_we),
      .addr(mem_addr),
      .wdata(mem_wdata),
      .wstrb(mem_wstrb),
      .rdata(mem_rdata)
  );

  assign rdata = mem_rdata;

endmodule
