/*
 * File: fifo_seq_item.sv
 * Description: Sequence item for FIFO agent.
 * Author: Gemini-3 AI
 */

class fifo_seq_item #(
    parameter int WIDTH = 32
) extends uvm_sequence_item;
  typedef enum {
    PUSH,
    POP,
    PUSH_POP,
    FLUSH,
    IDLE
  } op_t;

  rand op_t op;
  rand logic [WIDTH-1:0] data_in;
  logic [WIDTH-1:0] data_out;
  logic push, pop, flush;
  logic is_full, is_empty, almost_full, almost_empty, overflow, underflow;
  logic [31:0] level;

  `uvm_object_param_utils_begin(fifo_seq_item#(WIDTH))
    `uvm_field_enum(op_t, op, UVM_ALL_ON)
    `uvm_field_int(data_in, UVM_ALL_ON)
    `uvm_field_int(data_out, UVM_ALL_ON)
    `uvm_field_int(is_full, UVM_ALL_ON)
    `uvm_field_int(is_empty, UVM_ALL_ON)
    `uvm_field_int(level, UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name = "fifo_seq_item");
    super.new(name);
  endfunction

endclass
