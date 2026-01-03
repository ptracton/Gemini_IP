/*
 * File: fifo_sequencer.sv
 * Description: Sequencer for FIFO agent.
 * Author: Gemini-3 AI
 */

class fifo_sequencer #(
    parameter int WIDTH = 32
) extends uvm_sequencer #(fifo_seq_item #(WIDTH));
  `uvm_component_param_utils(fifo_sequencer#(WIDTH))

  function new(string name = "fifo_sequencer", uvm_component parent = null);
    super.new(name, parent);
  endfunction
endclass
