#!/bin/bash
#-------------------------------------------------------------------------------
# File: run_xsim_vhdl.sh
# Description: Xilinx xsim orchestration script for General Timer IP (VHDL).
#
# How it operates:
# This script uses Vivado simulation tools (xvhdl, xelab, xsim) to compile,
# elaborate, and run the VHDL testbenches.
#
# Author: Gemini-3 AI
# License: MIT
#-------------------------------------------------------------------------------

set -e

# Project Paths
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
IP_DIR="$SCRIPT_DIR/../../../.."
RTL_DIR="$IP_DIR/common/general_timer/rtl/vhdl"
TB_DIR="$IP_DIR/common/general_timer/tb"

# Ensure environment is set up
source $IP_DIR/../setup.sh

# List of tests
TESTS=("core" "apb" "axi" "wb")

# Create and enter work directory
mkdir -p work_vhdl
cd work_vhdl

# Clean previous runs
rm -rf xsim.dir *.log *.jou *.pb

for test in "${TESTS[@]}"; do
    echo "=================================================="
    echo "Running Xilinx VHDL Simulation for: $test"
    echo "=================================================="
    
    echo "--- Compiling RTL ---"
    xvhdl -2008 \
        $RTL_DIR/timer_regs.vhd \
        $RTL_DIR/timer_core.vhd \
        $RTL_DIR/timer_apb.vhd \
        $RTL_DIR/timer_axi.vhd \
        $RTL_DIR/timer_wb.vhd

    echo "--- Compiling Testbench ---"
    xvhdl -2008 $TB_DIR/tb_timer_$test.vhd

    echo "--- Elaborating ---"
    xelab -debug typical tb_timer_$test -s snapshot_tb_timer_${test}_vhd -cc_type bbc

    echo "--- Simulating ---"
    xsim snapshot_tb_timer_${test}_vhd -runall -log xsim_${test}.log

    # Archive Coverage
    COV_REPO_DIR="$IP_DIR/coverage_repo"
    mkdir -p $COV_REPO_DIR
    if [ -d "xsim.codeCov/snapshot_tb_timer_${test}_vhd" ]; then
         rm -rf $COV_REPO_DIR/xsim_vhd_$test
         cp -r xsim.codeCov/snapshot_tb_timer_${test}_vhd $COV_REPO_DIR/xsim_vhd_$test
    fi

    # Check result
    if grep -q "ALL.*PASSED" xsim_${test}.log || grep -q "TESTS PASSED" xsim_${test}.log || grep -q "Test Completed" xsim_${test}.log; then
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
echo "ALL XSIM VHDL TESTS PASSED"
echo "=================================================="
