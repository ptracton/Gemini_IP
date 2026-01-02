`ifndef UART_MODES_TEST_SV
`define UART_MODES_TEST_SV

class uart_modes_test extends uart_base_test;
  `uvm_component_utils(uart_modes_test)

  function new(string name = "uart_modes_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_info("TEST", "Starting Modes/Toggle Test...", UVM_LOW)

    // 1. Toggle Control Register (CR) Modes
    // Bit 15: Stick Parity
    // Bit 14: IrDA
    // Bit 13: RS485
    // Bit 12: Auto-CTS
    // Bit 11: Auto-RTS
    // Bit 10: RTS Ctrl
    // Bit 9: Loopback
    // Bit 8: FIFO En
    // Bit 7-6: Parity (00=None, 01=Odd, 10=Even, 11=Mark/Space)
    // Bit 5-4: Stop Bits (00=1, 01=1.5/2)

    // Walk through bits
    apb_write(32'h08, 32'hFFFFFFFF);  // All 1s
    apb_write(32'h08, 32'h00000000);  // All 0s
    apb_write(32'h08, 32'hAAAAAAAA);  // Checkerboard 1
    apb_write(32'h08, 32'h55555555);  // Checkerboard 2

    // 2. Toggle DMA Control (DCR)
    apb_write(32'h1C, 32'h00000003);  // Enable DMA TX/RX
    apb_write(32'h1C, 32'h00000000);  // Disable

    // 3. Toggle FIFO Control (FCR) - Interrupt Levels
    // Bits 11-0 are thresholds or read bits?
    // Check RTL: reg_fcr[11:0] assigned to fcr_read_bits/thresholds likely.
    apb_write(32'h18, 32'h00000FFF);
    apb_write(32'h18, 32'h00000000);

    // 4. Toggle Auto-Baud (ABCR)
    apb_write(32'h20, 32'h00000001);  // Start
    apb_write(32'h20, 32'h00000000);  // Stop

    // 5. Toggle Baud Fractional
    apb_write(32'h0C, 32'h00FF0001);  // Max fractional

    phase.drop_objection(this);
    `uvm_info("TEST", "Modes Test Complete", UVM_LOW)
  endtask

endclass

`endif
