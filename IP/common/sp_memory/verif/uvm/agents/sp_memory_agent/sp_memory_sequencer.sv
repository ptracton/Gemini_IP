/*
 * File: sp_memory_sequencer.sv
 * Description: Sequencer for SP Memory sideband signals
 */
class sp_memory_sequencer extends uvm_sequencer #(sp_memory_seq_item);
  `uvm_component_utils(sp_memory_sequencer)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

endclass
