#!/bin/bash
# Xilinx xsim runner for SPI Master (SystemVerilog)

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    exit 1
fi

SIM_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SIM_DIR"

# Clean up
rm -rf xsim.dir/ *.jou *.pb *.wdb

SRC_DIR="$GEMINI_IP_ROOT/IP/interface/SPI_Master/rtl/verilog"
TB_DIR="$GEMINI_IP_ROOT/IP/interface/SPI_Master/tb"
COMMON_RTL="$GEMINI_IP_ROOT/IP/common"
LIB_RTL="$GEMINI_IP_ROOT/IP/common/lib/rtl"
LIB_VERIF="$GEMINI_IP_ROOT/IP/common/lib/verif"

set -e # Exit on first error

echo "Compiling FIFO and Common RTL..."
xvlog -sv "$COMMON_RTL/sync_fifo/rtl/verilog/sync_fifo.sv"
xvlog -sv "$LIB_RTL/apb_slave_adapter.sv" "$LIB_RTL/axi4lite_slave_adapter.sv" "$LIB_RTL/wb_slave_adapter.sv"

echo "Compiling SPI Master Core and Wrappers..."
xvlog -sv "$SRC_DIR/spi_master_registers.sv" "$SRC_DIR/spi_master_core.sv"
xvlog -sv "$SRC_DIR/spi_master_apb.sv" "$SRC_DIR/spi_master_axi.sv" "$SRC_DIR/spi_master_wb.sv"

echo "Compiling Testbenches..."
xvlog -sv -i "$LIB_VERIF" "$TB_DIR/tb_spi_master_core.sv"
xvlog -sv -i "$LIB_VERIF" "$TB_DIR/tb_spi_master_apb.sv"
xvlog -sv -i "$LIB_VERIF" "$TB_DIR/tb_spi_master_axi.sv"
xvlog -sv -i "$LIB_VERIF" "$TB_DIR/tb_spi_master_wb.sv"

echo "Running Core Sim..."
xelab -debug typical work.tb_spi_master_core -s core_sim -timescale 1ns/1ps
xsim core_sim -R

echo "Running APB Sim..."
xelab -debug typical work.tb_spi_master_apb -s apb_sim -timescale 1ns/1ps
xsim apb_sim -R

echo "Running AXI Sim..."
xelab -debug typical work.tb_spi_master_axi -s axi_sim -timescale 1ns/1ps
xsim axi_sim -R

echo "Running Wishbone Sim..."
xelab -debug typical work.tb_spi_master_wb -s wb_sim -timescale 1ns/1ps
xsim wb_sim -R

echo "All Xilinx Simulations PASSED"
