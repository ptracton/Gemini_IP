/*
 * File: fifo_tests_pkg.sv
 * Description: Package for FIFO core tests.
 * Author: Gemini-3 AI
 */

package fifo_tests_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import fifo_agent_pkg::*;
  import sync_fifo_env_pkg::*;

  `include "fifo_sequences.sv"
  `include "fifo_rand_test.sv"

  // fifo_base_test is now in sync_fifo_env_pkg
endpackage
