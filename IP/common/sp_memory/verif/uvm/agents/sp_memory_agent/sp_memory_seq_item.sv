/*
 * File: sp_memory_seq_item.sv
 * Description: SP Memory Sequence Item for Sideband Signals
 */
class sp_memory_seq_item extends uvm_sequence_item;

  rand logic sleep;
  rand logic bist_en;

  // Output/Status fields
  logic bist_done;
  logic bist_pass;
  logic err_parity;
  logic err_ecc_single;
  logic err_ecc_double;

  `uvm_object_utils_begin(sp_memory_seq_item)
    `uvm_field_int(sleep, UVM_ALL_ON)
    `uvm_field_int(bist_en, UVM_ALL_ON)
    `uvm_field_int(bist_done, UVM_ALL_ON)
    `uvm_field_int(bist_pass, UVM_ALL_ON)
    `uvm_field_int(err_parity, UVM_ALL_ON)
    `uvm_field_int(err_ecc_single, UVM_ALL_ON)
    `uvm_field_int(err_ecc_double, UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name = "sp_memory_seq_item");
    super.new(name);
  endfunction

endclass
