#!/bin/bash
#-------------------------------------------------------------------------------
# File: run_lint.sh
# Description: Linting script for GPIO IP.
#
# How it operates:
# This script uses Verilator for SystemVerilog linting and GHDL for VHDL
# syntax/semantic checking.
#
# Author: Gemini-3 AI
# License: MIT
#-------------------------------------------------------------------------------

set -e

# Project Paths
SCRIPT_DIR=$(dirname "$0")
IP_DIR="$SCRIPT_DIR/.."
RTL_DIR_SV="$IP_DIR/rtl/verilog"
RTL_DIR_VHDL="$IP_DIR/rtl/vhdl"

echo "--- Linting SystemVerilog (Verilator) ---"
# Lint all source files
for file in $RTL_DIR_SV/*.sv; do
    echo "Linting $file..."
    verilator --lint-only -Wall -I$RTL_DIR_SV $file
done

echo "--- Checking VHDL (GHDL) ---"
mkdir -p lint_vhdl
# Analyze in dependency order
for file in $RTL_DIR_VHDL/gpio_regs.vhd $RTL_DIR_VHDL/gpio_bit.vhd $RTL_DIR_VHDL/gpio_wrapper.vhd \
            $RTL_DIR_VHDL/gpio_axi.vhd $RTL_DIR_VHDL/gpio_apb.vhd $RTL_DIR_VHDL/gpio_wb.vhd; do
    echo "Checking $file..."
    ghdl -a --std=08 --workdir=lint_vhdl $file
done
rm -rf lint_vhdl

echo "--------------------------"
echo "LINTING PASSED"
echo "--------------------------"
