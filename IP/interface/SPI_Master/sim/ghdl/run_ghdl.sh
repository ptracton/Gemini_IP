#!/bin/bash
# GHDL runner for SPI Master (Enhanced)

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set. Source setup.sh first."
    exit 1
fi

SIM_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SIM_DIR"

GHDL_BIN="ghdl"
COMMON_RTL="$GEMINI_IP_ROOT/IP/common"
LIB_RTL="$GEMINI_IP_ROOT/IP/common/lib/rtl"
SRC_DIR="$GEMINI_IP_ROOT/IP/interface/SPI_Master/rtl/vhdl"
TB_DIR="$GEMINI_IP_ROOT/IP/interface/SPI_Master/tb"

COMMON_VERIF="$GEMINI_IP_ROOT/IP/common/lib/verif"

# Compile Dependencies
$GHDL_BIN -a --std=08 "$COMMON_RTL/sync_fifo/rtl/vhdl/sync_fifo.vhd"
$GHDL_BIN -a --std=08 "$LIB_RTL/apb_slave_adapter.vhd"
$GHDL_BIN -a --std=08 "$LIB_RTL/axi4lite_slave_adapter.vhd"
$GHDL_BIN -a --std=08 "$LIB_RTL/wb_slave_adapter.vhd"

# Compile BFMs
$GHDL_BIN -a --std=08 "$COMMON_VERIF/apb_bfm_pkg.vhd"
$GHDL_BIN -a --std=08 "$COMMON_VERIF/axi_bfm_pkg.vhd"
$GHDL_BIN -a --std=08 "$COMMON_VERIF/wb_bfm_pkg.vhd"

# Compile Core and Wrappers
$GHDL_BIN -a --std=08 "$SRC_DIR/spi_master_registers.vhd"
$GHDL_BIN -a --std=08 "$SRC_DIR/spi_master_core.vhd"
$GHDL_BIN -a --std=08 "$SRC_DIR/spi_master_apb.vhd"
$GHDL_BIN -a --std=08 "$SRC_DIR/spi_master_axi.vhd"
$GHDL_BIN -a --std=08 "$SRC_DIR/spi_master_wb.vhd"

# Compile and Run Testbench
$GHDL_BIN -a --std=08 "$TB_DIR/tb_spi_master_core.vhd"
$GHDL_BIN -e --std=08 tb_spi_master_core
$GHDL_BIN -r --std=08 tb_spi_master_core --stop-time=10us

$GHDL_BIN -a --std=08 "$TB_DIR/tb_spi_master_apb.vhd"
$GHDL_BIN -e --std=08 tb_spi_master_apb
$GHDL_BIN -r --std=08 tb_spi_master_apb --stop-time=10us

$GHDL_BIN -a --std=08 "$TB_DIR/tb_spi_master_axi.vhd"
$GHDL_BIN -e --std=08 tb_spi_master_axi
$GHDL_BIN -r --std=08 tb_spi_master_axi --stop-time=10us

$GHDL_BIN -a --std=08 "$TB_DIR/tb_spi_master_wb.vhd"
$GHDL_BIN -e --std=08 tb_spi_master_wb
$GHDL_BIN -r --std=08 tb_spi_master_wb --stop-time=10us
