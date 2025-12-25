/*
 * File: bus_matrix_scoreboard.sv
 * Description: Bus Matrix Scoreboard
 */

class bus_matrix_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(bus_matrix_scoreboard)

    // Analysis Exports (connecting to Monitor ports)
    uvm_analysis_imp #(uvm_sequence_item, bus_matrix_scoreboard) item_collected_export;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        item_collected_export = new("item_collected_export", this);
    endfunction

    virtual function void write(uvm_sequence_item item);
        `uvm_info("SCBD", $sformatf("Received transaction: %s", item.sprint()), UVM_LOW);
        // TODO: Implement Address Decoding check
        // TODO: Implement Routing check
    endfunction

endclass
