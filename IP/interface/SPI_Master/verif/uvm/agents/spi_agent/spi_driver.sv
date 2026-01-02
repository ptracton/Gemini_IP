`ifndef SPI_DRIVER_SV
`define SPI_DRIVER_SV

class spi_driver extends uvm_driver #(spi_seq_item);
  `uvm_component_utils(spi_driver)

  virtual spi_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual spi_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", {"Virtual interface must be set for: ", get_full_name(), ".vif"});
  endfunction

  task run_phase(uvm_phase phase);
    spi_seq_item req;
    forever begin
      seq_item_port.get_next_item(req);
      drive_transfer(req);
      seq_item_port.item_done();
    end
  endtask

  task drive_transfer(spi_seq_item req);
    int bit_idx;
    bit [31:0] captured_data = 0;

    // Wait for CS assertion (Active Low)
    wait (vif.cs_n == 0);

    // Setup initial MISO bit (depending on CPHA)
    // Simple model: Drive MISO on one edge, Sample MOSI on other

    // For simplicity, let's assume Mode 0 (CPOL=0, CPHA=0) for first pass or use config
    // CPOL=0: SCLK idle low. CPHA=0: Sample 1st edge (Rising), Drive opposite?
    // Actually, SPI Slave usually prepares MISO as soon as CS goes low?

    // Logic for Mode 0:
    // CS fall: Drive MISO[MSB]
    // SCLK Rise: Master samples MISO, Slave Samples MOSI
    // SCLK Fall: Slave shifts next bit to MISO

    bit_idx = req.data_width - 1;

    if (req.cpha == 0) begin
      // Drive first bit on CS fall
      vif.miso <= req.miso_data[bit_idx];
    end

    // Loop for data bits (Robust: Check CS on every bit)
    for (int i = 0; i < req.data_width; i++) begin
      if (vif.cs_n == 1) break;  // Master ended transaction

      if (req.cpol == 0 && req.cpha == 0) begin
        // Mode 0: Sample Rising, Shift Falling

        // Wait for Rising Edge or CS high
        fork
          @(posedge vif.sclk);
          wait (vif.cs_n == 1);
        join_any

        if (vif.cs_n == 1) break;

        captured_data[bit_idx] = vif.mosi;

        // Wait for Falling Edge or CS high
        fork
          @(negedge vif.sclk);
          wait (vif.cs_n == 1);
        join_any

        if (vif.cs_n == 1) break;

        if (i < req.data_width - 1) begin
          bit_idx--;
          vif.miso <= req.miso_data[bit_idx];
        end
      end
      // TODO: Implement other modes
    end

    req.rx_data = captured_data;

    // Wait for CS release
    wait (vif.cs_n == 1);
    vif.miso <= 1'bz;  // Tri-state MISO

  endtask

endclass

`endif
