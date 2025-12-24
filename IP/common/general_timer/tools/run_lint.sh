#!/bin/bash
#-------------------------------------------------------------------------------
# File: run_lint.sh
# Description: Linting script for General Timer IP.
#
# How it operates:
# This script uses Verilator for SystemVerilog linting and GHDL for VHDL
# syntax/semantic checking.
#-------------------------------------------------------------------------------

set -e

# Project Paths
SCRIPT_DIR=$(dirname "$0")
IP_DIR="$SCRIPT_DIR/.."
RTL_DIR_SV="$IP_DIR/rtl/verilog"
RTL_DIR_VHDL="$IP_DIR/rtl/vhdl"
SHARED_RTL_DIR="$IP_DIR/../../common/lib/rtl"

echo "=================================================="
echo "Linting SystemVerilog (Verilator)"
echo "=================================================="
# Lint all source files
for file in $SHARED_RTL_DIR/axi4lite_slave_adapter.sv \
            $SHARED_RTL_DIR/apb_slave_adapter.sv \
            $SHARED_RTL_DIR/wb_slave_adapter.sv \
            $RTL_DIR_SV/timer_regs.sv \
            $RTL_DIR_SV/timer_core.sv \
            $RTL_DIR_SV/timer_apb.sv \
            $RTL_DIR_SV/timer_axi.sv \
            $RTL_DIR_SV/timer_wb.sv; do
    echo "Linting $(basename $file)..."
    SHARED_VERIF_DIR="$IP_DIR/../../common/lib/verif"
    verilator --lint-only -Wall \
        -I$RTL_DIR_SV \
        -I$SHARED_RTL_DIR \
        -I$SHARED_VERIF_DIR \
        $file
done

echo "=================================================="
echo "Checking VHDL (GHDL)"
echo "=================================================="
mkdir -p lint_vhdl
# Analyze in dependency order
for file in $SHARED_RTL_DIR/axi4lite_slave_adapter.vhd \
            $SHARED_RTL_DIR/apb_slave_adapter.vhd \
            $SHARED_RTL_DIR/wb_slave_adapter.vhd \
            $RTL_DIR_VHDL/timer_regs.vhd \
            $RTL_DIR_VHDL/timer_core.vhd \
            $RTL_DIR_VHDL/timer_apb.vhd \
            $RTL_DIR_VHDL/timer_axi.vhd \
            $RTL_DIR_VHDL/timer_wb.vhd; do
    echo "Checking $(basename $file)..."
    ghdl -a --std=08 --workdir=lint_vhdl $file
done
rm -rf lint_vhdl

echo "=================================================="
echo "LINTING PASSED"
echo "=================================================="
