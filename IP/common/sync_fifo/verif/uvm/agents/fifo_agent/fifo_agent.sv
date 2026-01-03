/*
 * File: fifo_agent.sv
 * Description: Agent for Sync FIFO.
 * Author: Gemini-3 AI
 */

class fifo_agent #(
    parameter int WIDTH = 32
) extends uvm_agent;
  fifo_driver #(WIDTH) drv;
  fifo_monitor #(WIDTH) monitor;
  fifo_sequencer #(WIDTH) sqr;

  `uvm_component_param_utils(fifo_agent#(WIDTH))

  function new(string name = "fifo_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    monitor = fifo_monitor#(WIDTH)::type_id::create("monitor", this);
    if (get_is_active() == UVM_ACTIVE) begin
      drv = fifo_driver#(WIDTH)::type_id::create("drv", this);
      sqr = fifo_sequencer#(WIDTH)::type_id::create("sqr", this);
    end
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    if (get_is_active() == UVM_ACTIVE) begin
      drv.seq_item_port.connect(sqr.seq_item_export);
    end
  endfunction
endclass
