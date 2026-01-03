/*
 * File: fifo_monitor.sv
 * Description: Monitor for FIFO agent.
 * Author: Gemini-3 AI
 */

class fifo_monitor #(
    parameter int WIDTH = 32
) extends uvm_monitor;
  virtual fifo_if #(WIDTH) vif;
  uvm_analysis_port #(fifo_seq_item #(WIDTH)) item_collected_port;

  `uvm_component_param_utils(fifo_monitor#(WIDTH))

  function new(string name = "fifo_monitor", uvm_component parent = null);
    super.new(name, parent);
    item_collected_port = new("item_collected_port", this);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    void'(uvm_config_db#(virtual fifo_if #(WIDTH))::get(this, "", "vif", vif));
  endfunction

  virtual task run_phase(uvm_phase phase);
    forever begin
      fifo_seq_item #(WIDTH) item;
      @(vif.mon_cb);
      if (vif.rst_n !== 1'b1) continue;

      item = fifo_seq_item#(WIDTH)::type_id::create("item");
      item.push = vif.mon_cb.push;
      item.pop = vif.mon_cb.pop;
      item.flush = vif.mon_cb.flush;
      item.data_in = vif.mon_cb.data_in;
      item.data_out = vif.mon_cb.data_out;
      item.is_full = vif.mon_cb.is_full;
      item.is_empty = vif.mon_cb.is_empty;
      item.almost_full = vif.mon_cb.almost_full;
      item.almost_empty = vif.mon_cb.almost_empty;
      item.overflow = vif.mon_cb.overflow;
      item.underflow = vif.mon_cb.underflow;
      item.level = vif.mon_cb.level;

      if (vif.mon_cb.push && vif.mon_cb.pop) item.op = fifo_seq_item#(WIDTH)::PUSH_POP;
      else if (vif.mon_cb.push) item.op = fifo_seq_item#(WIDTH)::PUSH;
      else if (vif.mon_cb.pop) item.op = fifo_seq_item#(WIDTH)::POP;
      else if (vif.mon_cb.flush) item.op = fifo_seq_item#(WIDTH)::FLUSH;
      else item.op = fifo_seq_item#(WIDTH)::IDLE;

      item_collected_port.write(item);
    end
  endtask

endclass
