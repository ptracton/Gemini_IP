import uvm_pkg::*;
`include "uvm_macros.svh"
import bus_matrix_pkg::*;
import axi_agent_pkg::*;
import ahb_agent_pkg::*;
import wb_agent_pkg::*;

`uvm_analysis_imp_decl(_m_axi_0)
`uvm_analysis_imp_decl(_m_axi_1)
`uvm_analysis_imp_decl(_s_axi_0)
`uvm_analysis_imp_decl(_s_axi_1)

`uvm_analysis_imp_decl(_m_ahb_0)
`uvm_analysis_imp_decl(_m_ahb_1)
`uvm_analysis_imp_decl(_s_ahb_0)
`uvm_analysis_imp_decl(_s_ahb_1)

`uvm_analysis_imp_decl(_m_wb_0)
`uvm_analysis_imp_decl(_m_wb_1)
`uvm_analysis_imp_decl(_s_wb_0)
`uvm_analysis_imp_decl(_s_wb_1)

class bus_matrix_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(bus_matrix_scoreboard)

  // Analysis Exports
  uvm_analysis_imp_m_axi_0 #(axi_seq_item, bus_matrix_scoreboard) m_axi_0_export;
  uvm_analysis_imp_m_axi_1 #(axi_seq_item, bus_matrix_scoreboard) m_axi_1_export;
  uvm_analysis_imp_s_axi_0 #(axi_seq_item, bus_matrix_scoreboard) s_axi_0_export;
  uvm_analysis_imp_s_axi_1 #(axi_seq_item, bus_matrix_scoreboard) s_axi_1_export;

  uvm_analysis_imp_m_ahb_0 #(ahb_seq_item, bus_matrix_scoreboard) m_ahb_0_export;
  uvm_analysis_imp_m_ahb_1 #(ahb_seq_item, bus_matrix_scoreboard) m_ahb_1_export;
  uvm_analysis_imp_s_ahb_0 #(ahb_seq_item, bus_matrix_scoreboard) s_ahb_0_export;
  uvm_analysis_imp_s_ahb_1 #(ahb_seq_item, bus_matrix_scoreboard) s_ahb_1_export;

  uvm_analysis_imp_m_wb_0 #(wb_seq_item, bus_matrix_scoreboard) m_wb_0_export;
  uvm_analysis_imp_m_wb_1 #(wb_seq_item, bus_matrix_scoreboard) m_wb_1_export;
  uvm_analysis_imp_s_wb_0 #(wb_seq_item, bus_matrix_scoreboard) s_wb_0_export;
  uvm_analysis_imp_s_wb_1 #(wb_seq_item, bus_matrix_scoreboard) s_wb_1_export;

  // Expectation Queues (one per slave)
  axi_seq_item axi_exp_q[2][$];
  ahb_seq_item ahb_exp_q[2][$];
  wb_seq_item wb_exp_q[2][$];

  // Stats
  int match_count = 0;
  int mismatch_count = 0;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    m_axi_0_export = new("m_axi_0_export", this);
    m_axi_1_export = new("m_axi_1_export", this);
    s_axi_0_export = new("s_axi_0_export", this);
    s_axi_1_export = new("s_axi_1_export", this);

    m_ahb_0_export = new("m_ahb_0_export", this);
    m_ahb_1_export = new("m_ahb_1_export", this);
    s_ahb_0_export = new("s_ahb_0_export", this);
    s_ahb_1_export = new("s_ahb_1_export", this);

    m_wb_0_export  = new("m_wb_0_export", this);
    m_wb_1_export  = new("m_wb_1_export", this);
    s_wb_0_export  = new("s_wb_0_export", this);
    s_wb_1_export  = new("s_wb_1_export", this);
  endfunction

  // Decoding Logic Helper
  function int decode_addr(logic [31:0] addr);
    if (addr >= 32'h0000_0000 && addr <= 32'h0FFF_FFFF) return 0;
    if (addr >= 32'h1000_0000 && addr <= 32'h1FFF_FFFF) return 1;
    return -1;  // Decode Error
  endfunction

  // Master Writers
  virtual function void write_m_axi_0(axi_seq_item item);
    int slv = decode_addr(item.addr);
    if (slv >= 0) axi_exp_q[slv].push_back(item);
    else
      `uvm_info("SCBD", $sformatf("AXI M0: Illegal Address 0x%0h (ignored)", item.addr), UVM_HIGH)
  endfunction
  virtual function void write_m_axi_1(axi_seq_item item);
    int slv = decode_addr(item.addr);
    if (slv >= 0) axi_exp_q[slv].push_back(item);
    else
      `uvm_info("SCBD", $sformatf("AXI M1: Illegal Address 0x%0h (ignored)", item.addr), UVM_HIGH)
  endfunction

  virtual function void write_m_ahb_0(ahb_seq_item item);
    int slv = decode_addr(item.addr);
    if (slv >= 0) ahb_exp_q[slv].push_back(item);
    else
      `uvm_info("SCBD", $sformatf("AHB M0: Illegal Address 0x%0h (ignored)", item.addr), UVM_HIGH)
  endfunction
  virtual function void write_m_ahb_1(ahb_seq_item item);
    int slv = decode_addr(item.addr);
    if (slv >= 0) ahb_exp_q[slv].push_back(item);
    else
      `uvm_info("SCBD", $sformatf("AHB M1: Illegal Address 0x%0h (ignored)", item.addr), UVM_HIGH)
  endfunction

  virtual function void write_m_wb_0(wb_seq_item item);
    int slv = decode_addr(item.addr);
    if (slv >= 0) wb_exp_q[slv].push_back(item);
    else `uvm_info("SCBD", $sformatf("WB M0: Illegal Address 0x%0h (ignored)", item.addr), UVM_HIGH)
  endfunction
  virtual function void write_m_wb_1(wb_seq_item item);
    int slv = decode_addr(item.addr);
    if (slv >= 0) wb_exp_q[slv].push_back(item);
    else `uvm_info("SCBD", $sformatf("WB M1: Illegal Address 0x%0h (ignored)", item.addr), UVM_HIGH)
  endfunction

  // Slave Writers (Checkers)
  virtual function void write_s_axi_0(axi_seq_item item);
    check_axi(0, item);
  endfunction
  virtual function void write_s_axi_1(axi_seq_item item);
    check_axi(1, item);
  endfunction
  virtual function void write_s_ahb_0(ahb_seq_item item);
    check_ahb(0, item);
  endfunction
  virtual function void write_s_ahb_1(ahb_seq_item item);
    check_ahb(1, item);
  endfunction
  virtual function void write_s_wb_0(wb_seq_item item);
    check_wb(0, item);
  endfunction
  virtual function void write_s_wb_1(wb_seq_item item);
    check_wb(1, item);
  endfunction

  function void check_axi(int slave_idx, axi_seq_item item);
    axi_seq_item exp;
    if (axi_exp_q[slave_idx].size() == 0) begin
      `uvm_error("SCBD", $sformatf("AXI S%0d: Unexpected transaction to 0x%0h", slave_idx,
                                   item.addr))
      mismatch_count++;
      return;
    end
    exp = axi_exp_q[slave_idx].pop_front();
    if (exp.addr != item.addr || exp.write != item.write || (exp.write && exp.data != item.data)) begin
      `uvm_error("SCBD", $sformatf("AXI S%0d: Mismatch! Exp: %s, Got: %s", slave_idx, exp.sprint(),
                                   item.sprint()))
      mismatch_count++;
    end else begin
      match_count++;
    end
  endfunction

  function void check_ahb(int slave_idx, ahb_seq_item item);
    ahb_seq_item exp;
    if (ahb_exp_q[slave_idx].size() == 0) begin
      `uvm_error("SCBD", $sformatf("AHB S%0d: Unexpected transaction to 0x%0h", slave_idx,
                                   item.addr))
      mismatch_count++;
      return;
    end
    exp = ahb_exp_q[slave_idx].pop_front();
    if (exp.addr != item.addr || exp.write != item.write || (exp.write && exp.data != item.data)) begin
      `uvm_error("SCBD", $sformatf("AHB S%0d: Mismatch! Exp: %s, Got: %s", slave_idx, exp.sprint(),
                                   item.sprint()))
      mismatch_count++;
    end else begin
      match_count++;
    end
  endfunction

  function void check_wb(int slave_idx, wb_seq_item item);
    wb_seq_item exp;
    if (wb_exp_q[slave_idx].size() == 0) begin
      `uvm_error("SCBD", $sformatf("WB S%0d: Unexpected transaction to 0x%0h", slave_idx,
                                   item.addr))
      mismatch_count++;
      return;
    end
    exp = wb_exp_q[slave_idx].pop_front();
    if (exp.addr != item.addr || exp.we != item.we || (exp.we && exp.data != item.data)) begin
      `uvm_error("SCBD", $sformatf("WB S%0d: Mismatch! Exp: %s, Got: %s", slave_idx, exp.sprint(),
                                   item.sprint()))
      mismatch_count++;
    end else begin
      match_count++;
    end
  endfunction

  function void report_phase(uvm_phase phase);
    `uvm_info("SCBD", $sformatf(
              "Final Scoreboard Report: Matches=%0d, Mismatches=%0d", match_count, mismatch_count),
              UVM_LOW)
  endfunction

endclass
