class uart_base_test extends uvm_test;

  `uvm_component_utils(uart_base_test)

  uart_env m_env;
  uart_env_config m_env_cfg;
  // apb_agent_config m_apb_cfg; // Removed
  uart_agent_config m_uart_cfg;

  virtual apb_if apb_vif;  // Local handle

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    m_env_cfg  = uart_env_config::type_id::create("m_env_cfg");
    m_uart_cfg = uart_agent_config::type_id::create("m_uart_cfg");

    // Retrieve interfaces from UVM DB (set in TB Top)
    if (!uvm_config_db#(virtual apb_if)::get(this, "", "apb_vif", apb_vif))
      `uvm_fatal("TEST", "Could not get APB VIF")

    if (!uvm_config_db#(virtual uart_if)::get(this, "", "uart_vif", m_uart_cfg.vif))
      `uvm_fatal("TEST", "Could not get UART VIF")

    // Configure Agents
    // m_apb_cfg.is_active = UVM_ACTIVE; // APB Agent defaults to active? Check agent.
    // Assuming default active.

    // Pass APB VIF to Agent's Driver/Monitor
    uvm_config_db#(virtual apb_if)::set(this, "m_env.m_apb_agent*", "vif", apb_vif);
    // Set APB Agent as Master
    uvm_config_db#(bit)::set(this, "m_env.m_apb_agent", "is_slave", 0);

    m_uart_cfg.is_active = UVM_ACTIVE;
    m_uart_cfg.baud_rate = 9600;
    m_uart_cfg.clock_freq = 100000000;

    // Configure Env
    m_env_cfg.bus_type = "APB";
    m_env_cfg.uart_cfg = m_uart_cfg;

    uvm_config_db#(uart_env_config)::set(this, "*", "config", m_env_cfg);

    m_env = uart_env::type_id::create("m_env", this);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    // Default: 1ms timeout or rely on sequences
    #100us;
    phase.drop_objection(this);
  endtask

  // ---------------------------------------------------------------------------
  // APB Convenience Tasks (Manual Driver)
  // ---------------------------------------------------------------------------
  task apb_write(input bit [31:0] addr, input bit [31:0] data);
    @(posedge apb_vif.pclk);
    apb_vif.paddr   <= addr;
    apb_vif.pwrite  <= 1;
    apb_vif.psel    <= 1;
    apb_vif.pwdata  <= data;
    apb_vif.penable <= 0;

    @(posedge apb_vif.pclk);
    apb_vif.penable <= 1;

    // Wait for Ready
    do begin
      @(posedge apb_vif.pclk);
    end while (apb_vif.pready === 0);

    apb_vif.psel    <= 0;
    apb_vif.penable <= 0;
    apb_vif.pwrite  <= 0;
  endtask

  task apb_read(input bit [31:0] addr, output bit [31:0] data);
    @(posedge apb_vif.pclk);
    apb_vif.paddr   <= addr;
    apb_vif.pwrite  <= 0;
    apb_vif.psel    <= 1;
    apb_vif.penable <= 0;

    @(posedge apb_vif.pclk);
    apb_vif.penable <= 1;

    // Wait for Ready
    do begin
      @(posedge apb_vif.pclk);
    end while (apb_vif.pready === 0);

    data = apb_vif.prdata;

    apb_vif.psel    <= 0;
    apb_vif.penable <= 0;
  endtask

endclass : uart_base_test
