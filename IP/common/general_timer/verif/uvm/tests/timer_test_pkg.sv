/*
 * File: timer_test_pkg.sv
 * Description: UVM Package for Timer tests
 */
package timer_test_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    import axi_agent_pkg::*;
    import apb_agent_pkg::*;
    import wb_agent_pkg::*;
    import timer_agent_pkg::*;
    import timer_env_pkg::*;

    `include "timer_sequences.sv"
    
    // Base Test
    class timer_base_test extends uvm_test;
        `uvm_component_utils(timer_base_test)

        timer_env env;
        string bus_type = "AXI";

        function new(string name = "timer_base_test", uvm_component parent = null);
            super.new(name, parent);
        endfunction

        virtual function void build_phase(uvm_phase phase);
            super.build_phase(phase);
            env = timer_env::type_id::create("env", this);
            
            // Pass bus type to env
            if ($value$plusargs("BUS_TYPE=%s", bus_type)) begin
                 uvm_config_db#(string)::set(this, "env", "bus_type", bus_type);
            end
        endfunction

        virtual task run_phase(uvm_phase phase);
            `uvm_info("TEST", "Base test running", UVM_LOW)
        endtask

    endclass

    // Simple Register Test
    class timer_reg_test extends timer_base_test;
        `uvm_component_utils(timer_reg_test)
        function new(string name = "timer_reg_test", uvm_component parent = null);
            super.new(name, parent);
        endfunction

        virtual task run_phase(uvm_phase phase);
            timer_axi_reg_seq axi_seq;
            timer_apb_reg_seq apb_seq;
            timer_wb_reg_seq  wb_seq;
            phase.raise_objection(this);
            
            if (bus_type == "AXI") begin
                axi_seq = timer_axi_reg_seq::type_id::create("axi_seq");
                axi_seq.start(env.axi_agt.sequencer);
                axi_seq.write_reg(32'h04, 32'h12345678); // LOAD
                axi_seq.read_reg(32'h04);
                axi_seq.write_reg(32'h0C, 32'h0000000A); // PRE
                axi_seq.read_reg(32'h0C);
            end else if (bus_type == "APB") begin
                apb_seq = timer_apb_reg_seq::type_id::create("apb_seq");
                apb_seq.start(env.apb_agt.sequencer);
                apb_seq.write_reg(32'h04, 32'h12345678);
                apb_seq.read_reg(32'h04);
            end else if (bus_type == "WB") begin
                wb_seq = timer_wb_reg_seq::type_id::create("wb_seq");
                wb_seq.start(env.wb_agt.sequencer);
                wb_seq.write_reg(32'h04, 32'h12345678);
                wb_seq.read_reg(32'h04);
            end
            
            #1000;
            phase.drop_objection(this);
        endtask
    endclass

    // Functional Count Test
    class timer_count_test extends timer_base_test;
        `uvm_component_utils(timer_count_test)
        function new(string name = "timer_count_test", uvm_component parent = null);
            super.new(name, parent);
        endfunction

        virtual task run_phase(uvm_phase phase);
            timer_axi_reg_seq axi_seq;
            phase.raise_objection(this);
            
            if (bus_type == "AXI") begin
                axi_seq = timer_axi_reg_seq::type_id::create("axi_seq");
                axi_seq.start(env.axi_agt.sequencer);
                
                `uvm_info("TEST", "Starting Timer counting test...", UVM_LOW)
                axi_seq.write_reg(32'h04, 32'h00000020); // LOAD = 32
                axi_seq.write_reg(32'h00, 32'h00000001); // CTRL: EN=1, MODE=0 (Pulse), DIR=0 (Down)
                
                // Wait for some time to see it counting
                #1000;
                
                axi_seq.read_reg(32'h08); // VAL
                axi_seq.read_reg(32'h14); // INT_STS (Should have expired by now)
            end
            
            phase.drop_objection(this);
        endtask
    endclass

endpackage
