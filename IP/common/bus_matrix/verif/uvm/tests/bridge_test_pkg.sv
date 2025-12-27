/*
 * File: bridge_test_pkg.sv
 * Description: AHB-APB Bridge Test Package
 */

package bridge_test_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import ahb_agent_pkg::*;
    import apb_agent_pkg::*;
    import bridge_env_pkg::*;

    // --- APB Slave Responder Sequence ---
    class apb_slave_resp_seq extends uvm_sequence #(apb_seq_item);
        `uvm_object_utils(apb_slave_resp_seq)
        function new(string name="apb_slave_resp_seq");
            super.new(name);
        endfunction
        task body();
            forever begin
                req = apb_seq_item::type_id::create("req");
                start_item(req);
                if (!req.randomize()) `uvm_error("RNDFAIL", "APB Slave Randomization failed")
                finish_item(req);
            end
        endtask
    endclass

    class apb_slave_error_seq extends apb_slave_resp_seq;
        `uvm_object_utils(apb_slave_error_seq)
        function new(string name="apb_slave_error_seq");
            super.new(name);
        endfunction
        task body();
            forever begin
                req = apb_seq_item::type_id::create("req");
                start_item(req);
                if (!req.randomize() with { slverr_resp == 1; }) `uvm_error("RNDFAIL", "APB Slave Error Randomization failed")
                finish_item(req);
            end
        endtask
    endclass

    // --- Base Test ---
    class bridge_base_test extends uvm_test;
        `uvm_component_utils(bridge_base_test)
        bridge_env env;

        function new(string name, uvm_component parent);
            super.new(name, parent);
        endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
            env = bridge_env::type_id::create("env", this);
        endfunction

        task start_slave_responders(bit error_mode = 0);
            apb_slave_resp_seq apb_resp;
            if (error_mode)
                apb_resp = apb_slave_error_seq::type_id::create("apb_resp");
            else
                apb_resp = apb_slave_resp_seq::type_id::create("apb_resp");
            fork
                apb_resp.start(env.s_apb_agent.sequencer);
            join_none
        endtask
    endclass

    // --- Random Test ---
    class bridge_rand_test extends bridge_base_test;
        `uvm_component_utils(bridge_rand_test)
        function new(string name, uvm_component parent);
            super.new(name, parent);
        endfunction

        task run_phase(uvm_phase phase);
            ahb_rand_seq vseq;
            phase.raise_objection(this);
            start_slave_responders(0);
            
            vseq = ahb_rand_seq::type_id::create("vseq");
            vseq.count = 2000; // Increased significantly
            vseq.start(env.m_ahb_agent.sequencer);
            
            #100;
            phase.drop_objection(this);
        endtask
    endclass

    // ... (Error Test already there)

    // --- Reset Test ---
    class bridge_reset_test extends bridge_base_test;
        `uvm_component_utils(bridge_reset_test)
        virtual ahb_if ahb_vif;

        function new(string name, uvm_component parent);
            super.new(name, parent);
        endfunction

        task run_phase(uvm_phase phase);
            ahb_rand_seq vseq;
            phase.raise_objection(this);
            
            if (!uvm_config_db#(virtual ahb_if)::get(this, "env.m_ahb_agent.*", "vif", ahb_vif))
                `uvm_fatal("NO_VIF", "Could not get AHB VIF for reset test")

            start_slave_responders(0);
            
            fork
                begin
                    vseq = ahb_rand_seq::type_id::create("vseq");
                    vseq.count = 200;
                    vseq.start(env.m_ahb_agent.sequencer);
                end
                begin
                    #500;
                    `uvm_info("RESET", "Injecting mid-test Reset", UVM_LOW)
                    force ahb_vif.hresetn = 0;
                    #100;
                    release ahb_vif.hresetn;
                end
            join_any
            disable fork;
            
            #100;
            phase.drop_objection(this);
        endtask
    endclass

endpackage
