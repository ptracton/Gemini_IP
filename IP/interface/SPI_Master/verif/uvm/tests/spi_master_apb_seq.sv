`ifndef SPI_MASTER_APB_SEQ_SV
`define SPI_MASTER_APB_SEQ_SV

class spi_master_apb_config_seq extends uvm_sequence #(apb_seq_item);
  `uvm_object_utils(spi_master_apb_config_seq)

  rand bit [31:0] write_data;
  rand bit [31:0] write_addr;  // Generic write addr if needed
  rand bit [31:0] read_addr;

  bit [31:0] last_read_data;

  bit do_write_enable = 0;
  bit do_write_fifo = 0;
  bit do_read_fifo = 0;
  bit do_read_check = 0;

  function new(string name = "spi_master_apb_config_seq");
    super.new(name);
  endfunction

  task body();
    apb_seq_item req;

    // Write Control Register (CR - 0x08)
    if (do_write_enable) begin  // Kept name for compatibility, but now uses write_data if non-zero?
      // Or cleaner: check if write_addr is set?
      // Let's stick to flags for now but use write_data
      req = apb_seq_item::type_id::create("req");
      start_item(req);
      req.addr  = 32'h08;
      req.data  = write_data;  // Use configurable data
      req.write = 1;
      req.strb  = 4'hF;
      finish_item(req);
    end

    // Write FIFO (0x00)
    if (do_write_fifo) begin
      req = apb_seq_item::type_id::create("req");
      start_item(req);
      req.addr  = 32'h00;
      req.data  = write_data;
      req.write = 1;
      req.strb  = 4'hF;
      finish_item(req);
    end

    // Read Control Register (CR - 0x08) or Generic Address
    if (do_read_check) begin
      req = apb_seq_item::type_id::create("req");
      start_item(req);
      req.addr  = read_addr;
      req.write = 0;
      req.strb  = 4'h0;
      finish_item(req);
      // Optional: Check logic here or return data
      last_read_data = req.rdata;
    end

    // Read RX FIFO (0x00)
    if (do_read_fifo) begin
      req = apb_seq_item::type_id::create("req");
      start_item(req);
      req.addr  = 32'h00;
      req.write = 0;
      req.strb  = 4'h0;
      finish_item(req);
      last_read_data = req.rdata;
    end

  endtask

endclass

`endif
