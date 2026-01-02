class uart_driver extends uvm_driver #(uart_seq_item);

  `uvm_component_utils(uart_driver)

  virtual uart_if vif;
  uart_agent_config m_cfg;
  int bit_period_clks;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  task run_phase(uvm_phase phase);
    // Default state
    vif.drv_cb.rxd   <= 1'b1;
    vif.drv_cb.cts_n <= 1'b0;  // Clear to Send

    // Calculate bit period
    bit_period_clks = m_cfg.clock_freq / m_cfg.baud_rate;

    forever begin
      seq_item_port.get_next_item(req);
      drive_frame(req);
      seq_item_port.item_done();
    end
  endtask

  task drive_frame(uart_seq_item item);
    int i;
    logic [7:0] data = item.data;

    // Start Bit
    vif.drv_cb.rxd <= 1'b0;
    repeat (bit_period_clks) @(vif.drv_cb);

    // Data Bits (LSB First)
    for (i = 0; i < 8; i++) begin
      vif.drv_cb.rxd <= data[i];
      repeat (bit_period_clks) @(vif.drv_cb);
    end

    // Parity (Optional - Simple implementation for now)
    if (m_cfg.parity_en) begin
      logic p_bit;
      p_bit = ^data;
      if (m_cfg.even_parity) p_bit = ~p_bit;  // Even parity logic? 
      // Odd: ^data returns 1 if odd number of 1s. To make total 1s odd, we add 0. 
      // Even: ^data returns 1 if odd number of 1s. To make total 1s even, we add 1.
      // Wait, standard:
      // Even parity: parity bit ensures even number of 1s.
      // if ^data is 1 (odd), parity bit is 1 -> total even.
      // if ^data is 0 (even), parity bit is 0 -> total even.
      // So for Even Parity, p_bit = ^data.

      // Odd parity: parity bit ensures odd number of 1s.
      // if ^data is 1 (odd), parity bit is 0 -> total odd.
      // if ^data is 0 (even), parity bit is 1 -> total odd.
      // So for Odd Parity, p_bit = ~^data.

      if (m_cfg.even_parity) p_bit = ^data;
      else p_bit = ~^data;

      // Error Injection
      if (item.error_parity) p_bit = ~p_bit;

      vif.drv_cb.rxd <= p_bit;
      repeat (bit_period_clks) @(vif.drv_cb);
    end

    // Stop Bit
    vif.drv_cb.rxd <= 1'b1;
    repeat (bit_period_clks) @(vif.drv_cb);

    // Inter-frame delay
    repeat (item.delay * bit_period_clks) @(vif.drv_cb);

  endtask

endclass : uart_driver
