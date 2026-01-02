`ifndef SPI_MASTER_DMA_TEST_SV
`define SPI_MASTER_DMA_TEST_SV

class spi_master_dma_test extends spi_master_base_test;
  `uvm_component_utils(spi_master_dma_test)

  virtual dma_if dma_vif;
  spi_master_apb_config_seq apb_seq;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual dma_if)::get(this, "", "dma_vif", dma_vif)) begin
      `uvm_fatal("DMA_TEST", "Could not get dma_vif from config_db")
    end
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);

    `uvm_info("DMA_TEST", "Starting DMA Handshake Test", UVM_LOW);

    // Initialize ACKs to 0
    dma_vif.tx_ack = 0;
    dma_vif.rx_ack = 0;

    // Reset Wait
    #1000;

    // Check initial state: TX FIFO is empty, so TX Request should be HIGH (asking for data)
    // Actually TX Req = !tx_almost_full. FIFO Empty = Empty. almost_full=0. req=1.
    // Wait for reset to propagate
    #100;

    if (dma_vif.tx_req !== 1) begin
      `uvm_error("DMA_TEST", $sformatf("Expected Initial TX Req=1 (FIFO Empty), Got %b",
                                       dma_vif.tx_req))
    end else begin
      `uvm_info("DMA_TEST", "Initial TX Request Asserted (Correct)", UVM_LOW);
    end

    // Test TX Handshake
    perform_tx_handshake();

    // Now verify RX Handshake
    // We need data in RX FIFO for RX Req to assert.
    // We can use Loopback mode to get data in easily without driving SPI pins manually.
    setup_loopback_transfer();
    perform_rx_handshake();

    #1000;
    `uvm_info("DMA_TEST", "DMA Handshake Test Complete", UVM_LOW);
    phase.drop_objection(this);
  endtask

  task perform_tx_handshake();
    `uvm_info("DMA_TEST", "Testing TX Handshake...", UVM_LOW);

    wait (dma_vif.tx_req == 1);
    `uvm_info("DMA_TEST", "TX Request Detected", UVM_LOW);

    // Assert ACK
    #10;
    dma_vif.tx_ack = 1;
    #1;  // Allow combinational logic to propagate

    if (dma_vif.tx_req !== 0) begin
      `uvm_error("DMA_TEST", "TX Request did NOT drop after ACK assertion!")
    end else begin
      `uvm_info("DMA_TEST", "TX Request Dropped (Correct)", UVM_LOW);
    end

    // De-assert ACK
    #20;
    dma_vif.tx_ack = 0;
    #1;

    // Request should re-assert if FIFO is still not full
    if (dma_vif.tx_req !== 1) begin
      `uvm_error("DMA_TEST", "TX Request did NOT re-assert after ACK de-assertion!")
    end else begin
      `uvm_info("DMA_TEST", "TX Request Re-asserted (Correct)", UVM_LOW);
    end
  endtask

  task setup_loopback_transfer();
    `uvm_info("DMA_TEST", "Setting up Loopback for RX Data...", UVM_LOW);
    apb_seq = spi_master_apb_config_seq::type_id::create("apb_seq");

    // Enable=1, Loopback=1 (Bit 9) -> 0x201
    apb_seq.do_write_enable = 1;
    apb_seq.write_data = 32'h0201;
    apb_seq.start(env.apb_ag.sequencer);

    // Push data to TX logic (Via APB or just let it send garbage? APB is cleaner)
    apb_seq.do_write_enable = 0;
    apb_seq.do_write_fifo = 1;
    apb_seq.write_data = 32'hCAFEBABE;
    apb_seq.start(env.apb_ag.sequencer);

    // Wait for transfer to complete (at default divider)
    #5000;
  endtask

  task perform_rx_handshake();
    `uvm_info("DMA_TEST", "Testing RX Handshake...", UVM_LOW);

    // Wait for RX Req (Data Available)
    wait (dma_vif.rx_req == 1);
    `uvm_info("DMA_TEST", "RX Request Detected", UVM_LOW);

    // Assert ACK
    #10;
    dma_vif.rx_ack = 1;
    #1;

    if (dma_vif.rx_req !== 0) begin
      `uvm_error("DMA_TEST", "RX Request did NOT drop after ACK assertion!")
    end else begin
      `uvm_info("DMA_TEST", "RX Request Dropped (Correct)", UVM_LOW);
    end

    // De-assert ACK
    #20;
    dma_vif.rx_ack = 0;
    #1;

    // Request should re-assert if FIFO is still not empty
    if (dma_vif.rx_req !== 1) begin
      `uvm_error("DMA_TEST", "RX Request did NOT re-assert after ACK de-assertion!")
    end else begin
      `uvm_info("DMA_TEST", "RX Request Re-asserted (Correct)", UVM_LOW);
    end
  endtask

endclass
`endif
