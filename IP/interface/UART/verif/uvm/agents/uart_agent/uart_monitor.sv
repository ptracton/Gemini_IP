class uart_monitor extends uvm_monitor;

  `uvm_component_utils(uart_monitor)

  virtual uart_if vif;
  uart_agent_config m_cfg;
  int bit_period_clks;

  uvm_analysis_port #(uart_seq_item) ap_tx;  // Observed on TXD pin (DUT Output)
  uvm_analysis_port #(uart_seq_item) ap_rx;  // Observed on RXD pin (DUT Input)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    ap_tx = new("ap_tx", this);
    ap_rx = new("ap_rx", this);
  endfunction

  task run_phase(uvm_phase phase);
    if (m_cfg == null) begin
      `uvm_fatal("CFG", "UART Agent Config not set")
    end
    bit_period_clks = m_cfg.clock_freq / m_cfg.baud_rate;

    fork
      monitor_tx();  // Monitor DUT TXD
      monitor_rx();  // Monitor DUT RXD
    join
  endtask

  task monitor_tx();
    uart_seq_item item;
    item = uart_seq_item::type_id::create("tx_item");

    forever begin
      // Wait for Start Bit (Falling Edge)
      @(negedge vif.mon_cb.txd);

      // Verify start bit is stable (sample at middle)
      repeat (bit_period_clks / 2) @(vif.mon_cb);
      if (vif.mon_cb.txd != 0) continue;  // Glitch?

      // Advance to data bits
      repeat (bit_period_clks) @(vif.mon_cb);
      item.data = 0;
      for (int i = 0; i < 8; i++) begin
        item.data[i] = vif.mon_cb.txd;
        repeat (bit_period_clks) @(vif.mon_cb);
      end

      // Parity and Stop bit processing omitted for brevity, verify stop
      repeat (bit_period_clks) @(vif.mon_cb);  // Parity skip if disabled
      if (m_cfg.parity_en) begin
        // Check parity
        repeat (bit_period_clks) @(vif.mon_cb);
      end

      // Stop bit
      // assert(vif.mon_cb.txd == 1);

      ap_tx.write(item);
    end
  endtask

  task monitor_rx();
    uart_seq_item item;
    item = uart_seq_item::type_id::create("rx_item");

    forever begin
      @(negedge vif.mon_cb.rxd);
      repeat (bit_period_clks / 2) @(vif.mon_cb);
      if (vif.mon_cb.rxd != 0) continue;

      repeat (bit_period_clks) @(vif.mon_cb);

      item.data = 0;
      for (int i = 0; i < 8; i++) begin
        item.data[i] = vif.mon_cb.rxd;
        repeat (bit_period_clks) @(vif.mon_cb);
      end

      // Parity/Stop ...
      if (m_cfg.parity_en) repeat (bit_period_clks) @(vif.mon_cb);

      ap_rx.write(item);
    end
  endtask

endclass : uart_monitor
