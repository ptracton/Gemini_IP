/*
 * File: sync_fifo_all_tests_pkg.sv
 * Description: Unified package for all FIFO tests.
 * Author: Gemini-3 AI
 */

package sync_fifo_all_tests_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import fifo_agent_pkg::*;
  import axi_agent_pkg::*;
  import apb_agent_pkg::*;
  import wb_agent_pkg::*;
  import sync_fifo_env_pkg::*;

  // Include Sequences
  `include "fifo_sequences.sv"
  `include "fifo_bus_sequences.sv"

  // Include Tests (Base test is in env_pkg)

  // Core Tests
  `include "fifo_rand_test.sv"

  // AXI Tests
  class fifo_axi_basic_test extends fifo_base_test;
    `uvm_component_utils(fifo_axi_basic_test)
    function new(string name = "fifo_axi_basic_test", uvm_component parent = null);
      super.new(name, parent);
      has_axi = 1;
    endfunction
    virtual function void build_phase(uvm_phase phase);
      uvm_config_db#(int)::set(this, "env.fifo_agt", "is_active", UVM_PASSIVE);
      super.build_phase(phase);
    endfunction
    virtual task run_phase(uvm_phase phase);
      axi_fifo_basic_seq seq;
      phase.raise_objection(this);
      seq = axi_fifo_basic_seq::type_id::create("seq");
      seq.start(env.axi_agt.sequencer);
      phase.drop_objection(this);
    endtask
  endclass

  // APB Tests
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

  // WB Tests
  class fifo_wb_basic_test extends fifo_base_test;
    `uvm_component_utils(fifo_wb_basic_test)
    function new(string name = "fifo_wb_basic_test", uvm_component parent = null);
      super.new(name, parent);
      has_wb = 1;
    endfunction
    virtual function void build_phase(uvm_phase phase);
      uvm_config_db#(int)::set(this, "env.fifo_agt", "is_active", UVM_PASSIVE);
      super.build_phase(phase);
    endfunction
    virtual task run_phase(uvm_phase phase);
      wb_fifo_basic_seq seq;
      phase.raise_objection(this);
      seq = wb_fifo_basic_seq::type_id::create("seq");
      seq.start(env.wb_agt.sequencer);
      phase.drop_objection(this);
    endtask
  endclass

endpackage
