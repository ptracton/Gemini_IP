`timescale 1ns / 1ps

// -----------------------------------------------------------------------------
// Module Name: spi_async_fifo
// Description:
//    Asynchronous FIFO for Clock Domain Crossing (CDC) between the SPI domain
//    and the System Bus domain. Uses Gray Code pointers for safe synchronization.
//
// Author: Gemini-3 AI
// -----------------------------------------------------------------------------

module spi_async_fifo #(
    parameter DATA_WIDTH = 32,  // Width of data to be stored
    parameter ADDR_WIDTH = 4    // Depth = 2^ADDR_WIDTH (Default 16)
) (
    // Write Domain Interfaces
    input  logic                  wclk,    // Write Clock
    input  logic                  wrst_n,  // Write Reset (Active Low)
    input  logic                  winc,    // Write Increment (Enable)
    input  logic [DATA_WIDTH-1:0] wdata,   // Write Data
    output logic                  wfull,   // Write Full Flag

    // Read Domain Interfaces
    input  logic                  rclk,    // Read Clock
    input  logic                  rrst_n,  // Read Reset (Active Low)
    input  logic                  rinc,    // Read Increment (Enable)
    output logic [DATA_WIDTH-1:0] rdata,   // Read Data
    output logic                  rempty   // Read Empty Flag
);

  // Memory Storage
  localparam DEPTH = 1 << ADDR_WIDTH;
  logic [DATA_WIDTH-1:0] mem[0:DEPTH-1];  // Dual-port memory array

  // Simulation Initialization
`ifdef SIMULATION
  initial begin
    for (int i = 0; i < DEPTH; i++) begin
      mem[i] = '0;
    end
  end
`endif

  // Pointers (Binary and Gray Code)
  logic [ADDR_WIDTH:0] wptr_bin, wptr_gray, wptr_gray_r1, wptr_gray_r2;
  logic [ADDR_WIDTH:0] rptr_bin, rptr_gray, rptr_gray_r1, rptr_gray_r2;
  logic [ADDR_WIDTH:0] wptr_bin_next, wptr_gray_next;
  logic [ADDR_WIDTH:0] rptr_bin_next, rptr_gray_next;

  // -------------------------------------------------------------------------
  // Write Domain Logic
  // -------------------------------------------------------------------------

  // Synchronize Read Pointer to Write Domain (2-stage synchronizer)
  always_ff @(posedge wclk or negedge wrst_n) begin
    if (!wrst_n) begin
      rptr_gray_r1 <= '0;  // Reset Stage 1
      rptr_gray_r2 <= '0;  // Reset Stage 2
    end else begin
      rptr_gray_r1 <= rptr_gray;  // Sample Read Pointer Gray
      rptr_gray_r2 <= rptr_gray_r1;  // Stable Synced Value
    end
  end

  // Calculate Next Write Pointers
  assign wptr_bin_next  = wptr_bin + (winc & ~wfull);
  assign wptr_gray_next = (wptr_bin_next >> 1) ^ wptr_bin_next;  // Binary to Gray

  // Update Write Pointers and Write to Memory
  always_ff @(posedge wclk or negedge wrst_n) begin
    if (!wrst_n) begin
      wptr_bin  <= '0;
      wptr_gray <= '0;
    end else begin
      if (winc && !wfull) begin
        mem[wptr_bin[ADDR_WIDTH-1:0]] <= wdata;
      end
      wptr_bin  <= wptr_bin_next;
      wptr_gray <= wptr_gray_next;
    end
  end

  // Full Flag Generation (Combinational check against synchronized read pointer)
  // Full condition: Current Gray Write Ptr == inverted upper 2 bits of Synced Read Ptr
  assign wfull = (wptr_gray == {~rptr_gray_r2[ADDR_WIDTH:ADDR_WIDTH-1], rptr_gray_r2[ADDR_WIDTH-2:0]});

  // -------------------------------------------------------------------------
  // Read Domain Logic
  // -------------------------------------------------------------------------


  // Synchronize Write Pointer to Read Domain (2-stage synchronizer)
  always_ff @(posedge rclk or negedge rrst_n) begin
    if (!rrst_n) begin
      wptr_gray_r1 <= '0;  // Reset Stage 1
      wptr_gray_r2 <= '0;  // Reset Stage 2
    end else begin
      wptr_gray_r1 <= wptr_gray;  // Sample Write Pointer Gray
      wptr_gray_r2 <= wptr_gray_r1;  // Stable Synced Value
    end
  end

  // Calculate Next Read Pointers
  assign rptr_bin_next  = rptr_bin + (rinc & ~rempty);
  assign rptr_gray_next = (rptr_bin_next >> 1) ^ rptr_bin_next;  // Binary to Gray

  // Update Read Pointers
  always_ff @(posedge rclk or negedge rrst_n) begin
    if (!rrst_n) begin
      rptr_bin  <= '0;
      rptr_gray <= '0;
    end else begin
      rptr_bin  <= rptr_bin_next;
      rptr_gray <= rptr_gray_next;
    end
  end

  // Read from Memory (Asynchronous Read / Combo Output)
  assign #1 rdata = mem[rptr_bin[ADDR_WIDTH-1:0]];

  // Empty Flag Generation (Combinational check)
  // Empty condition: Read Gray Ptr == Synced Write Gray Ptr
  assign rempty = (rptr_gray == wptr_gray_r2);

endmodule
