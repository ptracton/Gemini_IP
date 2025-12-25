/*
 * File: bus_matrix_env.sv
 * Description: Bus Matrix UVM Environment
 */

class bus_matrix_env extends uvm_env;
    `uvm_component_utils(bus_matrix_env)

    // Agents
    axi_agent m_axi_agent; // Master 0
    ahb_agent m_ahb_agent; // Master 1
    wb_agent  m_wb_agent;  // Master 2 (example)
    
    // Slaves (simplified, using generic or specific agents)
    axi_agent s_axi_agent; // Slave 0
    wb_agent  s_wb_agent;  // Slave 1

    bus_matrix_scoreboard scbd;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        // Creation of Agents
        // In a real generic env, this would be loop based on N_MASTERS and types
        m_axi_agent = axi_agent::type_id::create("m_axi_agent", this);
        m_ahb_agent = ahb_agent::type_id::create("m_ahb_agent", this);
        m_wb_agent  = wb_agent::type_id::create("m_wb_agent", this);
        
        // s_axi_agent = axi_agent::type_id::create("s_axi_agent", this);
        // s_wb_agent  = wb_agent::type_id::create("s_wb_agent", this);
        
        scbd = bus_matrix_scoreboard::type_id::create("scbd", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        // Connect Monitors to Scoreboard
        // m_axi_agent.monitor.item_collected_port.connect(scbd.item_collected_export);
        // ...
    endfunction

endclass
