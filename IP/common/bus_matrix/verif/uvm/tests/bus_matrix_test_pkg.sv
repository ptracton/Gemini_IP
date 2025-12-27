/*
 * File: bus_matrix_test_pkg.sv
 * Description: Bus Matrix Test Package (Multi-Master/Slave)
 */

package bus_matrix_test_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import axi_agent_pkg::*;
  import ahb_agent_pkg::*;
  import wb_agent_pkg::*;
  import bus_matrix_env_pkg::*;
  import bus_matrix_seq_pkg::*;

  // --- Base Test ---
  class bus_matrix_base_test extends uvm_test;
    `uvm_component_utils(bus_matrix_base_test)

    bus_matrix_env env;

    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      // Configure Slave Agents (Active Slaves)
      uvm_config_db#(bit)::set(this, "env.s_ahb_agent_0", "is_slave", 1);
      uvm_config_db#(bit)::set(this, "env.s_ahb_agent_1", "is_slave", 1);
      uvm_config_db#(bit)::set(this, "env.s_axi_agent_0", "is_slave", 1);
      uvm_config_db#(bit)::set(this, "env.s_axi_agent_1", "is_slave", 1);
      uvm_config_db#(bit)::set(this, "env.s_wb_agent_0", "is_slave", 1);
      uvm_config_db#(bit)::set(this, "env.s_wb_agent_1", "is_slave", 1);

      env = bus_matrix_env::type_id::create("env", this);
    endfunction

    function void init_vseq(bus_matrix_base_vseq vseq);
      vseq.axi_sqr_0 = env.m_axi_agent_0.sequencer;
      vseq.axi_sqr_1 = env.m_axi_agent_1.sequencer;
      vseq.ahb_sqr_0 = env.m_ahb_agent_0.sequencer;
      vseq.ahb_sqr_1 = env.m_ahb_agent_1.sequencer;
      vseq.wb_sqr_0  = env.m_wb_agent_0.sequencer;
      vseq.wb_sqr_1  = env.m_wb_agent_1.sequencer;
    endfunction

    task start_slave_responders();
      axi_slave_resp_seq axi_s0, axi_s1;
      ahb_slave_resp_seq ahb_s0, ahb_s1;
      wb_slave_resp_seq wb_s0, wb_s1;
      axi_s0 = axi_slave_resp_seq::type_id::create("axi_s0");
      axi_s1 = axi_slave_resp_seq::type_id::create("axi_s1");
      ahb_s0 = ahb_slave_resp_seq::type_id::create("ahb_s0");
      ahb_s1 = ahb_slave_resp_seq::type_id::create("ahb_s1");
      wb_s0  = wb_slave_resp_seq::type_id::create("wb_s0");
      wb_s1  = wb_slave_resp_seq::type_id::create("wb_s1");
      fork
        axi_s0.start(env.s_axi_agent_0.sequencer);
        axi_s1.start(env.s_axi_agent_1.sequencer);
        ahb_s0.start(env.s_ahb_agent_0.sequencer);
        ahb_s1.start(env.s_ahb_agent_1.sequencer);
        wb_s0.start(env.s_wb_agent_0.sequencer);
        wb_s1.start(env.s_wb_agent_1.sequencer);
      join_none
    endtask
  endclass

  // --- Random Test ---
  class bus_matrix_rand_test extends bus_matrix_base_test;
    `uvm_component_utils(bus_matrix_rand_test)

    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction

    task run_phase(uvm_phase phase);
      bus_matrix_rand_vseq vseq;
      phase.raise_objection(this);
      start_slave_responders();

      vseq = bus_matrix_rand_vseq::type_id::create("vseq");
      init_vseq(vseq);
      vseq.start(null);

      #100;
      phase.drop_objection(this);
    endtask
  endclass

  // --- Error Test ---
  class bus_matrix_error_test extends bus_matrix_base_test;
    `uvm_component_utils(bus_matrix_error_test)

    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction

    task run_phase(uvm_phase phase);
      bus_matrix_error_vseq vseq;
      phase.raise_objection(this);
      start_slave_responders();

      vseq = bus_matrix_error_vseq::type_id::create("vseq");
      init_vseq(vseq);
      vseq.start(null);

      #100;
      phase.drop_objection(this);
    endtask
  endclass

  // --- Contention Test ---
  class bus_matrix_contention_test extends bus_matrix_base_test;
    `uvm_component_utils(bus_matrix_contention_test)

    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction

    task run_phase(uvm_phase phase);
      bus_matrix_contention_vseq vseq;
      phase.raise_objection(this);
      start_slave_responders();

      vseq = bus_matrix_contention_vseq::type_id::create("vseq");
      init_vseq(vseq);
      // Repeat contention multiple times - Increased for coverage
      repeat (100) begin
        vseq.start(null);
      end

      #100;
      phase.drop_objection(this);
    endtask
  endclass

  // --- Stress Test ---
  class bus_matrix_stress_test extends bus_matrix_base_test;
    `uvm_component_utils(bus_matrix_stress_test)

    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction

    task run_phase(uvm_phase phase);
      bus_matrix_rand_vseq r_vseq;
      bus_matrix_error_vseq e_vseq;
      bus_matrix_contention_vseq c_vseq;

      phase.raise_objection(this);
      start_slave_responders();

      r_vseq = bus_matrix_rand_vseq::type_id::create("r_vseq");
      e_vseq = bus_matrix_error_vseq::type_id::create("e_vseq");
      c_vseq = bus_matrix_contention_vseq::type_id::create("c_vseq");

      init_vseq(r_vseq);
      init_vseq(e_vseq);
      init_vseq(c_vseq);

      fork
        r_vseq.start(null);
        repeat (5) e_vseq.start(null);
        repeat (50) c_vseq.start(null);
      join

      #100;
      phase.drop_objection(this);
    endtask
  endclass

endpackage
