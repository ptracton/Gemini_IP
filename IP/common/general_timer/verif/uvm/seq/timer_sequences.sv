/*
 * File: timer_sequences.sv
 * Description: UVM Sequences for General Timer IP
 */

// Base sequence for Timer IO
class timer_io_seq extends uvm_sequence #(timer_seq_item);
    `uvm_object_utils(timer_io_seq)
    function new(string name = "timer_io_seq"); super.new(name); endfunction

    task body();
        req = timer_seq_item::type_id::create("req");
        start_item(req);
        req.ext_meas_i = 0;
        req.capture_i = 0;
        finish_item(req);
    endtask
endclass

// Base Register Sequence with common tasks
class timer_reg_base_seq #(type T = uvm_sequence_item) extends uvm_sequence #(T);
    function new(string name = "timer_reg_base_seq"); super.new(name); endfunction
    
    // Default body to avoid warnings
    virtual task body();
        `uvm_info("SEQ", "Base register sequence body running", UVM_HIGH)
    endtask
endclass

// Sequence for AXI register access
class timer_axi_reg_seq extends timer_reg_base_seq #(axi_seq_item);
    `uvm_object_utils(timer_axi_reg_seq)
    function new(string name = "timer_axi_reg_seq"); super.new(name); endfunction

    task write_reg(logic [31:0] addr, logic [31:0] data);
        req = axi_seq_item::type_id::create("req");
        start_item(req);
        req.addr = addr;
        req.data = data;
        req.write = 1;
        req.strb = 4'hf;
        finish_item(req);
    endtask

    task read_reg(logic [31:0] addr);
        req = axi_seq_item::type_id::create("req");
        start_item(req);
        req.addr = addr;
        req.write = 0;
        finish_item(req);
    endtask
endclass

// Sequence for APB register access
class timer_apb_reg_seq extends timer_reg_base_seq #(apb_seq_item);
    `uvm_object_utils(timer_apb_reg_seq)
    function new(string name = "timer_apb_reg_seq"); super.new(name); endfunction

    task write_reg(logic [31:0] addr, logic [31:0] data);
        req = apb_seq_item::type_id::create("req");
        start_item(req);
        req.addr = addr;
        req.data = data;
        req.write = 1;
        finish_item(req);
    endtask

    task read_reg(logic [31:0] addr);
        req = apb_seq_item::type_id::create("req");
        start_item(req);
        req.addr = addr;
        req.write = 0;
        finish_item(req);
    endtask
endclass

// Sequence for WB register access
class timer_wb_reg_seq extends timer_reg_base_seq #(wb_seq_item);
    `uvm_object_utils(timer_wb_reg_seq)
    function new(string name = "timer_wb_reg_seq"); super.new(name); endfunction

    task write_reg(logic [31:0] addr, logic [31:0] data);
        req = wb_seq_item::type_id::create("req");
        start_item(req);
        req.addr = addr;
        req.data = data;
        req.we = 1;
        req.sel = 4'hf;
        finish_item(req);
    endtask

    task read_reg(logic [31:0] addr);
        req = wb_seq_item::type_id::create("req");
        start_item(req);
        req.addr = addr;
        req.we = 0;
        finish_item(req);
    endtask
endclass
