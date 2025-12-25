/*
 * File: bus_matrix_test_pkg.sv
 * Description: Bus Matrix UVM Tests
 */

package bus_matrix_test_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    
    import bus_matrix_env_pkg::*;
    import ahb_agent_pkg::*;
    
    class bus_matrix_base_test extends uvm_test;
        `uvm_component_utils(bus_matrix_base_test)
        
        bus_matrix_env env;
        
        function new(string name, uvm_component parent);
            super.new(name, parent);
        endfunction
        
        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
            env = bus_matrix_env::type_id::create("env", this);
        endfunction
        
        task run_phase(uvm_phase phase);
            phase.raise_objection(this);
            #1000; // Basic timeout
            phase.drop_objection(this);
        endtask
    endclass

    import bus_matrix_seq_pkg::*;

    class bus_matrix_rand_test extends bus_matrix_base_test;
        `uvm_component_utils(bus_matrix_rand_test)
        
        function new(string name, uvm_component parent);
            super.new(name, parent);
        endfunction
        
        task run_phase(uvm_phase phase);
            bus_matrix_rand_vseq vseq;
            
            phase.raise_objection(this);
            
            vseq = bus_matrix_rand_vseq::type_id::create("vseq");
            // Assign sequencers
            vseq.axi_seqr = env.m_axi_agent.sequencer;
            vseq.ahb_seqr = env.m_ahb_agent.sequencer;
            vseq.wb_seqr  = env.m_wb_agent.sequencer;
            
            vseq.start(null); // Null because it's a virtual sequence without a virtual sequencer
            
            phase.drop_objection(this);
        endtask
    endclass

endpackage
