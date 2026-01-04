/*
 * File: sp_memory_stress_test.sv
 * Description: Stress Test for Code Coverage
 */
class sp_memory_stress_test extends sp_memory_base_test;
  `uvm_component_utils(sp_memory_stress_test)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    sp_memory_base_seq mem_seq;  // side band
    sp_memory_apb_write_seq write_seq;
    sp_memory_apb_read_seq read_seq;

    int loop_count = 50;

    phase.raise_objection(this);
    `uvm_info("TEST", "Starting Stress Test", UVM_LOW);

    // Start Sideband Sequence
    mem_seq = sp_memory_base_seq::type_id::create("mem_seq");
    if (!mem_seq.randomize()) `uvm_error("SEQ", "Randomize failed");
    mem_seq.start(m_env.m_mem_agent.sequencer);

    for (int i = 0; i < loop_count; i++) begin
      `uvm_info("TEST", $sformatf("Running iteration %0d/%0d", i, loop_count), UVM_LOW);
      rand_rw();
    end

    phase.drop_objection(this);
  endtask

  virtual task rand_rw();
    bit do_write;
    sp_memory_apb_write_seq apb_write_seq;
    sp_memory_apb_read_seq apb_read_seq;
    sp_memory_axi_write_seq axi_write_seq;
    sp_memory_axi_read_seq axi_read_seq;
    sp_memory_ahb_write_seq ahb_write_seq;
    sp_memory_ahb_read_seq ahb_read_seq;
    sp_memory_wb_write_seq wb_write_seq;
    sp_memory_wb_read_seq wb_read_seq;

    do_write = $urandom_range(0, 1);

    case (m_env.bus_type)
      "APB": begin
        if (do_write) begin
          apb_write_seq = sp_memory_apb_write_seq::type_id::create("apb_write_seq");
          void'(apb_write_seq.randomize());
          apb_write_seq.addr = $urandom_range(0, 1023) << 2;
          apb_write_seq.data = $urandom();
          apb_write_seq.strb = 4'b1111;
          apb_write_seq.start(m_env.m_apb_agent.sequencer);
        end else begin
          apb_read_seq = sp_memory_apb_read_seq::type_id::create("apb_read_seq");
          void'(apb_read_seq.randomize());
          apb_read_seq.addr = $urandom_range(0, 1023) << 2;
          apb_read_seq.strb = 4'b1111;
          apb_read_seq.start(m_env.m_apb_agent.sequencer);
        end
      end
      "AXI": begin
        if (do_write) begin
          axi_write_seq = sp_memory_axi_write_seq::type_id::create("axi_write_seq");
          void'(axi_write_seq.randomize());
          axi_write_seq.addr = $urandom_range(0, 1023) << 2;
          axi_write_seq.data = $urandom();
          axi_write_seq.strb = 4'b1111;
          axi_write_seq.start(m_env.m_axi_agent.sequencer);
        end else begin
          axi_read_seq = sp_memory_axi_read_seq::type_id::create("axi_read_seq");
          void'(axi_read_seq.randomize());
          axi_read_seq.addr = $urandom_range(0, 1023) << 2;
          axi_read_seq.strb = 4'b1111;
          axi_read_seq.start(m_env.m_axi_agent.sequencer);
        end
      end
      "AHB": begin
        if (do_write) begin
          ahb_write_seq = sp_memory_ahb_write_seq::type_id::create("ahb_write_seq");
          void'(ahb_write_seq.randomize());
          ahb_write_seq.addr = $urandom_range(0, 1023) << 2;
          ahb_write_seq.data = $urandom();
          ahb_write_seq.size = 2;  // Word
          ahb_write_seq.burst = 0;  // Single
          ahb_write_seq.trans_type = 2;  // NONSEQ
          ahb_write_seq.start(m_env.m_ahb_agent.sequencer);
        end else begin
          ahb_read_seq = sp_memory_ahb_read_seq::type_id::create("ahb_read_seq");
          void'(ahb_read_seq.randomize());
          ahb_read_seq.addr = $urandom_range(0, 1023) << 2;
          ahb_read_seq.size = 2;
          ahb_read_seq.burst = 0;
          ahb_read_seq.trans_type = 2;
          ahb_read_seq.start(m_env.m_ahb_agent.sequencer);
        end
      end
      "WB": begin
        if (do_write) begin
          wb_write_seq = sp_memory_wb_write_seq::type_id::create("wb_write_seq");
          void'(wb_write_seq.randomize());
          wb_write_seq.addr = $urandom_range(0, 1023) << 2;
          wb_write_seq.data = $urandom();
          wb_write_seq.sel  = 4'b1111;
          wb_write_seq.start(m_env.m_wb_agent.sequencer);
        end else begin
          wb_read_seq = sp_memory_wb_read_seq::type_id::create("wb_read_seq");
          void'(wb_read_seq.randomize());
          wb_read_seq.addr = $urandom_range(0, 1023) << 2;
          wb_read_seq.sel  = 4'b1111;
          wb_read_seq.start(m_env.m_wb_agent.sequencer);
        end
      end
      default: `uvm_fatal("TEST", $sformatf("Unknown bus type: %s", m_env.bus_type))
    endcase
  endtask

endclass
