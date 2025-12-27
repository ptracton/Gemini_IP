/*
 * File: bridge_env_pkg.sv
 * Description: AHB-APB Bridge UVM Environment Package
 */

package bridge_env_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    
    // Import Shared Agents
    import ahb_agent_pkg::*;
    import apb_agent_pkg::*;

    `include "bridge_env.sv"

endpackage
