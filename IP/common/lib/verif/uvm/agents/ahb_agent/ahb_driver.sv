/*
 * File: ahb_driver.sv
 * Description: AHB Driver (Pipelined)
 */

class ahb_driver extends uvm_driver #(ahb_seq_item);
    `uvm_component_utils(ahb_driver)

    virtual ahb_if vif;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual ahb_if)::get(this, "", "vif", vif))
            `uvm_fatal("NO_VIF", {"virtual interface must be set for: ", get_full_name(), ".vif"});
    endfunction

    task run_phase(uvm_phase phase);
        // Reset
        vif.cb.hsel   <= 0;
        vif.cb.htrans <= 0; // IDLE
        vif.cb.hwrite <= 0;
        vif.cb.haddr  <= 0;
        vif.cb.hwdata <= 0;
        
        wait(vif.hresetn == 1);
        
        forever begin
            seq_item_port.get_next_item(req);
            drive_transfer(req);
            seq_item_port.item_done();
        end
    endtask

    task drive_transfer(ahb_seq_item item);
        // Address Phase
        @ (vif.cb);
        wait (vif.cb.hready === 1); // Wait for previous to finish?
        
        vif.cb.haddr  <= item.addr;
        vif.cb.htrans <= 2; // NONSEQ
        vif.cb.hwrite <= item.write;
        vif.cb.hsize  <= item.size;
        vif.cb.hburst <= item.burst;
        vif.cb.hsel   <= 1;
        vif.cb.hprot  <= 1; // Data access
        
        // Wait for Address Phase acceptance
        @ (vif.cb);
        while (vif.cb.hready !== 1) @ (vif.cb);
        
        // Data Phase
        // Clear Address Phase
        vif.cb.htrans <= 0; // IDLE
        vif.cb.hsel   <= 0; // Deselect (simplification for single transaction)
        
        if (item.write) begin
            vif.cb.hwdata <= item.data;
        end
        
        // Wait for Data Phase completion
        @ (vif.cb);
        while (vif.cb.hready !== 1) @ (vif.cb);
        
        // Capture Read Data / Response
        if (!item.write) begin
            item.rdata = vif.cb.hrdata;
        end
        item.resp = vif.cb.hresp;
        
        // Cleanup WDATA
        vif.cb.hwdata <= 0;
        
    endtask

endclass
