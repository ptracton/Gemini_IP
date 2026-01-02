`ifndef SPI_SEQ_ITEM_SV
`define SPI_SEQ_ITEM_SV

class spi_seq_item extends uvm_sequence_item;

  // SPI Transaction fields
  rand bit [31:0] mosi_data;
  rand bit [31:0] miso_data;
  rand int        data_width;  // 4 to 32
  rand bit        cpol;
  rand bit        cpha;
  rand bit        lsb_first;

  // Control/Status
  bit      [31:0] rx_data;  // What was captured during transaction

  `uvm_object_utils_begin(spi_seq_item)
    `uvm_field_int(mosi_data, UVM_ALL_ON)
    `uvm_field_int(miso_data, UVM_ALL_ON)
    `uvm_field_int(data_width, UVM_ALL_ON)
    `uvm_field_int(cpol, UVM_ALL_ON)
    `uvm_field_int(cpha, UVM_ALL_ON)
    `uvm_field_int(lsb_first, UVM_ALL_ON)
    `uvm_field_int(rx_data, UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name = "spi_seq_item");
    super.new(name);
  endfunction

  constraint width_c {data_width inside {[4 : 32]};}

endclass

`endif
