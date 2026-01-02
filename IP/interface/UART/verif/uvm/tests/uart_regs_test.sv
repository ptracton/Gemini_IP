`ifndef UART_REGS_TEST_SV
`define UART_REGS_TEST_SV

class uart_regs_test extends uart_base_test;
  `uvm_component_utils(uart_regs_test)

  function new(string name = "uart_regs_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    bit [31:0] rdata;
    phase.raise_objection(this);
    `uvm_info("TEST", "Starting Register Test...", UVM_LOW)

    // 1. Control Register (CR) at 0x08
    // Write 0xA5A5A5A5, Expect Readback 0xA5A5A5A5 (Assuming full 32-bit R/W)
    apb_write(32'h08, 32'hA5A5A5A5);
    apb_read(32'h08, rdata);
    if (rdata !== 32'hA5A5A5A5) begin
      `uvm_error("TEST", $sformatf("CR Register Mismatch. Expected: 0xA5A5A5A5, Got: 0x%0h", rdata))
    end else begin
      `uvm_info("TEST", "CR Register Match", UVM_MEDIUM)
    end

    // 2. Baud Rate Divisor (BAUD) at 0x0C
    apb_write(32'h0C, 32'h12345678);
    apb_read(32'h0C, rdata);
    if (rdata !== 32'h12345678) begin
      `uvm_error("TEST", $sformatf("BAUD Register Mismatch. Expected: 0x12345678, Got: 0x%0h",
                                   rdata))
    end else begin
      `uvm_info("TEST", "BAUD Register Match", UVM_MEDIUM)
    end

    // 3. FIFO Control (FCR) at 0x18
    // Note: FCR flush bits [1:0] are self-clearing. Bits [11:0] are usually read back.
    // Let's write various bits.
    apb_write(32'h18, 32'h00000FFC);  // Avoid flushing for now
    apb_read(32'h18, rdata);
    // RTL line 305: reg_rdata = {20'h0, fcr_read_bits}; fcr_read_bits = reg_fcr[11:0];
    if ((rdata & 32'hFFF) !== 32'hFFC) begin
      `uvm_error("TEST", $sformatf("FCR Register Mismatch. Expected: 0xFFC, Got: 0x%0h",
                                   rdata & 32'hFFF))
    end else begin
      `uvm_info("TEST", "FCR Register Match", UVM_MEDIUM)
    end

    phase.drop_objection(this);
    `uvm_info("TEST", "Register Test Complete", UVM_LOW)
  endtask

endclass

`endif
