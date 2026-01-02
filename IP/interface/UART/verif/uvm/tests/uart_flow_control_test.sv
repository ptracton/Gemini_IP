`ifndef UART_FLOW_CONTROL_TEST_SV
`define UART_FLOW_CONTROL_TEST_SV

class uart_flow_control_test extends uart_base_test;
  `uvm_component_utils(uart_flow_control_test)

  function new(string name = "uart_flow_control_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    bit [31:0] rdata;
    phase.raise_objection(this);
    `uvm_info("TEST", "Starting Flow Control Test (RTS/CTS)...", UVM_LOW)

    // -------------------------------------------------------------------------
    // 1. Manual RTS Control
    // -------------------------------------------------------------------------
    `uvm_info("TEST", "Phase 1: Manual RTS Control", UVM_LOW)
    // CR[10] = rts_ctrl_bit. 
    // Usually, writing 1 to RTS bit drives rts_n Low (Active)
    apb_write(32'h08, 32'h00000403);  // Bit 10=1, RX/TX enabled
    repeat (10) @(m_uart_cfg.vif.mon_cb);
    if (m_uart_cfg.vif.mon_cb.rts_n !== 1'b0) `uvm_error("TEST", "RTS_N not driven Low by CR[10]=1")

    apb_write(32'h08, 32'h00000003);  // Bit 10=0
    repeat (10) @(m_uart_cfg.vif.mon_cb);
    if (m_uart_cfg.vif.mon_cb.rts_n !== 1'b1)
      `uvm_error("TEST", "RTS_N not driven High by CR[10]=0")

    // -------------------------------------------------------------------------
    // 2. Auto-RTS (Based on RX FIFO Fill Level)
    // -------------------------------------------------------------------------
    `uvm_info("TEST", "Phase 2: Auto-RTS", UVM_LOW)
    // Enable Auto-RTS (CR[11]=1)
    apb_write(32'h08, 32'h00000803);

    // Fill RX FIFO. Depth is 16.
    // Drive 17 frames. 
    repeat (17) begin
      drive_uart_rx(8'hA5);
    end

    // Check RTS_N. Should go High (Busy) when FIFO is full or near full.
    // RTL implementation usually deasserts RTS when FIFO is full.
    if (m_uart_cfg.vif.mon_cb.rts_n !== 1'b1) begin
      `uvm_error("TEST", "Auto-RTS failed to deassert RTS_N when FIFO is full")
    end else begin
      `uvm_info("TEST", "Auto-RTS deasserted RTS_N successfully", UVM_LOW)
    end

    // Drain FIFO
    repeat (16) begin
      apb_read(32'h00, rdata);
    end

    // RTS_N should go Low again
    repeat (100) @(m_uart_cfg.vif.mon_cb);
    if (m_uart_cfg.vif.mon_cb.rts_n !== 1'b0)
      `uvm_error("TEST", "Auto-RTS failed to re-assert RTS_N after drain")

    // -------------------------------------------------------------------------
    // 3. Auto-CTS (Throttling Transmission)
    // -------------------------------------------------------------------------
    `uvm_info("TEST", "Phase 3: Auto-CTS", UVM_LOW)
    // Enable Auto-CTS (CR[12]=1)
    apb_write(32'h08, 32'h00001003);

    // Drive CTS_N High (Wait/Not Clear to Send)
    m_uart_cfg.vif.drv_cb.cts_n <= 1'b1;
    repeat (10) @(m_uart_cfg.vif.drv_cb);

    // Send data via APB (TX)
    apb_write(32'h00, 32'h55);

    // Verify TXD remains IDLE (1) for a while
    repeat (500) @(m_uart_cfg.vif.mon_cb);
    if (m_uart_cfg.vif.mon_cb.txd !== 1'b1) `uvm_error("TEST", "TX started while CTS_N was High!")

    // Now drive CTS_N Low (Clear to Send)
    m_uart_cfg.vif.drv_cb.cts_n <= 1'b0;

    // Wait for TX to start (Start Bit Low)
    fork
      begin
        wait (m_uart_cfg.vif.mon_cb.txd === 1'b0);
        `uvm_info("TEST", "TX started after CTS_N went Low", UVM_LOW)
      end
      begin
        #1ms;
        `uvm_error("TEST", "Timeout waiting for TX to start after CTS Low")
      end
    join_any
    disable fork;

    phase.drop_objection(this);
    `uvm_info("TEST", "Flow Control Test Complete", UVM_LOW)
  endtask

  // Helper to drive a single frame
  task drive_uart_rx(input [7:0] data);
    uart_directed_seq drv_seq = uart_directed_seq::type_id::create("drv_seq");
    if (!drv_seq.randomize() with {
          inject_error == 0;
          use_forced_data == 1;
        })
      `uvm_fatal("RND", "Fail")
    drv_seq.data = data;  // Assign directly to avoid XSim 'local::' issue
    drv_seq.start(m_env.m_uart_agent.sequencer);
  endtask

endclass

`endif
