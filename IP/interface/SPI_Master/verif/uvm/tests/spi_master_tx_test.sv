`ifndef SPI_MASTER_TX_TEST_SV
`define SPI_MASTER_TX_TEST_SV

class spi_master_tx_test extends spi_master_base_test;
  `uvm_component_utils(spi_master_tx_test)

  // Sequence
  spi_master_apb_config_seq seq;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);

    `uvm_info("TEST", "Starting TX Test", UVM_LOW);

    // Wait for Reset
    #1000;

    // 1. Configure SPI Master (Enable)
    seq = spi_master_apb_config_seq::type_id::create("seq");
    seq.do_write_enable = 1;
    seq.start(env.apb_ag.sequencer);

    `uvm_info("TEST", "Enabled SPI Master", UVM_LOW);

    // 2. Write Data to TX FIFO
    seq.do_write_enable = 0;
    seq.do_write_fifo = 1;
    seq.write_data = 32'hA5A55A5A;
    seq.start(env.apb_ag.sequencer);

    `uvm_info("TEST", "Wrote Data to TX FIFO", UVM_LOW);

    // 3. Wait for transmission to complete
    #5000;

    `uvm_info("TEST", "TX Test Complete", UVM_LOW);

    phase.drop_objection(this);
  endtask

endclass

`endif
