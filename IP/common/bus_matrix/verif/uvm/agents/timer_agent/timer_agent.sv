/*
 * File: bus_matrix_agent.sv
 * Description: UVM Agent for Timer specific IO
 */
class bus_matrix_agent extends uvm_agent;
    `uvm_component_utils(bus_matrix_agent)

    bus_matrix_driver    driver;
    bus_matrix_monitor   monitor;
    uvm_sequencer #(bus_matrix_seq_item) sequencer;

    function new(string name = "bus_matrix_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        monitor = bus_matrix_monitor::type_id::create("monitor", this);
        if (get_is_active() == UVM_ACTIVE) begin
            driver = bus_matrix_driver::type_id::create("driver", this);
            sequencer = uvm_sequencer#(bus_matrix_seq_item)::type_id::create("sequencer", this);
        end
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        if (get_is_active() == UVM_ACTIVE) begin
            driver.seq_item_port.connect(sequencer.seq_item_export);
        end
    endfunction

endclass
