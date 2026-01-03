/*
 * File: fifo_rand_test.sv
 * Description: Random test for Sync FIFO.
 * Author: Gemini-3 AI
 */

class fifo_rand_test extends fifo_base_test;
  `uvm_component_utils(fifo_rand_test)
  function new(string name = "fifo_rand_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    fifo_rand_seq seq;
    phase.raise_objection(this);
    seq = fifo_rand_seq::type_id::create("seq");
    seq.start(env.fifo_agt.sqr);
    phase.drop_objection(this);
  endtask
endclass
