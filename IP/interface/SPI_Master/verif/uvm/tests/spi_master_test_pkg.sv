`ifndef SPI_MASTER_TEST_PKG_SV
`define SPI_MASTER_TEST_PKG_SV

package spi_master_test_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import spi_agent_pkg::*;
  import apb_agent_pkg::*;

  import spi_master_env_pkg::*;

  `include "spi_master_base_test.sv"
  `include "spi_master_sanity_test.sv"
  `include "spi_master_apb_seq.sv"
  `include "spi_master_tx_test.sv"
  `include "spi_master_coverage_test.sv"
  `include "spi_master_dma_test.sv"
  `include "spi_master_apb_stress_test.sv"

endpackage

`endif
