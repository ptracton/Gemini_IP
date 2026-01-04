/*
 * File: sp_memory_init_test.sv
 * Description: Alias for stress test to provide a unique coverage database for INIT_FILE runs
 */

class sp_memory_init_test extends sp_memory_stress_test;
  `uvm_component_utils(sp_memory_init_test)

  function new(string name = "sp_memory_init_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

endclass
