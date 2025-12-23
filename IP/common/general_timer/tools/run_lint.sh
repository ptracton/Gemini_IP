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

echo "=================================================="
echo "Linting SystemVerilog (Verilator)"
echo "=================================================="
# Lint all source files
# Note: We check files individually or as a set. Checking as a set is better for package/macro visibility.
# However, Verilator with --lint-only usually processes one top at a time perfectly fine.
for file in $RTL_DIR_SV/timer_regs.sv \
            $RTL_DIR_SV/timer_core.sv \
            $RTL_DIR_SV/timer_apb.sv \
            $RTL_DIR_SV/timer_axi.sv \
            $RTL_DIR_SV/timer_wb.sv; do
    echo "Linting $(basename $file)..."
    verilator --lint-only -Wall -I$RTL_DIR_SV $file
done

echo "=================================================="
echo "Checking VHDL (GHDL)"
echo "=================================================="
mkdir -p lint_vhdl
# Analyze in dependency order
for file in $RTL_DIR_VHDL/timer_regs.vhd \
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
