/*
 * File: sp_memory_ecc_test.sv
 * Description: ECC Verification Test
 */
class sp_memory_ecc_test extends sp_memory_base_test;
  `uvm_component_utils(sp_memory_ecc_test)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    sp_memory_base_seq mem_seq;  // sideband
    sp_memory_apb_write_seq write_seq;
    sp_memory_apb_read_seq read_seq;

    string mem_path = "tb_top.dut.core_inst.gen_generic_ram.mem";
    logic [31:0] write_data = 32'h12345678;
    logic [31:0] read_data;

    phase.raise_objection(this);

    `uvm_info("TEST", "Starting ECC Test", UVM_LOW);

    if (m_env.bus_type == "APB") begin
      // 1. Write Data to Address 0
      write_seq = sp_memory_apb_write_seq::type_id::create("write_seq");
      if (!write_seq.randomize() with {
            addr == 0;
            data == write_data;
          })
        `uvm_error("SEQ", "Randomize failed");
      write_seq.start(m_env.m_apb_agent.sequencer);

      #100ns;

      // 2. Force Single Bit Error (Flip bit 0 of word 0)
      `uvm_info("TEST", "Injecting Single Bit Error via Backdoor", UVM_LOW);

      if (!uvm_hdl_force({mem_path, "[0][0]"}, 1'b1)) begin
        `uvm_error("TEST", "Backdoor Force Failed! check path.");
      end else begin
        `uvm_info("TEST", "Force Successful", UVM_LOW);
      end

      #100ns;

      // 3. Read Data -> Expect Correction
      read_seq = sp_memory_apb_read_seq::type_id::create("read_seq");
      if (!read_seq.randomize() with {addr == 0;}) `uvm_error("SEQ", "Randomize failed");
      read_seq.start(m_env.m_apb_agent.sequencer);

      if (read_seq.rdata !== write_data) begin
        `uvm_error("TEST", $sformatf(
                   "Data Mismatch! Expected: %h, Got: %h", write_data, read_seq.rdata));
      end else begin
        `uvm_info("TEST", "Data Correctly Corrected!", UVM_LOW);
      end

      // 4. Check Error Flag
      #100ns;
      if (m_env.m_scoreboard.current_status.err_ecc_single !== 1) begin
        `uvm_error("TEST", "Single ECC Error Flag NOT Detected!");
      end else begin
        `uvm_info("TEST", "Single ECC Error Flag Detected!", UVM_LOW);
      end

      // 5. Release Force
      // if (!uvm_hdl_release({mem_path, "[0][0]"})) `uvm_error("TEST", "Release failed");

    end else begin
      `uvm_warning("TEST", {"ECC Test NOT implemented for BUS_TYPE: ", m_env.bus_type});
    end

    phase.drop_objection(this);
  endtask

endclass
