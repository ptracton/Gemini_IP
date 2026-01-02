class uart_env_config extends uvm_object;

  `uvm_object_utils(uart_env_config)

  string bus_type = "APB";  // "AXI", "APB", "WB"

  uart_agent_config uart_cfg;
  // axi_agent_config axi_cfg; 
  // apb_agent_config apb_cfg; // Removed as apb_agent uses direct DB
  bit loopback_enable = 0;
  // wb_agent_config  wb_cfg;

  function new(string name = "uart_env_config");
    super.new(name);
  endfunction

endclass : uart_env_config
