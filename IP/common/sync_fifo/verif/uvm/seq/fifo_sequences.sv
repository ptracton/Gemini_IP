/*
 * File: fifo_sequences.sv
 * Description: Sequences for Sync FIFO.
 * Author: Gemini-3 AI
 */

class fifo_base_seq #(
    parameter int WIDTH = 32
) extends uvm_sequence #(fifo_seq_item #(WIDTH));
  `uvm_object_param_utils(fifo_base_seq#(WIDTH))
  function new(string name = "fifo_base_seq");
    super.new(name);
  endfunction
endclass

class fifo_rand_seq #(
    parameter int WIDTH = 32
) extends fifo_base_seq #(WIDTH);
  rand int num_items = 100;
  `uvm_object_param_utils(fifo_rand_seq#(WIDTH))
  function new(string name = "fifo_rand_seq");
    super.new(name);
  endfunction

  virtual task body();
    repeat (num_items) begin
      `uvm_do(req)
    end
  endtask
endclass

class fifo_fill_test_seq #(
    parameter int WIDTH = 32
) extends fifo_base_seq #(WIDTH);
  int depth = 16;
  `uvm_object_param_utils(fifo_fill_test_seq#(WIDTH))
  function new(string name = "fifo_fill_test_seq");
    super.new(name);
  endfunction

  virtual task body();
    // Fill
    repeat (depth) begin
      `uvm_do_with(req, {op == PUSH;})
    end
    // Empty
    repeat (depth) begin
      `uvm_do_with(req, {op == POP;})
    end
  endtask
endclass
