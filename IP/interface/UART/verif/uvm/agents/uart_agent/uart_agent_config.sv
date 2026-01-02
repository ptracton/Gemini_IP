class uart_agent_config extends uvm_object;

  `uvm_object_utils(uart_agent_config)

  uvm_active_passive_enum is_active = UVM_ACTIVE;
  int baud_rate = 9600;
  int clock_freq = 100000000;  // 100MHz default
  bit parity_en = 0;
  bit even_parity = 0;
  int stop_bits = 1;

  virtual uart_if vif;

  function new(string name = "uart_agent_config");
    super.new(name);
  endfunction

endclass : uart_agent_config
