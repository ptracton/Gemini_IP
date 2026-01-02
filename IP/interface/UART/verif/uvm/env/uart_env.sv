class uart_env extends uvm_env;

  `uvm_component_utils(uart_env)

  uart_env_config m_cfg;

  // Agents
  uart_agent m_uart_agent;
  apb_agent m_apb_agent;
  axi_agent m_axi_agent;
  wb_agent m_wb_agent;

  // Scoreboard
  uart_scoreboard m_scb;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(uart_env_config)::get(this, "", "config", m_cfg)) begin
      `uvm_fatal("CFG", "UART Env Config not found")
    end

    // UART Agent
    m_uart_agent = uart_agent::type_id::create("m_uart_agent", this);
    uvm_config_db#(uart_agent_config)::set(this, "m_uart_agent", "config", m_cfg.uart_cfg);

    // Bus Agent
    if (m_cfg.bus_type == "APB") begin
      m_apb_agent = apb_agent::type_id::create("m_apb_agent", this);
    end else if (m_cfg.bus_type == "AXI") begin
      m_axi_agent = axi_agent::type_id::create("m_axi_agent", this);
    end else if (m_cfg.bus_type == "WB") begin
      m_wb_agent = wb_agent::type_id::create("m_wb_agent", this);
    end

    // Scoreboard
    m_scb = uart_scoreboard::type_id::create("m_scb", this);
    m_scb.bus_type = m_cfg.bus_type;

  endfunction

  function void connect_phase(uvm_phase phase);
    // Connect Monitors to Scoreboard
    m_uart_agent.ap_tx.connect(m_scb.uart_tx_export);
    m_uart_agent.ap_rx.connect(m_scb.uart_rx_export);

    if (m_cfg.bus_type == "APB") begin
      m_apb_agent.monitor.item_collected_port.connect(m_scb.apb_export);
    end else if (m_cfg.bus_type == "AXI") begin
      m_axi_agent.monitor.item_collected_port.connect(m_scb.axi_export);
    end else if (m_cfg.bus_type == "WB") begin
      m_wb_agent.monitor.item_collected_port.connect(m_scb.wb_export);
    end
  endfunction

endclass : uart_env
