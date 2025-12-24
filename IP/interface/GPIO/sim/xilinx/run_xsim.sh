#!/bin/bash
#-------------------------------------------------------------------------------
# File: run_xsim.sh
# Description: Xilinx xsim orchestration script for GPIO IP.
#
# How it operates:
# This script uses Vivado simulation tools (xvlog, xelab, xsim) to compile,
# elaborate, and run the SystemVerilog testbench.
#
# Author: Gemini-3 AI
# License: MIT
#-------------------------------------------------------------------------------

set -e

# Ensure environment is set up
if [ -f "/home/ptracton/src/Gemini_IP/setup.sh" ]; then
    source /home/ptracton/src/Gemini_IP/setup.sh
fi

# Project Paths
# Project Paths
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
IP_DIR="$SCRIPT_DIR/../.."
RTL_DIR="$IP_DIR/rtl/verilog"
TB_DIR="$IP_DIR/tb"

# List of bus types to test
BUS_TYPES=("axi" "apb" "wb")

# Create and enter work directory
mkdir -p work
cd work

# Clean previous runs
rm -rf xsim.dir *.log *.jou *.pb

for bus in "${BUS_TYPES[@]}"; do
    echo "=================================================="
    echo "Running Xilinx Simulation for BUS: $bus"
    echo "=================================================="
    
    echo "--- Compiling RTL ---"
    SHARED_RTL_DIR="$IP_DIR/../../common/lib/rtl"
    xvlog -sv -d SIMULATION \
        $SHARED_RTL_DIR/axi4lite_slave_adapter.sv \
        $SHARED_RTL_DIR/apb_slave_adapter.sv \
        $SHARED_RTL_DIR/wb_slave_adapter.sv \
        $RTL_DIR/gpio_bit.sv \
        $RTL_DIR/gpio_wrapper.sv \
        $RTL_DIR/gpio_regs.sv \
        $RTL_DIR/gpio_$bus.sv

    echo "--- Compiling Testbench ---"
    SHARED_VERIF_DIR="$IP_DIR/../../common/lib/verif"
    xvlog -sv -i $SHARED_VERIF_DIR $TB_DIR/tb_gpio_$bus.sv

    echo "--- Elaborating ---"
    xelab -cc_type sbct -debug typical tb_gpio_$bus -s snapshot_tb_gpio_$bus -timescale 1ns/1ps

    echo "--- Simulating ---"
    xsim snapshot_tb_gpio_$bus -runall -log xsim_$bus.log

    # Check result
    test_marker=$(echo $bus | tr '[:lower:]' '[:upper:]')
    if grep -q "${test_marker} TEST PASSED" xsim_$bus.log || grep -q "TEST PASSED" xsim_$bus.log; then
        echo "--------------------------"
        echo "XSIM $bus SIMULATION PASSED"
        echo "--------------------------"
    else
        echo "--------------------------"
        echo "XSIM $bus SIMULATION FAILED"
        echo "--------------------------"
        exit 1
    fi
done

xcrg -merge_cc -cc_dir . -cc_db snapshot_tb_gpio_axi -cc_db snapshot_tb_gpio_apb -cc_db snapshot_tb_gpio_wb -cc_report ./coverage_report

echo "=================================================="
echo "ALL XSIM NATIVE TESTS PASSED"
echo "=================================================="
