/*
 * File: sp_memory_driver.sv
 * Description: Driver for SP Memory sideband signals
 */
class sp_memory_driver extends uvm_driver #(sp_memory_seq_item);
  `uvm_component_utils(sp_memory_driver)

  virtual sp_memory_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual sp_memory_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal("NOVIF", {"virtual interface must be set for: ", get_full_name(), ".vif"});
    end
  endfunction

  virtual task run_phase(uvm_phase phase);
    // Initialize
    vif.cb.sleep   <= 0;
    vif.cb.bist_en <= 0;

    forever begin
      seq_item_port.get_next_item(req);
      drive_item(req);
      seq_item_port.item_done();
    end
  endtask

  virtual task drive_item(sp_memory_seq_item item);
    @(vif.cb);
    vif.cb.sleep   <= item.sleep;
    vif.cb.bist_en <= item.bist_en;
  endtask

endclass
