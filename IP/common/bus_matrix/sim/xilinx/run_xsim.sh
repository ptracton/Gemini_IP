#!/bin/bash
#-------------------------------------------------------------------------------
# File: run_xsim.sh
# Description: Xilinx xsim orchestration script for Bus Matrix IP (SystemVerilog).
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
RTL_DIR="$IP_DIR/common/bus_matrix/rtl/verilog"
TB_DIR="$IP_DIR/common/bus_matrix/tb"

# Ensure environment is set up
# IP_DIR is IP
# IP -> Gemini_IP (1 level up)
source $IP_DIR/../setup.sh

# Create and enter work directory
mkdir -p work
cd work

# Clean previous runs
rm -rf xsim.dir *.log *.jou *.pb

    echo "=================================================="
    echo "Running Xilinx Simulation for: bus_matrix_tb"
    echo "=================================================="
    
    echo "--- Compiling RTL ---"
    SHARED_RTL_DIR="$IP_DIR/common/lib/rtl"
    SHARED_VERIF_DIR="$IP_DIR/common/lib/verif"
    xvlog -sv -i $SHARED_VERIF_DIR \
        $RTL_DIR/bus_matrix_pkg.sv \
        $RTL_DIR/bus_matrix_arbiter.sv \
        $RTL_DIR/bus_matrix_decoder.sv \
        $RTL_DIR/bus_matrix_register_slice.sv \
        $RTL_DIR/bus_matrix_wb.sv \
        $RTL_DIR/bus_matrix_ahb.sv \
        $RTL_DIR/bus_matrix_axi.sv

    echo "--- Compiling Testbench ---"
    xvlog -sv -i $SHARED_VERIF_DIR $IP_DIR/common/bus_matrix/tb/bus_matrix_tb.sv

    echo "--- Elaborating ---"
    xelab -debug typical bus_matrix_tb -s snapshot_tb_bus_matrix -L unisims_ver -L unimacro_ver -L secureip

    echo "--- Simulating ---"
    xsim snapshot_tb_bus_matrix -tclbatch ../run_batch.tcl -log xsim_bus_matrix.log

    # Check result
    if (grep -q "ALL.*PASSED" xsim_bus_matrix.log || grep -q "TESTS PASSED" xsim_bus_matrix.log || grep -q "OK" xsim_bus_matrix.log) && ! grep -q "Error:" xsim_bus_matrix.log && ! grep -q "FAIL" xsim_bus_matrix.log; then
        echo "--------------------------"
        echo "XSIM SIMULATION PASSED"
        echo "--------------------------"
    else
        echo "--------------------------"
        echo "XSIM SIMULATION FAILED"
        echo "--------------------------"
        # Print tail of log or grep for errors
        grep -E "Error:|FAIL" xsim_bus_matrix.log || tail -n 20 xsim_bus_matrix.log
        exit 1
    fi

echo "=================================================="
echo "ALL XSIM SYSTEMVERILOG TESTS PASSED"
echo "=================================================="
