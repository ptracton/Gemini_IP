`ifndef SPI_MASTER_COVERAGE_TEST_SV
`define SPI_MASTER_COVERAGE_TEST_SV

class spi_master_coverage_test extends spi_master_base_test;
  `uvm_component_utils(spi_master_coverage_test)

  // Sequences
  spi_master_apb_config_seq apb_seq;
  spi_slave_seq             spi_seq;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);

    `uvm_info("TEST", "Starting High Coverage Test", UVM_LOW);

    // Fork the SPI Slave Sequence (Background)
    spi_seq = spi_slave_seq::type_id::create("spi_seq");
    fork
      spi_seq.start(env.spi_ag.sequencer);
    join_none

    // Wait for Reset
    #1000;

    // -------------------------------------------------------
    // 1. CPOL/CPHA Mode Sweep (Branch Coverage)
    // -------------------------------------------------------
    // CR Addr: 0x08. Bits: [0] Enable, [1] CPOL, [2] CPHA
    // We will cycle through all 4 combinations.

    for (int cpol = 0; cpol <= 1; cpol++) begin
      for (int cpha = 0; cpha <= 1; cpha++) begin
        `uvm_info("TEST", $sformatf("Testing Mode CPOL=%0d CPHA=%0d", cpol, cpha), UVM_LOW);

        apb_seq = spi_master_apb_config_seq::type_id::create("apb_seq");
        apb_seq.do_write_enable = 1;
        // Enable=1, CPOL=cpol<<1, CPHA=cpha<<2
        apb_seq.write_data = 1 | (cpol << 1) | (cpha << 2);
        apb_seq.start(env.apb_ag.sequencer);

        // Send a few transactions in this mode
        apb_seq.do_write_enable = 0;
        apb_seq.do_write_fifo = 1;
        apb_seq.write_data = 32'hA5A5A5A5;
        apb_seq.start(env.apb_ag.sequencer);

        #5000;  // Wait
      end
    end

    // -------------------------------------------------------
    // 1B. Loopback Mode Test (Coverage Gap #3)
    // -------------------------------------------------------
    `uvm_info("TEST", "Testing Loopback Mode", UVM_LOW);
    // Bit 9 is Loopback, Bit 0 is Enable
    apb_seq.do_write_enable = 1;
    apb_seq.write_data = 32'h0201;  // Enable=1, Loopback=1 (Bit 9)
    apb_seq.start(env.apb_ag.sequencer);

    apb_seq.do_write_enable = 0;
    apb_seq.do_write_fifo = 1;
    apb_seq.write_data = 32'hDEADBEEF;
    apb_seq.start(env.apb_ag.sequencer);

    #5000;

    // -------------------------------------------------------
    // 1C. Readback Verification (Coverage Gap #1 - Read Logic)
    // -------------------------------------------------------
    `uvm_info("TEST", "Testing Register Readback", UVM_LOW);

    // Read CR (Should be 0x0201)
    apb_seq.do_write_fifo = 0;
    apb_seq.do_read_check = 1;
    apb_seq.read_addr = 32'h08;  // CR
    apb_seq.start(env.apb_ag.sequencer);

    // Read RX FIFO (Should have DEADBEEF from Loopback) (Coverage Gap #2 - RX Pop)
    apb_seq.do_read_check = 0;
    apb_seq.do_read_fifo  = 1;
    apb_seq.start(env.apb_ag.sequencer);

    // -------------------------------------------------------
    // 2. FIFO Stress Test (Full/Empty Flags)
    // -------------------------------------------------------
    `uvm_info("TEST", "Testing FIFO Full Condition", UVM_LOW);

    // Fill TX FIFO (Depth 32)
    repeat (34) begin  // Overfill slightly to check flow control/flags
      apb_seq.do_write_enable = 0;
      apb_seq.do_write_fifo = 1;
      apb_seq.write_data = $urandom;
      apb_seq.start(env.apb_ag.sequencer);
    end

    // Wait for transmission to drain some
    #10000;

    // -------------------------------------------------------
    // 3. Pattern Tests (Toggle Coverage)
    // -------------------------------------------------------
    `uvm_info("TEST", "Testing Data Patterns", UVM_LOW);
    apb_seq.do_write_fifo = 1;

    // All Zeros
    apb_seq.write_data = 32'h00000000;
    apb_seq.start(env.apb_ag.sequencer);
    #1000;

    // All Ones
    apb_seq.write_data = 32'hFFFFFFFF;
    apb_seq.start(env.apb_ag.sequencer);
    #1000;

    // Checkerboard
    apb_seq.write_data = 32'hAAAAAAAA;
    apb_seq.start(env.apb_ag.sequencer);
    #1000;

    apb_seq.write_data = 32'h55555555;
    apb_seq.start(env.apb_ag.sequencer);
    #1000;

    // -------------------------------------------------------
    // 4. Finish
    // -------------------------------------------------------

    // Drain any remaining RX data to cover RX Empty logic fully
    repeat (40) begin
      apb_seq.do_read_fifo  = 1;
      apb_seq.do_write_fifo = 0;
      apb_seq.start(env.apb_ag.sequencer);
    end

    // Wait for transactions to flush
    #50000;

    `uvm_info("TEST", "High Coverage Test Complete", UVM_LOW);

    phase.drop_objection(this);
  endtask

endclass

`endif
