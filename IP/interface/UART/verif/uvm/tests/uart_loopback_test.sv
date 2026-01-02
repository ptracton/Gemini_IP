`ifndef UART_LOOPBACK_TEST_SV
`define UART_LOOPBACK_TEST_SV

class uart_loopback_test extends uart_base_test;
  `uvm_component_utils(uart_loopback_test)

  function new(string name = "uart_loopback_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    bit [31:0] rdata;
    bit [31:0] expected_data;

    phase.raise_objection(this);
    `uvm_info("TEST", "Starting Loopback Test...", UVM_LOW)

    // Enable Loopback Mode via CR (Offset 0x08)
    // Bit 9: Loopback Enable
    // Bit 1: RX Enable
    // Bit 0: TX Enable
    // Value = 0x203 (10_0000_0011)
    apb_write(32'h08, 32'h00000203);
    `uvm_info("TEST", "Loopback Mode Enabled", UVM_MEDIUM)

    // Set Baud Rate (Optional, keeping default)

    // Send Data via DR (Offset 0x00)
    expected_data = 32'h5A;
    `uvm_info("TEST", $sformatf("Writing Data: 0x%0h", expected_data), UVM_MEDIUM)
    apb_write(32'h00, expected_data);

    // Wait for Transmission (Default baud is slow, need delay)
    // 10 bits * baud rate. Sync FIFO is fast, but UART logic is slow.
    // Default 115200ish. 1 char ~ 86us.
    #200us;

    // Check Status Register (0x04) for RX Data Ready (Bit 0)
    apb_read(32'h04, rdata);
    if ((rdata & 1) == 0) begin
      `uvm_error("TEST", "RX FIFO Empty after Loopback Transmission (Timeout)")
    end else begin
      `uvm_info("TEST", "RX Data Ready", UVM_MEDIUM)
    end

    // Read Data from DR
    apb_read(32'h00, rdata);
    // UART Core has 9-bit width.
    if ((rdata & 32'h1FF) !== expected_data) begin
      `uvm_error("TEST", $sformatf("Loopback Data Mismatch. Exp: 0x%0h, Got: 0x%0h", expected_data,
                                   rdata))
    end else begin
      `uvm_info("TEST", "Loopback Data Match", UVM_LOW)
    end

    phase.drop_objection(this);
    `uvm_info("TEST", "Loopback Test Complete", UVM_LOW)
  endtask

endclass

`endif
