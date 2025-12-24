/*
 * File: bus_matrix_env_pkg.sv
 * Description: UVM Package for Timer environment
 */
package bus_matrix_env_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    import axi_agent_pkg::*;
    import apb_agent_pkg::*;
    import wb_agent_pkg::*;
    import bus_matrix_agent_pkg::*;
    
    // Macros for multiple analysis implementations
    `uvm_analysis_imp_decl(_apb)
    `uvm_analysis_imp_decl(_axi)
    `uvm_analysis_imp_decl(_wb)
    `uvm_analysis_imp_decl(_bus_matrix)

    `include "bus_matrix_scoreboard.sv"
    `include "bus_matrix_coverage.sv"
    `include "bus_matrix_env.sv"

endpackage
