/*
 * File: sp_memory_test_pkg.sv
 * Description: SP Memory Test Package
 */
package sp_memory_test_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import apb_agent_pkg::*;
  import axi_agent_pkg::*;
  import wb_agent_pkg::*;
  import ahb_agent_pkg::*;
  import sp_memory_agent_pkg::*;
  import sp_memory_env_pkg::*;

  `include "../seq/sp_memory_base_seq.sv"
  `include "../seq/sp_memory_bus_sequences.sv"

  `include "sp_memory_base_test.sv"
  `include "sp_memory_access_test.sv"
  `include "sp_memory_bist_test.sv"
  `include "sp_memory_ecc_test.sv"
  `include "sp_memory_stress_test.sv"
  `include "sp_memory_error_test.sv"
  `include "sp_memory_axi_corner_test.sv"
  `include "sp_memory_init_test.sv"
  `include "sp_memory_ecc_bitflip_test.sv"
endpackage
