/*
 * File: sp_memory_base_test.sv
 * Description: Base Test for SP Memory
 */
class sp_memory_base_test extends uvm_test;
  `uvm_component_utils(sp_memory_base_test)

  sp_memory_env m_env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_env = sp_memory_env::type_id::create("m_env", this);
  endfunction

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    uvm_top.print_topology();
  endfunction

endclass
