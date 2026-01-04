/*
 * File: sp_memory_monitor.sv
 * Description: Monitor for SP Memory sideband signals
 */
class sp_memory_monitor extends uvm_monitor;
  `uvm_component_utils(sp_memory_monitor)

  virtual sp_memory_if vif;
  uvm_analysis_port #(sp_memory_seq_item) item_collected_port;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    item_collected_port = new("item_collected_port", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual sp_memory_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal("NOVIF", {"virtual interface must be set for: ", get_full_name(), ".vif"});
    end
  endfunction

  virtual task run_phase(uvm_phase phase);
    sp_memory_seq_item item;
    forever begin
      @(vif.cb);
      // Monitor meaningful changes or periodic status

      item = sp_memory_seq_item::type_id::create("item");
      item.sleep = vif.sleep;
      item.bist_en = vif.bist_en;
      item.bist_done = vif.bist_done;
      item.bist_pass = vif.bist_pass;
      item.err_parity = vif.err_parity;
      item.err_ecc_single = vif.err_ecc_single;
      item.err_ecc_double = vif.err_ecc_double;

      item_collected_port.write(item);
    end
  endtask

endclass
