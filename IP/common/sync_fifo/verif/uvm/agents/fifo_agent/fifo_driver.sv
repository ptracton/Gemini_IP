/*
 * File: fifo_driver.sv
 * Description: Driver for FIFO agent.
 * Author: Gemini-3 AI
 */

class fifo_driver #(
    parameter int WIDTH = 32
) extends uvm_driver #(fifo_seq_item #(WIDTH));
  virtual fifo_if #(WIDTH) vif;

  `uvm_component_param_utils(fifo_driver#(WIDTH))

  function new(string name = "fifo_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual fifo_if #(WIDTH))::get(this, "", "vif", vif))
      `uvm_fatal("DRV", "Could not get vif")
  endfunction

  virtual task run_phase(uvm_phase phase);
    vif.drv_cb.push    <= 0;
    vif.drv_cb.pop     <= 0;
    vif.drv_cb.flush   <= 0;
    vif.drv_cb.data_in <= 0;

    wait (vif.rst_n === 1'b1);
    @(vif.drv_cb);

    forever begin
      seq_item_port.get_next_item(req);
      drive_item(req);
      seq_item_port.item_done();
    end
  endtask

  virtual task drive_item(fifo_seq_item#(WIDTH) item);
    @(vif.drv_cb);
    vif.drv_cb.push  <= 0;
    vif.drv_cb.pop   <= 0;
    vif.drv_cb.flush <= 0;

    case (item.op)
      fifo_seq_item#(WIDTH)::PUSH: begin
        vif.drv_cb.push    <= 1;
        vif.drv_cb.data_in <= item.data_in;
      end
      fifo_seq_item#(WIDTH)::POP: begin
        vif.drv_cb.pop <= 1;
      end
      fifo_seq_item#(WIDTH)::PUSH_POP: begin
        vif.drv_cb.push    <= 1;
        vif.drv_cb.pop     <= 1;
        vif.drv_cb.data_in <= item.data_in;
      end
      fifo_seq_item#(WIDTH)::FLUSH: begin
        vif.drv_cb.flush <= 1;
      end
      default: ;
    endcase
  endtask

endclass
