/*
 * File: axi_seq.sv
 * Description: AXI Base Sequences
 */

class axi_base_seq extends uvm_sequence #(axi_seq_item);
    `uvm_object_utils(axi_base_seq)

    function new(string name="axi_base_seq");
        super.new(name);
    endfunction
endclass

class axi_rand_seq extends axi_base_seq;
    `uvm_object_utils(axi_rand_seq)
    
    rand int count;
    constraint c_count { count inside {[1:10]}; }

    function new(string name="axi_rand_seq");
        super.new(name);
    endfunction

    task body();
        repeat(count) begin
            req = axi_seq_item::type_id::create("req");
            start_item(req);
            if (!req.randomize()) begin
                `uvm_error("RNDFAIL", "AXI Randomization failed")
            end
            finish_item(req);
        end
    endtask
endclass
