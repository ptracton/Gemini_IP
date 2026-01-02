`ifndef UART_SEQUENCES_SV
`define UART_SEQUENCES_SV

class uart_directed_seq extends uvm_sequence #(uart_seq_item);
  `uvm_object_utils(uart_directed_seq)

  rand bit [7:0] data;
  rand bit inject_error;
  rand bit use_forced_data;

  function new(string name = "uart_directed_seq");
    super.new(name);
  endfunction

  task body();
    req = uart_seq_item::type_id::create("req");
    start_item(req);
    if (!req.randomize() with {
          delay inside {[1 : 10]};
          error_parity == inject_error;
          error_frame == 0;
          if (use_forced_data) req.data == local:: data;
        }) begin
      `uvm_error("SEQ", "Randomization failed")
    end
    finish_item(req);
  endtask
endclass

`endif
