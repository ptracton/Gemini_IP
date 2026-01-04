/*
 * File: sp_memory_bus_sequences.sv
 * Description: Bus Sequences for SP Memory Verification
 */

// ------------------------------------------------------------------------------
// APB Sequences
// ------------------------------------------------------------------------------
class sp_memory_apb_write_seq extends uvm_sequence #(apb_seq_item);
  `uvm_object_utils(sp_memory_apb_write_seq)

  rand logic [31:0] addr;
  rand logic [31:0] data;
  rand logic [ 3:0] strb;

  constraint c_default {soft strb == 4'b1111;}
  constraint c_aligned {addr[1:0] == 2'b00;}

  function new(string name = "sp_memory_apb_write_seq");
    super.new(name);
  endfunction

  virtual task body();
    req = apb_seq_item::type_id::create("req");
    start_item(req);
    if (!req.randomize() with {
          addr == local:: addr;
          data == local:: data;
          write == 1;
          strb == local:: strb;
        }) begin
      `uvm_error("SEQ", "Randomization failed");
    end
    finish_item(req);
  endtask
endclass

class sp_memory_apb_read_seq extends uvm_sequence #(apb_seq_item);
  `uvm_object_utils(sp_memory_apb_read_seq)

  rand logic [31:0] addr;
  rand logic [ 3:0] strb;
  constraint c_aligned {addr[1:0] == 2'b00;}
  constraint c_default {soft strb == 4'b1111;}
  logic [31:0] rdata;

  function new(string name = "sp_memory_apb_read_seq");
    super.new(name);
  endfunction

  virtual task body();
    req = apb_seq_item::type_id::create("req");
    start_item(req);
    if (!req.randomize() with {
          addr == local:: addr;
          write == 0;
          strb == local:: strb;
        }) begin
      `uvm_error("SEQ", "Randomization failed");
    end
    finish_item(req);
    rdata = req.rdata;
  endtask
endclass

// ------------------------------------------------------------------------------
// AXI Sequences
// ------------------------------------------------------------------------------
class sp_memory_axi_write_seq extends uvm_sequence #(axi_seq_item);
  `uvm_object_utils(sp_memory_axi_write_seq)

  rand bit [31:0] addr;
  rand bit [31:0] data;
  rand bit [ 3:0] strb;

  constraint c_default {soft strb == 4'b1111;}
  constraint c_aligned {addr[1:0] == 2'b00;}

  function new(string name = "sp_memory_axi_write_seq");
    super.new(name);
  endfunction

  virtual task body();
    req = axi_seq_item::type_id::create("req");
    start_item(req);
    if (!req.randomize() with {
          addr == local:: addr;
          data == local:: data;
          write == 1;
          strb == local:: strb;
        }) begin
      `uvm_error("SEQ", "Randomization failed");
    end
    finish_item(req);
  endtask
endclass

class sp_memory_axi_read_seq extends uvm_sequence #(axi_seq_item);
  `uvm_object_utils(sp_memory_axi_read_seq)

  rand bit [31:0] addr;
  rand bit [ 3:0] strb;
  constraint c_aligned {addr[1:0] == 2'b00;}
  constraint c_default {soft strb == 4'b1111;}
  logic [31:0] rdata;

  function new(string name = "sp_memory_axi_read_seq");
    super.new(name);
  endfunction

  virtual task body();
    req = axi_seq_item::type_id::create("req");
    start_item(req);
    if (!req.randomize() with {
          addr == local:: addr;
          write == 0;
          strb == local:: strb;
        }) begin
      `uvm_error("SEQ", "Randomization failed");
    end
    finish_item(req);
    rdata = req.rdata;
  endtask
endclass

// ------------------------------------------------------------------------------
// AHB Sequences
// ------------------------------------------------------------------------------
class sp_memory_ahb_write_seq extends uvm_sequence #(ahb_seq_item);
  `uvm_object_utils(sp_memory_ahb_write_seq)

  rand bit [31:0] addr;
  rand bit [31:0] data;
  rand bit [ 2:0] size;
  rand bit [ 2:0] burst;
  rand bit [ 1:0] trans_type;

  constraint c_aligned {addr[1:0] == 2'b00;}
  constraint c_default {
    soft size == 2;
    soft burst == 0;
    soft trans_type == 2;
  }

  function new(string name = "sp_memory_ahb_write_seq");
    super.new(name);
  endfunction

  virtual task body();
    req = ahb_seq_item::type_id::create("req");
    start_item(req);
    if (!req.randomize() with {
          addr == local:: addr;
          data == local:: data;
          write == 1;
          size == local:: size;
          burst == local:: burst;
          trans_type == local:: trans_type;
        }) begin
      `uvm_error("SEQ", "Randomization failed");
    end
    finish_item(req);
  endtask
endclass

class sp_memory_ahb_read_seq extends uvm_sequence #(ahb_seq_item);
  `uvm_object_utils(sp_memory_ahb_read_seq)

  rand bit [31:0] addr;
  rand bit [ 2:0] size;
  rand bit [ 2:0] burst;
  rand bit [ 1:0] trans_type;

  constraint c_aligned {addr[1:0] == 2'b00;}
  constraint c_default {
    soft size == 2;
    soft burst == 0;
    soft trans_type == 2;
  }
  bit [31:0] rdata;

  function new(string name = "sp_memory_ahb_read_seq");
    super.new(name);
  endfunction

  virtual task body();
    req = ahb_seq_item::type_id::create("req");
    start_item(req);
    if (!req.randomize() with {
          addr == local:: addr;
          write == 0;
          size == local:: size;
          burst == local:: burst;
          trans_type == local:: trans_type;
        }) begin
      `uvm_error("SEQ", "Randomization failed");
    end
    finish_item(req);
    rdata = req.rdata;
  endtask
endclass

// ------------------------------------------------------------------------------
// Wishbone Sequences
// ------------------------------------------------------------------------------
class sp_memory_wb_write_seq extends uvm_sequence #(wb_seq_item);
  `uvm_object_utils(sp_memory_wb_write_seq)

  rand logic [31:0] addr;
  rand logic [31:0] data;
  rand logic [ 3:0] sel;

  constraint c_default {soft sel == 4'b1111;}
  constraint c_aligned {addr[1:0] == 2'b00;}

  function new(string name = "sp_memory_wb_write_seq");
    super.new(name);
  endfunction

  virtual task body();
    req = wb_seq_item::type_id::create("req");
    start_item(req);
    if (!req.randomize() with {
          addr == local:: addr;
          data == local:: data;
          we == 1;
          sel == local:: sel;
        }) begin
      `uvm_error("SEQ", "Randomization failed");
    end
    finish_item(req);
  endtask
endclass

class sp_memory_wb_read_seq extends uvm_sequence #(wb_seq_item);
  `uvm_object_utils(sp_memory_wb_read_seq)

  rand logic [31:0] addr;
  rand logic [ 3:0] sel;
  constraint c_aligned {addr[1:0] == 2'b00;}
  constraint c_default {soft sel == 4'b1111;}
  logic [31:0] rdata;

  function new(string name = "sp_memory_wb_read_seq");
    super.new(name);
  endfunction

  virtual task body();
    req = wb_seq_item::type_id::create("req");
    start_item(req);
    if (!req.randomize() with {
          addr == local:: addr;
          we == 0;
          sel == local:: sel;
        }) begin
      `uvm_error("SEQ", "Randomization failed");
    end
    finish_item(req);
    rdata = req.rdata;
  endtask
endclass
