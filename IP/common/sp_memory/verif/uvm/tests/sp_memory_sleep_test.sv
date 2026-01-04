/*
 * File: sp_memory_sleep_test.sv
 * Description: Sleep Mode Verification Test
 */
class sp_memory_sleep_test extends sp_memory_base_test;
  `uvm_component_utils(sp_memory_sleep_test)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    sp_memory_base_seq mem_seq;
    sp_memory_apb_write_seq write_seq;
    sp_memory_apb_read_seq read_seq;

    logic [31:0] test_addr = 32'h0000_0100;  // random address
    logic [31:0] data_A = 32'hAAAAAAAA;
    logic [31:0] data_B = 32'hBBBBBBBB;

    phase.raise_objection(this);

    `uvm_info("TEST", "Starting Sleep Test", UVM_LOW);

    if (m_env.bus_type == "APB") begin

      // 1. Ensure Sleep is OFF
      mem_seq = sp_memory_base_seq::type_id::create("mem_seq");
      if (!mem_seq.randomize() with {sleep == 0;}) `uvm_error("SEQ", "Rand failed");
      mem_seq.start(m_env.m_mem_agent.sequencer);

      // 2. Write Data A
      write_seq = sp_memory_apb_write_seq::type_id::create("write_seq");
      if (!write_seq.randomize() with {
            addr == test_addr;
            data == data_A;
          })
        `uvm_error("SEQ", "Rand failed");
      write_seq.start(m_env.m_apb_agent.sequencer);

      // 3. Enable Sleep
      `uvm_info("TEST", "Enabling Sleep Mode", UVM_LOW);
      if (!mem_seq.randomize() with {sleep == 1;}) `uvm_error("SEQ", "Rand failed");
      mem_seq.start(m_env.m_mem_agent.sequencer);
      #100ns;

      // 4. Attempt Write Data B (Should be ignored)
      write_seq = sp_memory_apb_write_seq::type_id::create("write_seq");
      if (!write_seq.randomize() with {
            addr == test_addr;
            data == data_B;
          })
        `uvm_error("SEQ", "Rand failed");
      write_seq.start(m_env.m_apb_agent.sequencer);

      // 5. Disable Sleep
      `uvm_info("TEST", "Disabling Sleep Mode", UVM_LOW);
      if (!mem_seq.randomize() with {sleep == 0;}) `uvm_error("SEQ", "Rand failed");
      mem_seq.start(m_env.m_mem_agent.sequencer);
      #100ns;

      // 6. Read Address (Should be Data A)
      read_seq = sp_memory_apb_read_seq::type_id::create("read_seq");
      if (!read_seq.randomize() with {addr == test_addr;}) `uvm_error("SEQ", "Rand failed");
      read_seq.start(m_env.m_apb_agent.sequencer);

      if (read_seq.rdata !== data_A) begin
        `uvm_error("TEST", $sformatf(
                   "Sleep Failed! Data overwritten. Exp: %h, Got: %h", data_A, read_seq.rdata));
      end else begin
        `uvm_info("TEST", "Sleep Mode Verified: Data Retained and Write Ignored.", UVM_LOW);
      end

    end else begin
      `uvm_warning("TEST", "Sleep Test implemented for APB only.");
    end

    phase.drop_objection(this);
  endtask

endclass
