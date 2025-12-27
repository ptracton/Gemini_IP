/*
 * File: bridge_env.sv
 * Description: AHB-APB Bridge UVM Environment
 */

class bridge_env extends uvm_env;
    `uvm_component_utils(bridge_env)

    ahb_agent m_ahb_agent;
    apb_agent s_apb_agent;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        m_ahb_agent = ahb_agent::type_id::create("m_ahb_agent", this);
        s_apb_agent = apb_agent::type_id::create("s_apb_agent", this);
        
        // Configure APB Agent as Slave
        uvm_config_db#(bit)::set(this, "s_apb_agent", "is_slave", 1);
    endfunction

    function void connect_phase(uvm_phase phase);
        // Connect monitors to scoreboard if needed
    endfunction

endclass
