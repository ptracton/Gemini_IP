`ifndef UART_FEATURES_TEST_SV
`define UART_FEATURES_TEST_SV


class uart_features_test extends uart_base_test;
  `uvm_component_utils(uart_features_test)

  uart_directed_seq m_seq;

  function new(string name = "uart_features_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    bit [31:0] rdata;
    phase.raise_objection(this);
    `uvm_info("TEST", "Starting Features Test (Auto-Baud, Parity, IrDA)...", UVM_LOW)

    // -------------------------------------------------------------------------
    // 1. Auto-Baud Detection Test
    // -------------------------------------------------------------------------
    `uvm_info("TEST", "Phase 1: Auto-Baud", UVM_LOW)
    // Enable Auto-Baud (ABCR = 1)
    apb_write(32'h20, 32'h00000001);

    // Manually drive RXD to simulate start bit (Low)
    // Assuming 100MHz clock. 
    // Target Baud 9600 -> ~10416 clocks.
    // Drive Low
    m_uart_cfg.vif.drv_cb.rxd <= 1'b0;
    repeat (10416) @(m_uart_cfg.vif.drv_cb);
    // Drive High (End of measurement)
    m_uart_cfg.vif.drv_cb.rxd <= 1'b1;
    repeat (100) @(m_uart_cfg.vif.drv_cb);

    // Check Status (Done bit in ABCR or SR?)
    // ABCR[1] is Done.
    apb_read(32'h20, rdata);
    if (rdata[1]) begin
      `uvm_info("TEST", "Auto-Baud Measurement Done", UVM_LOW)
    end else begin
      `uvm_error("TEST", $sformatf("Auto-Baud Not Done. ABCR: 0x%0h", rdata))
    end

    // Disable Auto-Baud
    apb_write(32'h20, 32'h00000000);

    // -------------------------------------------------------------------------
    // 2. Parity Error Test
    // -------------------------------------------------------------------------
    `uvm_info("TEST", "Phase 2: Parity Error", UVM_LOW)
    // Configure DUT: Enable RX, Odd Parity
    // CR: RX_EN(2) | PARITY_EN(Bit 7:6=01 Odd, Bit 6=1?)
    // RTL: parity_cfg = reg_cr[7:6].
    // 00=None. 01=Odd. 10=Even. 
    // Wait, RTL logic: (parity_cfg[1]) checks enabled. 
    // (stick_parity ? ... : ... ^ parity_cfg[0])
    // If parity_cfg[0] is 1, it negates XOR?
    // Let's set Parity Enable (Bit 7=0, Bit 6=1? No, usually MSB is enable?)
    // RTL line 392: if (parity_cfg[1]) -> So bit 7 is Enable.
    // parity_cfg = reg_cr[7:6]. So Bit 7 must be 1.
    // 10 = Even? 11 = Odd?
    // Line 139: assign parity_cfg = reg_cr[7:6];
    // Line 395: ... ^ parity_cfg[0] ...
    // If 10 (Bit7=1, Bit6=0): parity_cfg[0]=0. ^data ^ 0 = ^data (Even parity?)
    // If 11 (Bit7=1, Bit6=1): parity_cfg[0]=1. ^data ^ 1 = ~^data (Odd parity?)

    // Enable Parity (Odd -> 11 -> Bit 7,6 = 1)
    // RX Enable (Bit 1)
    apb_write(32'h08, 32'h000000C2);

    // Configure Agent
    m_uart_cfg.parity_en = 1;
    m_uart_cfg.even_parity = 0;  // Odd

    // Correct Frame
    m_seq = uart_directed_seq::type_id::create("m_seq");
    if (!m_seq.randomize() with {inject_error == 0;}) `uvm_fatal("RND", "Fail")
    m_seq.start(m_env.m_uart_agent.sequencer);

    // Check SR (0x04). Bit 6 is Parity Error. Should be 0.
    apb_read(32'h04, rdata);
    if (rdata[6]) `uvm_error("TEST", "Unexpected Parity Error")

    // Error Frame
    if (!m_seq.randomize() with {inject_error == 1;}) `uvm_fatal("RND", "Fail")
    m_seq.start(m_env.m_uart_agent.sequencer);

    // Check SR. Bit 6 should be 1.
    // Note: status bits might be W1C.
    apb_read(32'h04, rdata);
    if (!rdata[6]) `uvm_error("TEST", "Missed Parity Error")
    else `uvm_info("TEST", "Detected Parity Error", UVM_LOW)

    // Clear Error (Write 1 to clear in ISR? Or SR is read-only status?)
    // RTL Line 264: reg_isr <= reg_isr & ~reg_wdata (W1C for ISR).
    // SR (Line 300) = reg_sr. 
    // reg_sr (Line 162) = parity_err_internal.
    // parity_err_internal is updated every frame DONE.
    // So next good frame clears it?
    // RTL Line 472: parity_err_internal <= 1'b0; (If disabled)
    // Line 468: parity_err_internal <= ... (On DONE).
    // So sending a good frame should clear it.

    // -------------------------------------------------------------------------
    // 3. IrDA Pulse Generation
    // -------------------------------------------------------------------------
    `uvm_info("TEST", "Phase 3: IrDA Generation", UVM_LOW)
    // Enable IrDA (Bit 14) + Loopback (Bit 9) + RX/TX (Bit 1,0)
    // CR = 0x4203
    apb_write(32'h08, 32'h00004203);

    // Send Data via APB (TX)
    // This will exercise the TX IrDA pulse logic
    apb_write(32'h00, 32'h55);
    #200us;

    phase.drop_objection(this);
    `uvm_info("TEST", "Features Test Complete", UVM_LOW)
  endtask

endclass

`endif
