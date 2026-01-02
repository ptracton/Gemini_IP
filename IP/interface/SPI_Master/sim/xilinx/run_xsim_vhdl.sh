#!/bin/bash
# Xilinx xsim runner for SPI Master (VHDL)

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    exit 1
fi

SIM_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SIM_DIR"

# Clean up
rm -rf xsim.dir/ *.jou *.pb *.wdb

SRC_DIR="$GEMINI_IP_ROOT/IP/interface/SPI_Master/rtl/vhdl"
TB_DIR="$GEMINI_IP_ROOT/IP/interface/SPI_Master/tb"
COMMON_RTL="$GEMINI_IP_ROOT/IP/common"
LIB_RTL="$GEMINI_IP_ROOT/IP/common/lib/rtl"
LIB_VERIF="$GEMINI_IP_ROOT/IP/common/lib/verif"

set -e

echo "Compiling Dependencies..."
xvhdl -2008 "$COMMON_RTL/sync_fifo/rtl/vhdl/sync_fifo.vhd"
xvhdl -2008 "$LIB_RTL/apb_slave_adapter.vhd" "$LIB_RTL/axi4lite_slave_adapter.vhd" "$LIB_RTL/wb_slave_adapter.vhd"

echo "Compiling BFMs..."
xvhdl -2008 "$LIB_VERIF/apb_bfm_pkg.vhd" "$LIB_VERIF/axi_bfm_pkg.vhd" "$LIB_VERIF/wb_bfm_pkg.vhd"

echo "Compiling Core and Wrappers..."
xvhdl -2008 "$SRC_DIR/spi_master_registers.vhd" "$SRC_DIR/spi_master_core.vhd"
xvhdl -2008 "$SRC_DIR/spi_master_apb.vhd" "$SRC_DIR/spi_master_axi.vhd" "$SRC_DIR/spi_master_wb.vhd"

echo "Compiling Testbenches..."
xvhdl -2008 "$TB_DIR/tb_spi_master_core.vhd"
xvhdl -2008 "$TB_DIR/tb_spi_master_apb.vhd"
xvhdl -2008 "$TB_DIR/tb_spi_master_axi.vhd"
xvhdl -2008 "$TB_DIR/tb_spi_master_wb.vhd"

echo "Running Core VHDL Sim..."
xelab -debug typical work.tb_spi_master_core -s core_vhd
xsim core_vhd -R

echo "Running APB VHDL Sim..."
xelab -debug typical work.tb_spi_master_apb -s apb_vhd
xsim apb_vhd -R

echo "Running AXI VHDL Sim..."
xelab -debug typical work.tb_spi_master_axi -s axi_vhd
xsim axi_vhd -R

echo "Running WB VHDL Sim..."
xelab -debug typical work.tb_spi_master_wb -s wb_vhd
xsim wb_vhd -R

echo "All Xilinx VHDL Simulations PASSED"
