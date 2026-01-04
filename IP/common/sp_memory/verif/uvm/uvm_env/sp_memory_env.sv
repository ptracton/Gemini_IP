/*
 * File: sp_memory_env.sv
 * Description: SP Memory UVM Environment
 */

class sp_memory_env extends uvm_env;
  `uvm_component_utils(sp_memory_env)

  apb_agent            m_apb_agent;
  axi_agent            m_axi_agent;
  wb_agent             m_wb_agent;
  ahb_agent            m_ahb_agent;

  sp_memory_agent      m_mem_agent;  // Sideband

  sp_memory_scoreboard m_scoreboard;

  string               bus_type                  = "AXI";

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    string bus_type_arg;
    super.build_phase(phase);

    // Check command line first
    if ($value$plusargs("BUS_TYPE=%s", bus_type_arg)) begin
      bus_type = bus_type_arg;
    end else begin
      void'(uvm_config_db#(string)::get(this, "", "bus_type", bus_type));
    end

    `uvm_info("ENV", $sformatf("Building Environment for BUS_TYPE: %s", bus_type), UVM_LOW);

    // Always build the memory sideband agent and scoreboard
    m_mem_agent  = sp_memory_agent::type_id::create("m_mem_agent", this);
    m_scoreboard = sp_memory_scoreboard::type_id::create("m_scoreboard", this);

    // Conditional Agent Build
    case (bus_type)
      "APB": m_apb_agent = apb_agent::type_id::create("m_apb_agent", this);
      "AXI": m_axi_agent = axi_agent::type_id::create("m_axi_agent", this);
      "WB": m_wb_agent = wb_agent::type_id::create("m_wb_agent", this);
      "AHB": m_ahb_agent = ahb_agent::type_id::create("m_ahb_agent", this);
      default: `uvm_fatal("ENV", $sformatf("Unknown BUS_TYPE: %s", bus_type))
    endcase

  endfunction

  function void connect_phase(uvm_phase phase);
    // Connect Sideband Agent
    m_mem_agent.monitor.item_collected_port.connect(m_scoreboard.mem_export);

    // Connect Bus Agent
    if (m_apb_agent) m_apb_agent.monitor.item_collected_port.connect(m_scoreboard.apb_export);
    if (m_axi_agent) m_axi_agent.monitor.item_collected_port.connect(m_scoreboard.axi_export);
    if (m_wb_agent) m_wb_agent.monitor.item_collected_port.connect(m_scoreboard.wb_export);
    if (m_ahb_agent) m_ahb_agent.monitor.item_collected_port.connect(m_scoreboard.ahb_export);
  endfunction

endclass
