/*
 * File: fifo_agent_pkg.sv
 * Description: Package for FIFO agent.
 * Author: Gemini-3 AI
 */

package fifo_agent_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  `include "fifo_seq_item.sv"
  `include "fifo_sequencer.sv"
  `include "fifo_driver.sv"
  `include "fifo_monitor.sv"
  `include "fifo_agent.sv"
endpackage
