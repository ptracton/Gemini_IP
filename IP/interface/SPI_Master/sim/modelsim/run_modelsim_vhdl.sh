#!/bin/bash
# ModelSim runner for SPI Master (VHDL)

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    exit 1
fi

SIM_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SIM_DIR"

if [ -d "work" ]; then
    rm -rf work
fi
vlib work

SRC_DIR="$GEMINI_IP_ROOT/IP/interface/SPI_Master/rtl/vhdl"
TB_DIR="$GEMINI_IP_ROOT/IP/interface/SPI_Master/tb"
COMMON_RTL="$GEMINI_IP_ROOT/IP/common/sync_fifo/rtl/vhdl"
LIB_RTL="$GEMINI_IP_ROOT/IP/common/lib/rtl"
LIB_VERIF="$GEMINI_IP_ROOT/IP/common/lib/verif"

set -e

# Compile Dependencies
vcom -2008 "$COMMON_RTL/sync_fifo.vhd"

# Compile Adapters
vcom -2008 "$LIB_RTL/apb_slave_adapter.vhd"
vcom -2008 "$LIB_RTL/axi4lite_slave_adapter.vhd"
vcom -2008 "$LIB_RTL/wb_slave_adapter.vhd"

# Compile BFMs
vcom -2008 "$LIB_VERIF/apb_bfm_pkg.vhd"
vcom -2008 "$LIB_VERIF/axi_bfm_pkg.vhd"
vcom -2008 "$LIB_VERIF/wb_bfm_pkg.vhd"

# Compile Core and Wrappers
vcom -2008 "$SRC_DIR/spi_master_registers.vhd"
vcom -2008 "$SRC_DIR/spi_master_core.vhd"
vcom -2008 "$SRC_DIR/spi_master_apb.vhd"
vcom -2008 "$SRC_DIR/spi_master_axi.vhd"
vcom -2008 "$SRC_DIR/spi_master_wb.vhd"

# Compile Testbenches
vcom -2008 "$TB_DIR/tb_spi_master_core.vhd"
vcom -2008 "$TB_DIR/tb_spi_master_apb.vhd"
vcom -2008 "$TB_DIR/tb_spi_master_axi.vhd"
vcom -2008 "$TB_DIR/tb_spi_master_wb.vhd"

# Run Simulations
echo "Running Core Sim..."
vsim -c tb_spi_master_core -do "run -all; quit"

echo "Running APB Sim..."
vsim -c tb_spi_master_apb -do "run -all; quit"

echo "Running AXI Sim..."
vsim -c tb_spi_master_axi -do "run -all; quit"

echo "Running Wishbone Sim..."
vsim -c tb_spi_master_wb -do "run -all; quit"

echo "All ModelSim VHDL Simulations PASSED"
