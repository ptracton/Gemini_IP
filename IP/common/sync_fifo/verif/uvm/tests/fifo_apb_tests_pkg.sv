/*
 * File: fifo_apb_tests_pkg.sv
 * Description: Package for FIFO APB tests.
 * Author: Gemini-3 AI
 */

package fifo_apb_tests_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import fifo_agent_pkg::*;
  import apb_agent_pkg::*;
  import sync_fifo_env_pkg::*;

  `include "fifo_bus_sequences.sv"

  class fifo_apb_basic_test extends fifo_base_test;
    `uvm_component_utils(fifo_apb_basic_test)
    function new(string name = "fifo_apb_basic_test", uvm_component parent = null);
      super.new(name, parent);
      has_apb = 1;
    endfunction

    virtual function void build_phase(uvm_phase phase);
      uvm_config_db#(int)::set(this, "env.fifo_agt", "is_active", UVM_PASSIVE);
      super.build_phase(phase);
    endfunction

    virtual task run_phase(uvm_phase phase);
      apb_fifo_basic_seq seq;
      phase.raise_objection(this);
      seq = apb_fifo_basic_seq::type_id::create("seq");
      seq.start(env.apb_agt.sequencer);
      phase.drop_objection(this);
    endtask
  endclass
endpackage
