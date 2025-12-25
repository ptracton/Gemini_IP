/*
 * File: ahb_seq_item.sv
 * Description: AHB Sequence Item
 */

class ahb_seq_item extends uvm_sequence_item;
    
    rand bit [31:0] addr;
    rand bit [31:0] data;
    rand bit        write; // 1=Write, 0=Read
    rand bit [2:0]  size;  // 2=32bit
    rand bit [2:0]  burst; // 0=Single
    
    // Output
    bit [31:0] rdata;
    bit        resp;

    `uvm_object_utils_begin(ahb_seq_item)
        `uvm_field_int(addr, UVM_ALL_ON)
        `uvm_field_int(data, UVM_ALL_ON)
        `uvm_field_int(write, UVM_ALL_ON)
        `uvm_field_int(size, UVM_ALL_ON)
        `uvm_field_int(burst, UVM_ALL_ON)
        `uvm_field_int(rdata, UVM_ALL_ON)
        `uvm_field_int(resp, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "ahb_seq_item");
        super.new(name);
    endfunction
    
    constraint c_size { size == 2; } // Default 32-bit for now
    constraint c_burst { burst == 0; } // Default SINGLE

endclass
