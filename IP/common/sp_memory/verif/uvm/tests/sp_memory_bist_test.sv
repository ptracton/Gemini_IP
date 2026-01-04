/*
 * File: sp_memory_bist_test.sv
 * Description: BIST Verification Test
 */
class sp_memory_bist_test extends sp_memory_base_test;
  `uvm_component_utils(sp_memory_bist_test)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    sp_memory_base_seq mem_seq;

    phase.raise_objection(this);

    `uvm_info("TEST", "Starting BIST Test", UVM_LOW);

    // Start Sideband Sequence with BIST ENABLED
    mem_seq = sp_memory_base_seq::type_id::create("mem_seq");
    if (!mem_seq.randomize() with {
          sleep == 0;
          bist_en == 1;
        }) begin
      `uvm_error("SEQ", "Randomization failed");
    end
    mem_seq.start(m_env.m_mem_agent.sequencer);

    // BIST takes time proportional to DEPTH
    // Wait for BIST DONE signal from monitor (via event or polling)
    // For simplicity, we wait for a sufficient time
    #100000ns;

    // Check Status
    if (m_env.m_scoreboard.current_status.bist_done !== 1) begin
      `uvm_error("TEST", "BIST did not complete in time!");
    end else if (m_env.m_scoreboard.current_status.bist_pass !== 1) begin
      `uvm_error("TEST", "BIST Reported Failure!");
    end else begin
      `uvm_info("TEST", "BIST Passed Successfully", UVM_LOW);
    end

    // Drop bist_en to cover transition back to IDLE
    if (!mem_seq.randomize() with {
          sleep == 0;
          bist_en == 0;
        }) begin
      `uvm_error("SEQ", "Randomization failed");
    end
    mem_seq.start(m_env.m_mem_agent.sequencer);
    #100ns;

    phase.drop_objection(this);
  endtask

endclass
