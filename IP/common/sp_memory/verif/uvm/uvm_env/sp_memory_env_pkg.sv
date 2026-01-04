/*
 * File: sp_memory_env_pkg.sv
 * Description: SP Memory Environment Package
 */

package sp_memory_env_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import apb_agent_pkg::*;
  import axi_agent_pkg::*;
  import wb_agent_pkg::*;
  import ahb_agent_pkg::*;
  import sp_memory_agent_pkg::*;

  // Define analysis imports for scoreboard to differentiate sources
  `uvm_analysis_imp_decl(_apb)
  `uvm_analysis_imp_decl(_axi)
  `uvm_analysis_imp_decl(_wb)
  `uvm_analysis_imp_decl(_ahb)
  `uvm_analysis_imp_decl(_mem)

  `include "sp_memory_scoreboard.sv"
  `include "sp_memory_env.sv"

endpackage
