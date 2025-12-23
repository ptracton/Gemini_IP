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
# IP_DIR is IP
# IP -> Gemini_IP (1 level up)
source $IP_DIR/../setup.sh

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
    # Note: top level module is named tb_timer_<test>
    xelab -debug typical tb_timer_$test -s snapshot_tb_timer_$test -cc_type bbc

    echo "--- Simulating ---"
    echo "--- Simulating ---"
    # Using -cov_db_name and -cov_db_dir not strictly necessary for code coverage but good practice
    # Need -cc_type for elab if we want code cov? xelab default is none?
    # Actually need to add -cc_type to xelab first.
    xsim snapshot_tb_timer_$test -runall -log xsim_$test.log

    # Archive Coverage
    COV_REPO_DIR="$IP_DIR/coverage_repo"
    mkdir -p $COV_REPO_DIR
    if [ -d "xsim.codeCov/snapshot_tb_timer_$test" ]; then
         rm -rf $COV_REPO_DIR/xsim_sv_$test
         cp -r xsim.codeCov/snapshot_tb_timer_$test $COV_REPO_DIR/xsim_sv_$test
    fi

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
