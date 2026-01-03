/*
 * File: fifo_bus_sequences.sv
 * Description: Bus-specific sequences for Sync FIFO (Stable Version).
 * Author: Gemini-3 AI
 */

class axi_fifo_basic_seq extends uvm_sequence #(axi_seq_item);
  `uvm_object_utils(axi_fifo_basic_seq)
  function new(string name = "axi_fifo_basic_seq");
    super.new(name);
  endfunction

  virtual task body();
    axi_seq_item item;

    // Push 5 items
    for (int i = 0; i < 5; i++) begin
      item = axi_seq_item::type_id::create("item");
      start_item(item);
      item.addr  = 32'h0;
      item.data  = i + 1;
      item.write = 1'b1;
      finish_item(item);
    end

    // Read status
    item = axi_seq_item::type_id::create("item");
    start_item(item);
    item.addr  = 32'h4;
    item.write = 1'b0;
    finish_item(item);

    // Pop 5 items
    for (int i = 0; i < 5; i++) begin
      item = axi_seq_item::type_id::create("item");
      start_item(item);
      item.addr  = 32'h0;
      item.write = 1'b0;
      finish_item(item);
    end
  endtask
endclass

class apb_fifo_basic_seq extends uvm_sequence #(apb_seq_item);
  `uvm_object_utils(apb_fifo_basic_seq)
  function new(string name = "apb_fifo_basic_seq");
    super.new(name);
  endfunction

  virtual task body();
    apb_seq_item item;
    for (int i = 0; i < 5; i++) begin
      item = apb_seq_item::type_id::create("item");
      start_item(item);
      item.addr  = 32'h0;
      item.data  = i + 1;
      item.write = 1'b1;
      finish_item(item);
    end
    for (int i = 0; i < 5; i++) begin
      item = apb_seq_item::type_id::create("item");
      start_item(item);
      item.addr  = 32'h0;
      item.write = 1'b0;
      finish_item(item);
    end
  endtask
endclass

class wb_fifo_basic_seq extends uvm_sequence #(wb_seq_item);
  `uvm_object_utils(wb_fifo_basic_seq)
  function new(string name = "wb_fifo_basic_seq");
    super.new(name);
  endfunction

  virtual task body();
    wb_seq_item item;
    for (int i = 0; i < 5; i++) begin
      item = wb_seq_item::type_id::create("item");
      start_item(item);
      item.addr = 32'h0;
      item.data = i + 1;
      item.we   = 1'b1;
      finish_item(item);
    end
    for (int i = 0; i < 5; i++) begin
      item = wb_seq_item::type_id::create("item");
      start_item(item);
      item.addr = 32'h0;
      item.we   = 1'b0;
      finish_item(item);
    end
  endtask
endclass
