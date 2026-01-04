/*
 * File: sp_memory_agent.sv
 * Description: Agent for SP Memory sideband signals
 */
class sp_memory_agent extends uvm_agent;
  `uvm_component_utils(sp_memory_agent)

  sp_memory_driver    driver;
  sp_memory_sequencer sequencer;
  sp_memory_monitor   monitor;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    monitor = sp_memory_monitor::type_id::create("monitor", this);
    if (get_is_active() == UVM_ACTIVE) begin
      driver = sp_memory_driver::type_id::create("driver", this);
      sequencer = sp_memory_sequencer::type_id::create("sequencer", this);
    end
  endfunction

  function void connect_phase(uvm_phase phase);
    if (get_is_active() == UVM_ACTIVE) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
    end
  endfunction

endclass
