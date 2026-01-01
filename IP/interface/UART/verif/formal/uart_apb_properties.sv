module uart_apb_properties (
    input logic        pclk,
    input logic        presetn,
    input logic [31:0] paddr,
    input logic        psel,
    input logic        penable,
    input logic        pwrite,
    input logic [31:0] pwdata,
    input logic        pready,
    input logic [31:0] prdata,
    input logic        pslverr
);

  // -------------------------------------------------------------------------
  // APB4 Properties
  // -------------------------------------------------------------------------

  // -------------------------------------------------------------------------
  // APB4 Properties (Slave Side)
  // -------------------------------------------------------------------------

  // We act as a Slave.
  // We assume Master inputs are valid protocol-wise.
  // We verify our outputs: PREADY, PSLVERR, PRDATA.

  always @(posedge pclk) begin
    if (presetn) begin
      // 1. If we are in Access Phase (PSEL && PENABLE), we must eventually respond.
      // In this design, PREADY is likely combinational and immediate.
      if (psel && penable) begin
        // Assert PREADY is high immediately (assuming 0 wait states for this IP)
        assert (pready);
        // 2. Read Data Stability (Validity)
        // If Reading (PSEL && PENABLE && !PWRITE && PREADY)
        // PRDATA must be stable? 
        // Assert that PRDATA is not X if PREADY is high during read.
        // NOTE: prdata is not defined in the module ports. This assertion will cause a syntax error.
        // It should be added as an input to this module for proper verification.
        if (psel && penable && !pwrite && pready) begin
          assert (prdata !== 'x);
        end
      end
    end
  end

  // Explicit reset check
  always @(posedge pclk) begin
    if (!presetn) begin
      // Reset behaviors if any?
      // APB doesn't STRICTLY require PREADY low/high at reset, but usually High or Low.
    end
  end

  always @(posedge pclk) begin
    if (presetn) begin
      // 1. Setup Phase to Access Phase
      // If PSEL is high and PENABLE is low, next cycle PENABLE must be high
      // (Master property usually, but we can check if we hold PREADY low correctly maybe? 
      // Actually, these are mostly MASTER properties. As a slave, we check our response.)

      // Checking Slave Compliance:
      // If PSEL && PENABLE are high, we must eventually drive PREADY high (liveness - difficult in bounded check without assume)
      // But we can check stability.

      // Stability:
      // If PSEL && PENABLE && !PREADY, signals must depend on Master holding them?
      // SymbiYosys verification of a SLAVE usually involves ASSUMING master behavior and ASSERTING slave behavior.

      // Assume Master behaves correctly:
      if (!$past(presetn)) begin
        // Reset behavior
      end else begin
        // If we are in Access Phase (PSEL && PENABLE) and PREADY is Low,
        // Master must hold PSEL, PENABLE, PADDR, PWRITE, PWDATA stable.
        // We should ASSUME this? Or are we verifying the system? 
        // Since this is unit formal, we verify the DUT (Slave).
        // So we should ASSUME master inputs are stable.

        if (psel && penable && !pready) begin
          // assert(psel); // Next cycle
          // assertions on INPUTS are unnecessary unless we are verifying the master.
        end

        // Slave Assertions:
        // 1. PREADY should default to something? No.
        // 2. PSLVERR?
        // 3. PRDATA stability? 
        // If PREADY is low, PRDATA can change? Standard says valid when PREADY High.
      end
    end
  end

  // Let's refine. PROPS should be simple checks.
  // 1. Setup -> Access transition is driven by Master.
  // Slave property: PREADY behavior.

  // For this simple UART, PREADY is pure combinational or registered. 
  // Let's verify that IF we are selected, we basically respond.

  // We can assume basic protocol correctness of inputs to verify functionality.

  // Property: If Access Phase, eventually PREADY high?

  // Property: Data Integrity. If Write, REG gets updated. If Read, REG is read.
  // This connects to the internal registers.

  // Let's stick to simple protocol assumptions/assertions.
  // Inputs: PSEL, PENABLE. 
  // Output: PREADY.

  // Check: PREADY is driven?
  // The UART APB/AXI adapters are pretty simple.

  // Let's verify the same style as AXI: handshake sanity.

  // For APB Slave, we can't assert much about PSEL/PENABLE/PWRITE timing unless we assume Master behavior.
  // But we CAN assert that IF PSEL/PENABLE are met, we do something.

  // A simple sanity check is "If valid read, PREADY goes high"

endmodule
