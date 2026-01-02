`ifndef SPI_MASTER_BASE_TEST_SV
`define SPI_MASTER_BASE_TEST_SV

class spi_master_base_test extends uvm_test;
  `uvm_component_utils(spi_master_base_test)

  spi_master_env_pkg::spi_master_env env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = spi_master_env_pkg::spi_master_env::type_id::create("env", this);

    // Configure Env to use APB
    uvm_config_db#(string)::set(this, "env", "bus_type", "APB");
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    #1000;  // Reset + Wait
    phase.drop_objection(this);
  endtask

endclass

`endif
