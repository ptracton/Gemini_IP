`timescale 1ns / 1ps

// -----------------------------------------------------------------------------
// Module Name: spi_slave_core
// Description:
//    Core Logic for the SPI Slave IP. Handles the SPI Protocol (CPOL=0, CPHA=0),
//    Clock Domain Crossing (CDC) via Async FIFOs, and implements the System
//    Master FSM to drive internal buses (Wishbone/AXI/AHB) based on SPI commands.
//    Supports Single, Burst, Read, and Write operations with dynamic data sizes.
//
// Author: Gemini-3 AI
// -----------------------------------------------------------------------------

module spi_slave_core (
    // SPI Interface
    input  logic spi_clk,   // SPI Clock (SCK)
    input  logic spi_cs_n,  // SPI Chip Select (Active Low)
    input  logic spi_mosi,  // SPI Master Out Slave In
    output logic spi_miso,  // SPI Master In Slave Out

    // System Interface
    input logic sys_clk,   // System Clock
    input logic sys_rst_n, // System Reset (Active Low)

    // Generic Bus Master Interface (Sys Domain)
    output logic        bus_req_o,    // Request/Start Transaction
    output logic [31:0] bus_addr_o,   // Target Address
    output logic        bus_we_o,     // Write Enable (1=Write, 0=Read)
    output logic [31:0] bus_wdata_o,  // Write Data
    output logic [ 3:0] bus_be_o,     // Byte Enable (Active High)
    output logic [ 1:0] bus_size_o,   // Transfer Size: 00=Byte, 01=Half, 10=Word
    input  logic        bus_ack_i,    // Acknowledge/Transfer Done
    input  logic [31:0] bus_rdata_i   // Read Data
);

  // ---------------------------------------------------------
  // Parameters & Constants
  // ---------------------------------------------------------
  localparam CTRL_CMD = 2'b10;  // FIFO Tag: Control/Command [33:32]
  localparam CTRL_DATA = 2'b00;  // FIFO Tag: Data [33:32]

  // Command Encoding (Bits [7:6] of SPI Command Byte)
  localparam CMD_READ = 2'b00;  // Single Read
  localparam CMD_WRITE = 2'b01;  // Single Write
  localparam CMD_BURST_READ = 2'b10;  // Burst Read (Auto-increment)
  localparam CMD_BURST_WRITE = 2'b11;  // Burst Write (Auto-increment)

  // ---------------------------------------------------------
  // Signal Declarations
  // ---------------------------------------------------------

  // SPI Domain Signals
  logic [ 7:0] spi_cmd_reg;  // Stores the latest command byte
  logic [31:0] spi_addr_reg;  // Stores the address byte(s)
  logic [31:0] spi_shift_reg;  // Shift register for RX/TX data
  logic [31:0] spi_miso_reg;  // Shift register for MISO data
  logic [31:0] spi_tx_holding_reg;  // Buffer for data pre-fetched from TX FIFO

  logic        spi_tx_valid;  // Indicates valid data in holding register
  logic [ 5:0] bit_cnt;  // Bit counter for serial operations

  // SPI Finite State Machine
  typedef enum logic [2:0] {
    S_IDLE,    // Waiting for CS_n Low
    S_CMD,     // Receiving 8-bit Command
    S_ADDR,    // Receiving 32-bit Address
    S_DUMMY,   // Dummy Cycle (Latency)
    S_DATA_RX, // Receiving Data (Write)
    S_DATA_TX  // Transmitting Data (Read)
  } spi_state_t;

  spi_state_t spi_state;

  // CDC FIFO Signals
  logic rx_fifo_winc, rx_fifo_wfull;
  logic [33:0] rx_fifo_wdata;  // [33:32]=Type, [31:0]=Content
  logic rx_fifo_rinc, rx_fifo_rempty;
  logic [33:0] rx_fifo_rdata;

  logic tx_fifo_winc, tx_fifo_wfull;
  logic [31:0] tx_fifo_wdata;  // System -> SPI Read Data
  logic tx_fifo_rinc, tx_fifo_rempty;
  logic [31:0] tx_fifo_rdata;

  // System Domain Signals
  // System Master FSM
  typedef enum logic [3:0] {
    M_IDLE,              // Waiting for RX FIFO data
    M_GET_ADDR,          // Fetching Address Phase
    M_CHECK_OP,          // Decoding Operation (Read/Write)
    M_WRITE_FETCH_DATA,  // Fetching Data for Write
    M_WRITE_EXEC,        // Executing Bus Write
    M_READ_EXEC,         // Executing Bus Read
    M_NEXT_ADDR          // Incrementing Address for Burst
  } master_state_t;

  master_state_t        m_state;

  // Internal Registers (Sys Domain)
  logic          [ 7:0] sys_cmd;  // Command in Sys Domain
  logic          [31:0] sys_addr;  // Current Address
  logic          [31:0] sys_data_out;  // Data to write to Bus
  logic          [ 1:0] sys_size;  // Cached Size
  logic                 sys_is_burst;  // Cached Burst Flag

  // Helper/Status signals
  logic          [ 3:0] bus_be_comb;  // Combo byte enable
  logic                 sys_state_write;  // Helper for bus_we_o

  // Reset syncing
  logic spi_rst_n_sync_0, spi_rst_n_sync_1;

  // Synchronize sys_rst_n to spi_clk domain
  always_ff @(posedge spi_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
      spi_rst_n_sync_0 <= 1'b0;
      spi_rst_n_sync_1 <= 1'b0;
    end else begin
      spi_rst_n_sync_0 <= 1'b1;
      spi_rst_n_sync_1 <= spi_rst_n_sync_0;
    end
  end

  // ---------------------------------------------------------
  // Modules
  // ---------------------------------------------------------

  // ---------------------------------------------------------
  // RX FIFO (SPI -> Sys)
  // ---------------------------------------------------------
  // Reset FIFO using System Reset (Synced), NOT CS_n.
  // CS_n demarcates transactions but shouldn't break FIFO pointers.
  spi_async_fifo #(
      .DATA_WIDTH(34),
      .ADDR_WIDTH(4)
  ) u_rx_fifo (
      .wclk  (spi_clk),
      .wrst_n(spi_rst_n_sync_1),
      .winc  (rx_fifo_winc),
      .wdata (rx_fifo_wdata),
      .wfull (rx_fifo_wfull),
      .rclk  (sys_clk),
      .rrst_n(sys_rst_n),
      .rinc  (rx_fifo_rinc),
      .rdata (rx_fifo_rdata),
      .rempty(rx_fifo_rempty)
  );

  // ---------------------------------------------------------
  // TX FIFO (Sys -> SPI)
  // ---------------------------------------------------------
  spi_async_fifo #(
      .DATA_WIDTH(32),
      .ADDR_WIDTH(4)
  ) u_tx_fifo (
      .wclk  (sys_clk),
      .wrst_n(sys_rst_n),
      .winc  (tx_fifo_winc),
      .wdata (tx_fifo_wdata),
      .wfull (tx_fifo_wfull),
      .rclk  (spi_clk),
      .rrst_n(spi_rst_n_sync_1),
      .rinc  (tx_fifo_rinc),
      .rdata (tx_fifo_rdata),
      .rempty(tx_fifo_rempty)
  );

  // ---------------------------------------------------------
  // SPI Domain Logic
  // ---------------------------------------------------------

  // Function: Calculate bit count limit based on data size (Byte/Half/Word)
  function automatic logic [5:0] get_limit(logic [1:0] sz);
    case (sz)
      2'b00:   return 6'd7;  // 8 bits
      2'b01:   return 6'd15;  // 16 bits
      2'b10:   return 6'd31;  // 32 bits
      default: return 6'd31;
    endcase
  endfunction

  // Helper for capture latency
  logic tx_fifo_rinc_d;
  logic tx_fifo_rinc_d1;
  logic data_loaded;


  // SPI Clock Process
  always_ff @(posedge spi_clk or posedge spi_cs_n) begin
    if (spi_cs_n) begin
      // Asynchronous Reset on CS_n High (Inactive)
      spi_state          <= S_IDLE;
      bit_cnt            <= '0;
      rx_fifo_winc       <= 1'b0;
      rx_fifo_wdata      <= '0;
      tx_fifo_rinc       <= 1'b0;
      spi_cmd_reg        <= '0;
      spi_addr_reg       <= '0;
      spi_shift_reg      <= '0;
      spi_tx_holding_reg <= '0;
      spi_tx_valid       <= 1'b0;
      tx_fifo_rinc_d     <= 1'b0;
    end else begin
      // Default Control Signals
      rx_fifo_winc <= 1'b0;
      tx_fifo_rinc <= 1'b0;
      data_loaded  <= 1'b0;  // Default


      // TX FIFO Capture Logic
      if (tx_fifo_rinc) begin
        spi_tx_holding_reg <= tx_fifo_rdata;
        spi_tx_valid       <= 1'b1;
      end

      // tx_fifo_rinc_d logic removed 


      // Main SPI State Machine
      case (spi_state)
        S_IDLE: begin
          spi_state   <= S_CMD;
          bit_cnt     <= 0;
          spi_cmd_reg <= {spi_cmd_reg[6:0], spi_mosi};  // Sample first bit
        end

        S_CMD: begin
          // Shift in Command Byte
          spi_cmd_reg <= {spi_cmd_reg[6:0], spi_mosi};
          if (bit_cnt == 7) begin
            spi_state <= S_ADDR;
            bit_cnt <= 0;
            // Push Command to Notification FIFO (Must include current MOSI bit!)
            rx_fifo_wdata <= {CTRL_CMD, 24'b0, spi_cmd_reg[6:0], spi_mosi};
            rx_fifo_winc <= 1'b1;
          end else begin
            bit_cnt <= bit_cnt + 1;
          end
        end

        S_ADDR: begin
          // Shift in Address (32-bit)
          spi_addr_reg <= {spi_addr_reg[30:0], spi_mosi};
          if (bit_cnt == 31) begin
            bit_cnt <= 0;
            // Push ADDR Tag to Notification FIFO
            rx_fifo_wdata <= {CTRL_CMD, spi_addr_reg[30:0], spi_mosi};
            rx_fifo_winc <= 1'b1;

            // Decode Next State based on OpCode [6] (0=Read, 1=Write)
            if (spi_cmd_reg[6]) begin
              spi_state <= S_DATA_RX;  // Write Mode
            end else begin
              spi_state <= S_DUMMY;  // Read Mode -> Go to Dummy first
            end
          end else begin
            bit_cnt <= bit_cnt + 1;
          end
        end

        S_DUMMY: begin
          // Wait 32 cycles (4 Bytes)
          // We can also use this time to prefetch from FIFO if ready
          if (!tx_fifo_rempty && !data_loaded && !tx_fifo_rinc && !spi_tx_valid) begin
            tx_fifo_rinc <= 1'b1;
            // Data will be available next cycle to load into MISO reg
          end

          if (bit_cnt == 31) begin
            bit_cnt   <= 0;
            spi_state <= S_DATA_TX;
            if (spi_tx_valid) begin
              spi_miso_reg <= spi_tx_holding_reg;
              spi_tx_valid <= 1'b0;
              data_loaded  <= 1'b1;
            end else if (tx_fifo_rinc) begin
              // Bypass: Data arriving this cycle
              spi_miso_reg <= tx_fifo_rdata;
              data_loaded  <= 1'b1;
            end
          end else begin
            bit_cnt <= bit_cnt + 1;
          end
        end

        S_DATA_RX: begin
          // Write Mode: Shift In Data from MOSI
          spi_shift_reg <= {spi_shift_reg[30:0], spi_mosi};

          if (bit_cnt == get_limit(spi_cmd_reg[5:4])) begin
            bit_cnt <= 0;
            // Push Data to FIFO
            rx_fifo_wdata <= {CTRL_DATA, spi_shift_reg[30:0], spi_mosi};
            rx_fifo_winc <= 1'b1;

            // Check for Single vs Burst
            if (spi_cmd_reg[7] == 0) begin  // Single Write -> Done
              spi_state <= S_IDLE;
            end
            // Else Burst -> Continue in S_DATA_RX
          end else begin
            bit_cnt <= bit_cnt + 1;
          end
        end

        S_DATA_TX: begin
          // Read Mode: Shift Out Data to MISO
          // Check if we need to load data
          if (!tx_fifo_rempty && !spi_tx_valid && !tx_fifo_rinc) begin
            tx_fifo_rinc <= 1'b1;
          end

          // Shift Out
          spi_miso_reg <= {spi_miso_reg[30:0], 1'b0};
          // $display("[RTL] SPI: Shifting MISO. Reg: %x, Out: %b", spi_miso_reg, spi_miso_reg[31]); // Verbose

          if (bit_cnt == get_limit(spi_cmd_reg[5:4])) begin
            bit_cnt <= 0;
            bit_cnt <= 0;
            data_loaded <= 1'b0;  // Ready for next word

            // Allow reload for Burst
            if (spi_tx_valid) begin
              spi_miso_reg <= spi_tx_holding_reg;
              spi_tx_valid <= 1'b0;
              data_loaded  <= 1'b1;
            end else if (tx_fifo_rinc) begin
              // Bypass
              spi_miso_reg <= tx_fifo_rdata;
              data_loaded  <= 1'b1;
            end

            if (spi_cmd_reg[7] == 0) begin  // Single Read -> Done
              spi_state <= S_IDLE;
            end
          end else begin
            bit_cnt <= bit_cnt + 1;
          end
        end
      endcase

    end
  end

  // Buffer Bit Count/Size for MISO (Since size is in posedge domain)
  // Actually we can read spi_cmd_reg in negedge domain (it is stable)

  // MISO Driver (Mode 0: Drive on Falling Edge)
  always_ff @(negedge spi_clk or posedge spi_cs_n) begin
    if (spi_cs_n) begin
      spi_miso <= 1'bZ;
    end else begin
      if (spi_state == S_DATA_TX) begin
        if (spi_cmd_reg[5:4] == 2'b00)  // Byte
          spi_miso <= spi_miso_reg[7];
        else if (spi_cmd_reg[5:4] == 2'b01)  // Half
          spi_miso <= spi_miso_reg[15];
        else  // Word
          spi_miso <= spi_miso_reg[31];
      end else begin
        spi_miso <= 1'b0;  // Or Z? Default low.
      end
    end
  end

  // Capture Loop Block Removed

  // ---------------------------------------------------------
  // System Domain Logic
  // ---------------------------------------------------------

  // Bus Output Assignments
  // Ensure m_state comparisons result in 0/1, not X if m_state is X (though reset should fix that).
  // Using explicit reset check in assignment or just relying on reset.
  assign bus_req_o   = (m_state == M_WRITE_EXEC) || (m_state == M_READ_EXEC);
  assign bus_addr_o  = sys_addr;
  assign bus_we_o    = (m_state == M_WRITE_EXEC);
  assign bus_wdata_o = sys_data_out;
  assign bus_size_o  = sys_size;

  // Helper for Icarus (Constant Select workarounds)
  wire [1:0] rx_fifo_tag;
  assign rx_fifo_tag = rx_fifo_rdata[33:32];

  wire sys_addr_1;
  assign sys_addr_1 = sys_addr[1];

  wire [1:0] sys_addr_low;
  assign sys_addr_low = sys_addr[1:0];

  // Byte Enable Generation (Combinational)
  always_comb begin
    bus_be_o = 4'b0000;
    case (sys_size)
      2'b10:   bus_be_o = 4'b1111;  // Word
      2'b01: begin  // Half
        if (sys_addr_1 == 1'b1) bus_be_o = 4'b1100;
        else bus_be_o = 4'b0011;
      end
      2'b00: begin  // Byte
        case (sys_addr_low)
          2'b00: bus_be_o = 4'b0001;
          2'b01: bus_be_o = 4'b0010;
          2'b10: bus_be_o = 4'b0100;
          2'b11: bus_be_o = 4'b1000;
        endcase
      end
      default: bus_be_o = 4'b0000;
    endcase
  end

  // Combinational Logic for FIFO Controls
  always_comb begin
    rx_fifo_rinc  = 1'b0;
    tx_fifo_winc  = 1'b0;
    tx_fifo_wdata = '0;

    case (m_state)
      M_IDLE: begin
        if (!rx_fifo_rempty) rx_fifo_rinc = 1'b1;
      end
      M_GET_ADDR: begin
        if (!rx_fifo_rempty) rx_fifo_rinc = 1'b1;
      end
      M_WRITE_FETCH_DATA: begin
        if (!rx_fifo_rempty) rx_fifo_rinc = 1'b1;
      end
      M_READ_EXEC: begin
        if (bus_ack_i) begin
          tx_fifo_winc  = 1'b1;
          tx_fifo_wdata = bus_rdata_i;
        end
      end
      M_NEXT_ADDR: begin
        if (!rx_fifo_rempty && rx_fifo_tag == CTRL_CMD) rx_fifo_rinc = 1'b1;
      end
      default: begin
        rx_fifo_rinc  = 1'b0;
        tx_fifo_winc  = 1'b0;
        tx_fifo_wdata = '0;
      end
    endcase
  end

  // Sequential Logic for State and Data
  always_ff @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
      m_state      <= M_IDLE;
      sys_cmd      <= '0;
      sys_addr     <= '0;
      sys_data_out <= '0;
      sys_size     <= '0;
      sys_is_burst <= 1'b0;
    end else begin

      case (m_state)
        M_IDLE: begin
          if (!rx_fifo_rempty) begin
            // rx_fifo_rinc is asserted comb.
            // Capture Command NOW
            sys_cmd      <= rx_fifo_rdata[7:0];
            sys_size     <= rx_fifo_rdata[5:4];
            sys_is_burst <= rx_fifo_rdata[7];
            m_state      <= M_GET_ADDR;
          end
        end

        M_GET_ADDR: begin
          if (!rx_fifo_rempty) begin
            // rx_fifo_rinc is asserted comb.
            // Capture Address NOW
            sys_addr <= rx_fifo_rdata[31:0];
            m_state  <= M_CHECK_OP;
          end
        end

        M_CHECK_OP: begin
          if (sys_cmd[6]) begin  // Write Operation
            m_state <= M_WRITE_FETCH_DATA;
          end else begin  // Read Operation
            m_state <= M_READ_EXEC;
          end
        end

        M_WRITE_FETCH_DATA: begin
          if (!rx_fifo_rempty) begin
            // rx_fifo_rinc is asserted comb.

            if (rx_fifo_rdata[33:32] == CTRL_CMD) begin
              // Abort Burst, Process New Command
              sys_cmd      <= rx_fifo_rdata[7:0];
              sys_size     <= rx_fifo_rdata[5:4];
              sys_is_burst <= rx_fifo_rdata[7];
              m_state      <= M_GET_ADDR;
            end else begin
              // Normal Data
              sys_data_out <= rx_fifo_rdata[31:0];  // Capture Data NOW
              m_state      <= M_WRITE_EXEC;
            end
          end
        end

        M_WRITE_EXEC: begin
          if (bus_ack_i) begin  // Transaction Complete
            if (sys_is_burst) begin
              m_state <= M_NEXT_ADDR;
            end else begin
              m_state <= M_IDLE;
            end
          end
        end

        M_READ_EXEC: begin
          if (bus_ack_i) begin  // Transaction Complete
            // tx_fifo_wdata drove by comb logic
            // tx_fifo_winc is asserted comb.

            if (sys_is_burst) begin
              m_state <= M_NEXT_ADDR;
            end else begin
              m_state <= M_IDLE;
            end
          end
        end

        M_NEXT_ADDR: begin
          if (!rx_fifo_rempty && rx_fifo_tag == CTRL_CMD) begin
            // Abort Burst Loop on New Command
            sys_cmd      <= rx_fifo_rdata[7:0];
            sys_size     <= rx_fifo_rdata[5:4];
            sys_is_burst <= rx_fifo_rdata[7];
            m_state      <= M_GET_ADDR;
          end else begin
            // Continue Burst
            if (sys_cmd[6]) begin  // Was Write?
              sys_addr <= sys_addr + (1 << sys_size);
              m_state  <= M_WRITE_FETCH_DATA;
            end else begin  // Was Read?
              // Only proceed if TX FIFO has space
              if (!tx_fifo_wfull) begin
                sys_addr <= sys_addr + (1 << sys_size);
                m_state  <= M_READ_EXEC;
              end
            end
          end
        end

      endcase

    end
  end

endmodule
