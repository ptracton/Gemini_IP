/*
 * File: axi_monitor.sv
 * Description: AXI Monitor
 */

class axi_monitor extends uvm_monitor;
    `uvm_component_utils(axi_monitor)

    virtual axi_if vif;
    uvm_analysis_port #(axi_seq_item) item_collected_port;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        item_collected_port = new("item_collected_port", this);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual axi_if)::get(this, "", "vif", vif))
            `uvm_fatal("NO_VIF", {"virtual interface must be set for: ", get_full_name(), ".vif"});
    endfunction

    task run_phase(uvm_phase phase);
        forever begin
            axi_seq_item item;
            
            // Allow time to advance
            @(posedge vif.aclk);

            // Check for Write Address + Write Data Valid (Simple monitor assuming lockstep for now)
            // A more robust monitor handles out-of-order aw/w, but for GPIO IP tests, driver does them in parallel.
            // We'll latch AW and W info.
            
            if (vif.awvalid && vif.awready && vif.wvalid && vif.wready) begin
                item = axi_seq_item::type_id::create("item");
                item.write = 1;
                item.addr  = vif.awaddr;
                item.data  = vif.wdata;
                item.strb  = vif.wstrb;
                // Push item immediately upon handshake so Scoreboard updates before GPIO output changes.
                item_collected_port.write(item);
                
                // Wait for BVALID (just to consume logic)
                do begin
                    @(posedge vif.aclk);
                end while (!vif.bvalid || !vif.bready);
                // item.resp = vif.bresp; // Resp arrived too late for this item push.
            end

            // Check for Read Address Valid
            if (vif.arvalid && vif.arready) begin
                item = axi_seq_item::type_id::create("item");
                item.write = 0;
                item.addr  = vif.araddr;
                // Wait for RVALID
                do begin
                    @(posedge vif.aclk);
                end while (!vif.rvalid || !vif.rready);
                item.rdata = vif.rdata;
                item.resp  = vif.rresp;
                item_collected_port.write(item);
            end
        end
    endtask

endclass
