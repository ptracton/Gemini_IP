`timescale 1ps / 1ps
package uart_env_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import uart_agent_pkg::*;
  import apb_agent_pkg::*;
  import axi_agent_pkg::*;
  import wb_agent_pkg::*;

  // Configs
  `include "uart_env_config.sv"

  // Scoreboard
  `include "uart_scoreboard.sv"

  // Env
  `include "uart_env.sv"

endpackage : uart_env_pkg
