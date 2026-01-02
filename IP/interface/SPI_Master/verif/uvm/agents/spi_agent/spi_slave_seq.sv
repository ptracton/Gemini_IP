`ifndef SPI_SLAVE_SEQ_SV
`define SPI_SLAVE_SEQ_SV

class spi_slave_seq extends uvm_sequence #(spi_seq_item);
  `uvm_object_utils(spi_slave_seq)

  function new(string name = "spi_slave_seq");
    super.new(name);
  endfunction

  task body();
    spi_seq_item req;
    forever begin
      req = spi_seq_item::type_id::create("req");
      start_item(req);
      if (!req.randomize()) begin
        `uvm_error("RND_FAIL", "Failed to randomize SPI slave item")
      end
      finish_item(req);
    end
  endtask

endclass

`endif
