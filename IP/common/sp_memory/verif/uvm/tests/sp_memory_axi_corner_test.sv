/*
 * File: sp_memory_axi_corner_test.sv
 * Description: Corner case test for AXI Protocol (Stalls, Bursts)
 */
class sp_memory_axi_corner_test extends sp_memory_base_test;
  `uvm_component_utils(sp_memory_axi_corner_test)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    sp_memory_axi_write_seq write_seq;
    sp_memory_axi_read_seq  read_seq;

    phase.raise_objection(this);
    `uvm_info("TEST", "Starting AXI Corner Test", UVM_LOW);

    if (m_env.bus_type != "AXI") begin
      `uvm_warning("TEST", "AXI Corner Test only valid for AXI bus")
    end else begin
      // Perform many reads and writes to hit various stall combinations
      repeat (100) begin
        bit do_write = $urandom_range(0, 1);
        if (do_write) begin
          write_seq = sp_memory_axi_write_seq::type_id::create("write_seq");
          void'(write_seq.randomize());
          write_seq.addr = $urandom_range(0, 1023) << 2;
          write_seq.start(m_env.m_axi_agent.sequencer);
        end else begin
          read_seq = sp_memory_axi_read_seq::type_id::create("read_seq");
          void'(read_seq.randomize());
          read_seq.addr = $urandom_range(0, 1023) << 2;
          read_seq.start(m_env.m_axi_agent.sequencer);
        end
      end
    end

    phase.drop_objection(this);
  endtask
endclass
