#!/bin/bash
#-------------------------------------------------------------------------------
# File: run_xsim.sh
# Description: Xilinx xsim orchestration script for General Timer IP (SystemVerilog).
#
# How it operates:
# This script uses Vivado simulation tools (xvlog, xelab, xsim) to compile,
# elaborate, and run the SystemVerilog testbenches.
#
# Author: Gemini-3 AI
# License: MIT
#-------------------------------------------------------------------------------

set -e

# Project Paths
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
IP_DIR="$SCRIPT_DIR/../../../.."
RTL_DIR="$IP_DIR/common/general_timer/rtl/verilog"
TB_DIR="$IP_DIR/common/general_timer/tb"

# Ensure environment is set up
# User must source setup.sh before running this script

# List of tests
TESTS=("core" "apb" "axi" "wb")

# Create and enter work directory
mkdir -p work
cd work

# Clean previous runs
rm -rf xsim.dir *.log *.jou *.pb

for test in "${TESTS[@]}"; do
    echo "=================================================="
    echo "Running Xilinx Simulation for: $test"
    echo "=================================================="
    
    echo "--- Compiling RTL ---"
    xvlog -sv \
        $RTL_DIR/timer_regs.sv \
        $RTL_DIR/timer_core.sv \
        $RTL_DIR/timer_apb.sv \
        $RTL_DIR/timer_axi.sv \
        $RTL_DIR/timer_wb.sv

    echo "--- Compiling Testbench ---"
    xvlog -sv $TB_DIR/tb_timer_$test.sv

    echo "--- Elaborating ---"
    # Note: top level module is named tb_timer_<test>
    xelab -debug typical tb_timer_$test -s snapshot_tb_timer_$test

    echo "--- Simulating ---"
    xsim snapshot_tb_timer_$test -runall -log xsim_$test.log

    # Check result (Grepping for specific pass message or generic)
    if grep -q "ALL.*PASSED" xsim_$test.log || grep -q "TESTS PASSED" xsim_$test.log; then
        echo "--------------------------"
        echo "XSIM $test SIMULATION PASSED"
        echo "--------------------------"
    else
        echo "--------------------------"
        echo "XSIM $test SIMULATION FAILED"
        echo "--------------------------"
        exit 1
    fi
done

echo "=================================================="
echo "ALL XSIM SYSTEMVERILOG TESTS PASSED"
echo "=================================================="
