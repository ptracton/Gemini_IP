class uart_seq_item extends uvm_sequence_item;

  rand logic [7:0] data;
  rand int         delay;
  rand bit         error_frame;
  rand bit         error_parity;

  `uvm_object_utils_begin(uart_seq_item)
    `uvm_field_int(data, UVM_ALL_ON)
    `uvm_field_int(delay, UVM_ALL_ON)
    `uvm_field_int(error_frame, UVM_ALL_ON)
    `uvm_field_int(error_parity, UVM_ALL_ON)
  `uvm_object_utils_end

  constraint c_delay {delay inside {[0 : 20]};}

  function new(string name = "uart_seq_item");
    super.new(name);
  endfunction

endclass : uart_seq_item
