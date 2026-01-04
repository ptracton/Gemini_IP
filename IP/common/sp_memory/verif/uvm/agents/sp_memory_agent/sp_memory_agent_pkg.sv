/*
 * File: sp_memory_agent_pkg.sv
 * Description: Package for SP Memory Agent
 */
package sp_memory_agent_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  `include "sp_memory_seq_item.sv"
  `include "sp_memory_driver.sv"
  `include "sp_memory_monitor.sv"
  `include "sp_memory_sequencer.sv"
  `include "sp_memory_agent.sv"
endpackage
