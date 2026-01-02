class uart_wb_test extends uart_base_test;

  `uvm_component_utils(uart_wb_test)

  virtual wb_if wb_vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    m_env_cfg.bus_type = "WB";

    if (!uvm_config_db#(virtual wb_if)::get(this, "", "wb_vif", wb_vif))
      `uvm_fatal("TEST", "Could not get WB VIF")

    uvm_config_db#(virtual wb_if)::set(this, "m_env.m_wb_agent*", "vif", wb_vif);
    uvm_config_db#(bit)::set(this, "m_env.m_wb_agent", "is_slave", 0);  // Master
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_info("TEST", "Starting WB Sanity Test...", UVM_LOW)
    #10us;
    `uvm_info("TEST", "WB Sanity Test Complete", UVM_LOW)
    phase.drop_objection(this);
  endtask

endclass : uart_wb_test
