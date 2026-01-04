/*
 * File: sp_memory_base_seq.sv
 * Description: Base sequence for SP Memory Sideband Agent
 */
class sp_memory_base_seq extends uvm_sequence #(sp_memory_seq_item);
  `uvm_object_utils(sp_memory_base_seq)

  rand logic sleep;
  rand logic bist_en;

  constraint default_control {
    soft sleep == 0;
    soft bist_en == 0;
  }

  function new(string name = "sp_memory_base_seq");
    super.new(name);
    sleep   = 0;
    bist_en = 0;
  endfunction

  virtual task body();
    req = sp_memory_seq_item::type_id::create("req");
    start_item(req);
    // Use local fields to constrain the item
    if (!req.randomize() with {
          sleep == local:: sleep;
          bist_en == local:: bist_en;
        }) begin
      `uvm_error("SEQ", "Randomization failed");
    end
    finish_item(req);
  endtask
endclass
