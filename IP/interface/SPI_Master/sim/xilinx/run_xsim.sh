#!/bin/bash
# Xilinx xsim runner for SPI Master (SystemVerilog)

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    exit 1
fi

SIM_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SIM_DIR"

# Generate Temp Timescale
echo '`timescale 1ns / 1ps' > timescale.sv
trap "rm -f timescale.sv" EXIT

# Clean up
rm -rf xsim.dir/ *.jou *.pb *.wdb

SRC_DIR="$GEMINI_IP_ROOT/IP/interface/SPI_Master/rtl/verilog"
TB_DIR="$GEMINI_IP_ROOT/IP/interface/SPI_Master/tb"
COMMON_RTL="$GEMINI_IP_ROOT/IP/common"
LIB_RTL="$GEMINI_IP_ROOT/IP/common/lib/rtl"
LIB_VERIF="$GEMINI_IP_ROOT/IP/common/lib/verif"

set -e # Exit on first error

echo "Compiling FIFO and Common RTL..."
xvlog -sv timescale.sv "$COMMON_RTL/sync_fifo/rtl/verilog/sync_fifo.sv"
xvlog -sv timescale.sv "$LIB_RTL/apb_slave_adapter.sv" "$LIB_RTL/axi4lite_slave_adapter.sv" "$LIB_RTL/wb_slave_adapter.sv"

echo "Compiling SPI Master Core and Wrappers..."
xvlog -sv timescale.sv "$SRC_DIR/spi_master_registers.sv" "$SRC_DIR/spi_master_core.sv"
xvlog -sv timescale.sv "$SRC_DIR/spi_master_apb.sv" "$SRC_DIR/spi_master_axi.sv" "$SRC_DIR/spi_master_wb.sv"

echo "Compiling Testbenches..."
xvlog -sv timescale.sv -i "$LIB_VERIF" "$TB_DIR/tb_spi_master_core.sv"
xvlog -sv timescale.sv -i "$LIB_VERIF" "$TB_DIR/tb_spi_master_apb.sv"
xvlog -sv timescale.sv -i "$LIB_VERIF" "$TB_DIR/tb_spi_master_axi.sv"
xvlog -sv timescale.sv -i "$LIB_VERIF" "$TB_DIR/tb_spi_master_wb.sv"

echo "Running Core Sim..."
xelab -debug typical work.tb_spi_master_core -s core_sim
xsim core_sim -R

echo "Running APB Sim..."
xelab -debug typical work.tb_spi_master_apb -s apb_sim
xsim apb_sim -R

echo "Running AXI Sim..."
xelab -debug typical work.tb_spi_master_axi -s axi_sim
xsim axi_sim -R

echo "Running Wishbone Sim..."
xelab -debug typical work.tb_spi_master_wb -s wb_sim
xsim wb_sim -R

echo "All Xilinx Simulations PASSED"
