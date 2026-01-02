`ifndef SPI_MONITOR_SV
`define SPI_MONITOR_SV

class spi_monitor extends uvm_monitor;
  `uvm_component_utils(spi_monitor)

  virtual spi_if vif;
  uvm_analysis_port #(spi_seq_item) ap;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    ap = new("ap", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual spi_if)::get(this, "", "vif", vif))
      `uvm_error("NOVIF", {"Virtual interface must be set for: ", get_full_name(), ".vif"});
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      collect_transfer();
    end
  endtask

  task collect_transfer();
    spi_seq_item item = spi_seq_item::type_id::create("item");
    bit [31:0] mosi_reg = 0;
    bit [31:0] miso_reg = 0;

    // Wait for CS assertion
    wait (vif.cs_n == 0);

    // Simple Monitor - Sample every 32 bits or wait for CS deassertion?
    // Better to sample bits until CS deasserts.

    while (vif.cs_n == 0) begin
      // Assume Mode 0 for now (Sample Rising)
      @(posedge vif.sclk);
      if (vif.cs_n == 0) begin
        mosi_reg = {mosi_reg[30:0], vif.mosi};
        miso_reg = {miso_reg[30:0], vif.miso};
      end
    end

    item.mosi_data = mosi_reg;
    item.miso_data = miso_reg;
    ap.write(item);
  endtask

endclass

`endif
