/*
 * File: sp_memory_access_test.sv
 * Description: Basic Access Test (Write then Read)
 */
class sp_memory_access_test extends sp_memory_base_test;
  `uvm_component_utils(sp_memory_access_test)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    sp_memory_base_seq mem_seq;

    phase.raise_objection(this);

    // Start Sideband Sequence (Idle)
    mem_seq = sp_memory_base_seq::type_id::create("mem_seq");
    mem_seq.start(m_env.m_mem_agent.sequencer);

    // Run Bus specific sequences depending on configuration
    // This is a simplified example. Realistically we would factory override or select based on string.
    if (m_env.bus_type == "AXI") begin
      // Run AXI Sequence from shared lib or local
      // For now, let's assume we have a basic write/read sequence in shared lib or we define one here
      // axi_write_read_seq seq = axi_write_read_seq::type_id::create("seq");
      // seq.start(m_env.m_axi_agent.sequencer);
      `uvm_info("TEST", "AXI Test Started (Placeholder)", UVM_LOW);
    end else if (m_env.bus_type == "APB") begin
      // apb_write_read_seq seq = ...)
      `uvm_info("TEST", "APB Test Started (Placeholder)", UVM_LOW);
    end else if (m_env.bus_type == "WB") begin
      `uvm_info("TEST", "WB Test Started (Placeholder)", UVM_LOW);
    end else if (m_env.bus_type == "AHB") begin
      `uvm_info("TEST", "AHB Test Started (Placeholder)", UVM_LOW);
    end

    #1000ns;
    phase.drop_objection(this);
  endtask

endclass
