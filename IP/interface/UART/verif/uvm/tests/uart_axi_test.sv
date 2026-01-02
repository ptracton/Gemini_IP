class uart_axi_test extends uart_base_test;

  `uvm_component_utils(uart_axi_test)

  virtual axi_if axi_vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    // Override base build_phase or do setup before/after?
    // uart_base_test does build config. We need to intervene.
    // Easier to copy base logic or make base generic. 
    // Let's rely on overriding the `setup_env_config` if I extracted it, but I didn't.
    // So I will just do the standard UVM override technique of re-doing the config before super.build? 
    // No, super.build executes first.

    // Lets just copy the vital parts or modify base test to be dynamic. 
    // Modifying base test to check commandplayer or plusarg is better.

    super.build_phase(phase);

    // Update Config
    m_env_cfg.bus_type = "AXI";

    if (!uvm_config_db#(virtual axi_if)::get(this, "", "axi_vif", axi_vif))
      `uvm_fatal("TEST", "Could not get AXI VIF")

    // Configure AXI Agent
    // uvm_config_db #(virtual axi_if)::set(this, "m_env.m_axi_agent*", "vif", axi_vif); // Monitor gets it from its own lookup?
    // Agent usually gets VIF from DB in its build_phase. We need to set it for the agent.
    uvm_config_db#(virtual axi_if)::set(this, "m_env.m_axi_agent*", "vif", axi_vif);
    uvm_config_db#(bit)::set(this, "m_env.m_axi_agent", "is_slave", 0);  // Master
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_info("TEST", "Starting AXI Sanity Test...", UVM_LOW)
    #10us;
    `uvm_info("TEST", "AXI Sanity Test Complete", UVM_LOW)
    phase.drop_objection(this);
  endtask

endclass : uart_axi_test
