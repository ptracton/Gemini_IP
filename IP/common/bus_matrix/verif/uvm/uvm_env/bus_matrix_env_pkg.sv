/*
 * File: bus_matrix_env_pkg.sv
 * Description: Bus Matrix UVM Environment Package
 */

package bus_matrix_env_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    
    // Import Shared Agents
    import axi_agent_pkg::*;
    import ahb_agent_pkg::*;
    import wb_agent_pkg::*;

    `include "bus_matrix_scoreboard.sv"
    `include "bus_matrix_env.sv"

endpackage
