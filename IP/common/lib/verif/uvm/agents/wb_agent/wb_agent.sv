/*
 * File: wb_agent.sv
 * Description: Wishbone Agent
 */

class wb_agent extends uvm_agent;
    `uvm_component_utils(wb_agent)

    wb_driver    driver;
    uvm_sequencer #(wb_seq_item) sequencer;
    wb_monitor   monitor;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        monitor = wb_monitor::type_id::create("monitor", this);
        if (get_is_active() == UVM_ACTIVE) begin
            driver = wb_driver::type_id::create("driver", this);
            sequencer = uvm_sequencer#(wb_seq_item)::type_id::create("sequencer", this);
        end
    endfunction

    function void connect_phase(uvm_phase phase);
        if (get_is_active() == UVM_ACTIVE) begin
            driver.seq_item_port.connect(sequencer.seq_item_export);
        end
    endfunction

endclass
