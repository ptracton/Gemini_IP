/*
 * File: bus_matrix_sequences.sv
 * Description: Bus Matrix Virtual Sequences
 */

class bus_matrix_rand_vseq extends uvm_sequence;
    `uvm_object_utils(bus_matrix_rand_vseq)

    // Sequencer Handles
    uvm_sequencer #(axi_seq_item) axi_seqr;
    uvm_sequencer #(ahb_seq_item) ahb_seqr;
    uvm_sequencer #(wb_seq_item)  wb_seqr;

    function new(string name="bus_matrix_rand_vseq");
        super.new(name);
    endfunction

    task body();
        axi_rand_seq axi_seq;
        ahb_rand_seq ahb_seq;
        wb_rand_seq  wb_seq; 
        
        // Fork off sequences on all masters
        fork
            begin
                if (axi_seqr != null) begin
                    axi_seq = axi_rand_seq::type_id::create("axi_seq");
                    if (!axi_seq.randomize()) `uvm_error("RND", "AXI Seq Rand Failed");
                    axi_seq.start(axi_seqr);
                end
            end
            begin
                if (ahb_seqr != null) begin
                    ahb_seq = ahb_rand_seq::type_id::create("ahb_seq");
                    if (!ahb_seq.randomize()) `uvm_error("RND", "AHB Seq Rand Failed");
                    ahb_seq.start(ahb_seqr);
                end
            end
            begin
                if (wb_seqr != null) begin
                    wb_seq = wb_rand_seq::type_id::create("wb_seq");
                    if (!wb_seq.randomize()) `uvm_error("RND", "WB Seq Rand Failed");
                    wb_seq.start(wb_seqr);
                end
            end
        join
    endtask
endclass
