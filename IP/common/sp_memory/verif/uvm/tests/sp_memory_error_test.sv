/*
 * File: sp_memory_error_test.sv
 * Description: Test for Error Detection Logic (DECERR, ECC, Parity)
 */
class sp_memory_error_test extends sp_memory_base_test;
  `uvm_component_utils(sp_memory_error_test)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_info("TEST", "Starting Error Injection Test", UVM_LOW);

    // 1. DECERR Test (Out-of-Bounds Access)
    test_decerr();

    // 2. Parity/ECC Detection (Requires HDL access or specific sequences)
    // For now, focus on bus-level errors

    phase.drop_objection(this);
  endtask

  virtual task test_decerr();
    sp_memory_apb_write_seq apb_err_seq;
    sp_memory_axi_write_seq axi_err_seq;

    `uvm_info("TEST", "Testing DECERR / SLVERR", UVM_LOW);

    case (m_env.bus_type)
      "APB": begin
        apb_err_seq = sp_memory_apb_write_seq::type_id::create("apb_err_seq");
        void'(apb_err_seq.randomize());
        apb_err_seq.addr = 32'hFFFF_0000;  // Far out of bounds
        apb_err_seq.start(m_env.m_apb_agent.sequencer);
      end
      "AXI": begin
        axi_err_seq = sp_memory_axi_write_seq::type_id::create("axi_err_seq");
        void'(axi_err_seq.randomize());
        axi_err_seq.addr = 32'hFFFF_0000;  // Far out of bounds
        axi_err_seq.start(m_env.m_axi_agent.sequencer);
      end
      default: `uvm_info("TEST", "DECERR test not implemented for this bus", UVM_LOW)
    endcase
  endtask

endclass
