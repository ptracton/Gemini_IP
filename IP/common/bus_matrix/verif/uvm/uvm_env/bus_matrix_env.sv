/*
 * File: bus_matrix_env.sv
 * Description: Bus Matrix UVM Environment (Multi-Agent)
 */

class bus_matrix_env extends uvm_env;
  `uvm_component_utils(bus_matrix_env)

  // Master Agents
  axi_agent m_axi_agent_0;
  axi_agent m_axi_agent_1;
  ahb_agent m_ahb_agent_0;
  ahb_agent m_ahb_agent_1;
  wb_agent m_wb_agent_0;
  wb_agent m_wb_agent_1;

  // Slave Agents
  ahb_agent s_ahb_agent_0;
  ahb_agent s_ahb_agent_1;
  axi_agent s_axi_agent_0;
  axi_agent s_axi_agent_1;
  wb_agent s_wb_agent_0;
  wb_agent s_wb_agent_1;

  bus_matrix_scoreboard scbd;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Master Agents
    m_axi_agent_0 = axi_agent::type_id::create("m_axi_agent_0", this);
    m_axi_agent_1 = axi_agent::type_id::create("m_axi_agent_1", this);
    m_ahb_agent_0 = ahb_agent::type_id::create("m_ahb_agent_0", this);
    m_ahb_agent_1 = ahb_agent::type_id::create("m_ahb_agent_1", this);
    m_wb_agent_0 = wb_agent::type_id::create("m_wb_agent_0", this);
    m_wb_agent_1 = wb_agent::type_id::create("m_wb_agent_1", this);

    // Slave Agents
    s_ahb_agent_0 = ahb_agent::type_id::create("s_ahb_agent_0", this);
    s_ahb_agent_1 = ahb_agent::type_id::create("s_ahb_agent_1", this);
    s_axi_agent_0 = axi_agent::type_id::create("s_axi_agent_0", this);
    s_axi_agent_1 = axi_agent::type_id::create("s_axi_agent_1", this);
    s_wb_agent_0 = wb_agent::type_id::create("s_wb_agent_0", this);
    s_wb_agent_1 = wb_agent::type_id::create("s_wb_agent_1", this);

    // Configure Slaves (Passive or dedicated responder sequences needed)
    // For now, they will just provide READY=1 if we run a responder sequence.

    scbd = bus_matrix_scoreboard::type_id::create("scbd", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    // Connect Monitors to Scoreboard
  endfunction

endclass
