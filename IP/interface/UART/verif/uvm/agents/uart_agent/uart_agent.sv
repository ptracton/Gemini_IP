class uart_agent extends uvm_agent;

  `uvm_component_utils(uart_agent)

  uart_driver driver;
  uart_monitor monitor;
  uart_sequencer sequencer;
  uart_agent_config m_cfg;

  uvm_analysis_port #(uart_seq_item) ap_tx;
  uvm_analysis_port #(uart_seq_item) ap_rx;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    ap_tx = new("ap_tx", this);
    ap_rx = new("ap_rx", this);

    if (!uvm_config_db#(uart_agent_config)::get(this, "", "config", m_cfg)) begin
      `uvm_warning("CFG", "UART Agent Config not found, creating default")
      m_cfg = uart_agent_config::type_id::create("m_cfg");
    end

    monitor = uart_monitor::type_id::create("monitor", this);
    monitor.m_cfg = m_cfg;

    if (m_cfg.is_active == UVM_ACTIVE) begin
      driver = uart_driver::type_id::create("driver", this);
      sequencer = uart_sequencer::type_id::create("sequencer", this);
      driver.m_cfg = m_cfg;
    end
  endfunction

  function void connect_phase(uvm_phase phase);
    if (m_cfg.is_active == UVM_ACTIVE) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
      driver.vif = m_cfg.vif;  // Assuming config has interface handle? 
      // Wait, I didn't add vif to uart_agent_config.sv. I should fix that or pass it via DB.
      // Usually DB sets VIF directly to agent, but let's stick to config object pattern.
    end
    monitor.vif = m_cfg.vif;

    monitor.ap_tx.connect(ap_tx);
    monitor.ap_rx.connect(ap_rx);
  endfunction
endclass : uart_agent
