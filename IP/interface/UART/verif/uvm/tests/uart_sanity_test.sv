class uart_sanity_test extends uart_base_test;

  `uvm_component_utils(uart_sanity_test)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_info("TEST", "Starting Sanity Test...", UVM_LOW)
    #10us;
    `uvm_info("TEST", "Sanity Test Complete", UVM_LOW)
    phase.drop_objection(this);
  endtask

endclass : uart_sanity_test
