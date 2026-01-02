`timescale 1ps / 1ps
package uart_test_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import uart_env_pkg::*;
  import uart_agent_pkg::*;
  import apb_agent_pkg::*;

  `include "uart_base_test.sv"
  `include "uart_sequences.sv"
  `include "uart_sanity_test.sv"
  `include "uart_axi_test.sv"
  `include "uart_wb_test.sv"
  `include "uart_regs_test.sv"
  `include "uart_loopback_test.sv"
  `include "uart_full_traffic_test.sv"
  `include "uart_modes_test.sv"
  `include "uart_features_test.sv"
  `include "uart_flow_control_test.sv"

endpackage : uart_test_pkg
