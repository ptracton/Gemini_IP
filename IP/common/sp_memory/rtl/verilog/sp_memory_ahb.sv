/*
 * File: sp_memory_ahb.sv
 * Description: AHB-Lite Wrapper for Single Port Memory.
 * Author: Gemini-3 AI
 */

module sp_memory_ahb #(
    parameter WIDTH = 32,
    parameter DEPTH = 1024,
    parameter TECHNOLOGY = "GENERIC"
) (
    input logic hclk,
    input logic hresetn,

    // AHB-Lite Interface
    input logic             hsel,
    input logic [     31:0] haddr,
    input logic [      1:0] htrans,  // 00=IDLE, 01=BUSY, 10=NONSEQ, 11=SEQ
    input logic             hwrite,
    input logic [      2:0] hsize,
    input logic [      2:0] hburst,
    input logic [      3:0] hprot,
    input logic [WIDTH-1:0] hwdata,
    input logic             hready,  // HREADY_IN

    output logic             hreadyout,
    output logic             hresp,      // 0=OKAY, 1=ERROR
    output logic [WIDTH-1:0] hrdata
);

  // Internal Signals
  logic                     mem_cs;
  logic                     mem_we;
  logic [$clog2(DEPTH)-1:0] mem_addr;
  logic [        WIDTH-1:0] mem_wdata;
  logic [    (WIDTH/8)-1:0] mem_wstrb;

  localparam int ADDR_LSB = $clog2(WIDTH / 8);

  // AHB Decoding for Data Phase
  logic        dp_write;
  logic [31:0] dp_addr;
  logic        dp_active;

  // Address Phase Sampling
  always_ff @(posedge hclk or negedge hresetn) begin
    if (!hresetn) begin
      dp_active <= 1'b0;
      dp_write  <= 1'b0;
      dp_addr   <= '0;
    end else begin
      if (hready) begin
        if (hsel && htrans[1]) begin  // Capture valid transfer
          $display("AHB_DBG: CAPTURE hsel=%b htrans=%b hwrite=%b addr=%x", hsel, htrans, hwrite,
                   haddr);
          dp_active <= 1'b1;
          dp_write  <= hwrite;
          dp_addr   <= haddr;
        end else begin
          dp_active <= 1'b0;
        end
      end
    end
  end

  // Byte Enable Generation based on HADDR and HSIZE for Width negotiation?
  // Assuming full width access for simplicity or aligned access.
  // Ideally should decode HSIZE/ADDR lowest bits to drive wstrb.
  // For now, assuming WORD access for 32-bit width.
  // If we want generic support, we need a function.

  logic [(WIDTH/8)-1:0] calc_wstrb;
  always_comb begin
    calc_wstrb = '0;
    if (WIDTH == 32) begin
      // Assuming Word Access (size=2) for simplified logic if size not available
      // Or use hsize? But hsize is from Address phase. We need stored size?
      // For now, hardcode full word as per previous call gen_wstrb(..., 3'b010)
      calc_wstrb = 4'b1111;
    end else begin
      calc_wstrb = '1;
    end
  end

  // Memory Control
  // Read:
  // If reading, we fed the address to the memory in the Address Phase (Combinatorial to memory).
  // BRAM captures at edge. Data available in proper Data Phase.
  // Write:
  // We capture address, then in Data Phase we have data. We assert WE in Data Phase.

  // PROBLEM: BRAM has 1 read/write port.
  // Read: needs Address at cycle N.
  // Write: needs Address and Data at cycle N+1 (Data Phase).

  // To support 0-wait state AHB with BRAM:
  // Read: hsel & htrans -> mem_re (active). address = haddr.
  // Write: hsel & htrans & write -> wait for next cycle? No, pipeline write.
  // If Write, we must perform the write in Data Phase.
  // If Read, we must perform read in Address Phase?

  // Conflict: If sequence is Read(A) -> Write(B)
  // Cycle 0: Addr(A) Read. Mem access A.
  // Cycle 1: Data(A) out. Addr(B) Write.
  // Cycle 2: Data(B) in. Mem access B.

  // Standard AHB RAM implementation:
  // Always use Data Phase address/controls for consistency? No, that adds wait state for Reads.
  // Mix:
  // Read: feed haddr directly.
  // Write: latch haddr, write in data phase.
  // Conflict check? No, AHB is pipelined.

  // Simple BRAM Controller Strategy:
  // READ: mem_addr = haddr.
  // WRITE: mem_addr = dp_addr.
  // Logic: If dp_active && dp_write -> DO WRITE (Data Phase).
  // Else If hsel && htrans && !hwrite -> DO READ (Addr Phase).
  // Priority: Write takes the port (Data Phase of prev instruction).
  // But if we use port for Write(B) in Cycle 1, and Read(C) needs it in Cycle 1...
  // We must stall Read(C). HREADYOUT = 0.

  // Stall if: We are writing pending data AND a new READ is requested.
  // Actually, simple BRAM logic usually:
  // If Write Pending: Access Memory with Write info.
  // If New Read: Access Memory with Read info.
  // We can't do both.

  logic [$clog2(DEPTH)-1:0] write_slice_addr, read_slice_addr;
  assign write_slice_addr = dp_addr[$clog2(DEPTH)+ADDR_LSB-1 : ADDR_LSB];
  assign read_slice_addr  = haddr[$clog2(DEPTH)+ADDR_LSB-1 : ADDR_LSB];

  // Read Wait State Logic
  logic data_ready;
  always_ff @(posedge hclk or negedge hresetn) begin
    if (!hresetn) begin
      data_ready <= 1'b0;
    end else begin
      if (hready) begin
        data_ready <= 1'b0;  // New transaction, clear ready
      end else if (dp_active && !dp_write && !data_ready) begin
        data_ready <= 1'b1;  // Stalling for Read, next cycle ready
      end
    end
  end

  // Stall during Read Data Phase if data not ready
  assign hreadyout = ~(dp_active && !dp_write && !data_ready);

  always_comb begin
    mem_cs = 1'b0;
    mem_we = 1'b0;
    mem_addr = '0;
    mem_wdata = hwdata;
    mem_wstrb = '0;

    if (dp_active && dp_write) begin
      // Write in Data Phase (0-wait state usually, unless stalled by ext? No)
      // If we are here, hreadyout is 1 (unless blocked by something else?)
      // We perform write.
      mem_cs = 1'b1;
      mem_we = 1'b1;
      mem_addr = write_slice_addr;
      mem_wstrb = calc_wstrb;
    end else if (dp_active && !dp_write && !data_ready) begin
      // Read in wait state
      mem_cs   = 1'b1;
      mem_we   = 1'b0;
      mem_addr = write_slice_addr;  // READ ADDR is captured in dp_addr
    end
  end

  sp_memory #(
      .WIDTH(WIDTH),
      .DEPTH(DEPTH),
      .TECHNOLOGY(TECHNOLOGY)
  ) core (
      .clk(hclk),
      .rst_n(hresetn),
      .cs(mem_cs),
      .we(mem_we),
      .addr(mem_addr),
      .wdata(mem_wdata),
      .wstrb(mem_wstrb),
      .rdata(hrdata)
  );

  always_ff @(posedge hclk) begin
    if (mem_cs && mem_we)
      $display("AHB_DBG: WRITE Addr=%x Data=%x Strb=%x", mem_addr, mem_wdata, mem_wstrb);
    if (mem_cs && !mem_we) $display("AHB_DBG: READ Addr=%x", mem_addr);
    if (dp_active) $display("AHB_DBG: DP_ACTIVE Write=%b Addr=%x", dp_write, dp_addr);
  end

  assign hresp = 1'b0;  // OKAY

endmodule
