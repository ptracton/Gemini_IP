#!/bin/bash
# Linting script for SPI Master (Verilator & GHDL)

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    exit 1
fi

TOOLS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$TOOLS_DIR"

SRC_DIR_SV="$GEMINI_IP_ROOT/IP/interface/SPI_Master/rtl/verilog"
SRC_DIR_VHD="$GEMINI_IP_ROOT/IP/interface/SPI_Master/rtl/vhdl"

echo "----------------------------------------------------------------"
echo "Running Verilator Lint (SV)..."
echo "----------------------------------------------------------------"
verilator --lint-only -Wall \
    -Wno-PINCONNECTEMPTY -Wno-UNUSEDSIGNAL -Wno-CASEINCOMPLETE -Wno-MULTITOP \
    -I$SRC_DIR_SV \
    -I$GEMINI_IP_ROOT/IP/common/lib/rtl \
    -I$GEMINI_IP_ROOT/IP/common/sync_fifo/rtl/verilog \
    $GEMINI_IP_ROOT/IP/common/sync_fifo/rtl/verilog/sync_fifo.sv \
    $SRC_DIR_SV/spi_master_registers.sv \
    $SRC_DIR_SV/spi_master_core.sv \
    $SRC_DIR_SV/spi_master_apb.sv \
    $SRC_DIR_SV/spi_master_axi.sv \
    $SRC_DIR_SV/spi_master_wb.sv

if [ $? -eq 0 ]; then
    echo "Verilator Lint: PASS"
else
    echo "Verilator Lint: FAIL"
fi

echo "----------------------------------------------------------------"
echo "Running GHDL Lint (VHDL)..."
echo "----------------------------------------------------------------"
ghdl -a --std=08 $GEMINI_IP_ROOT/IP/common/sync_fifo/rtl/vhdl/sync_fifo.vhd
ghdl -a --std=08 $SRC_DIR_VHD/spi_master_registers.vhd
ghdl -a --std=08 $SRC_DIR_VHD/spi_master_core.vhd

if [ $? -eq 0 ]; then
    echo "GHDL Lint: PASS"
else
    echo "GHDL Lint: FAIL"
fi
