#!/bin/bash
#-------------------------------------------------------------------------------
# File: run_ghdl.sh
# Description: GHDL orchestration script for GPIO IP.
#
# How it operates:
# This script uses GHDL to analyze, elaborate, and run VHDL directed
# tests. It iterates through supported bus types (AXI, APB, WB).
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
RTL_DIR="$IP_DIR/rtl/vhdl"
TB_DIR="$IP_DIR/tb"

# List of bus types to test
BUS_TYPES=("axi" "apb" "wb")

# Create and enter work directory
mkdir -p work
cd work

# Clean previous runs
rm -rf work-obj08.cf *.log

for bus in "${BUS_TYPES[@]}"; do
    echo "=================================================="
    echo "Running GHDL Simulation for BUS: $bus"
    echo "=================================================="
    
    echo "--- Analyzing Shared Library ---"
    SHARED_RTL_DIR="$IP_DIR/../../common/lib/rtl"
    SHARED_VERIF_DIR="$IP_DIR/../../common/lib/verif"
    
    # Packages first
    ghdl -a --std=08 --work=work $SHARED_VERIF_DIR/${bus}_bfm_pkg.vhd
    
    # RTL Adapters
    if [ "$bus" == "axi" ]; then
        ghdl -a --std=08 --work=work $SHARED_RTL_DIR/axi4lite_slave_adapter.vhd
    elif [ "$bus" == "apb" ]; then
        ghdl -a --std=08 --work=work $SHARED_RTL_DIR/apb_slave_adapter.vhd
    elif [ "$bus" == "wb" ]; then
        ghdl -a --std=08 --work=work $SHARED_RTL_DIR/wb_slave_adapter.vhd
    fi

    echo "--- Analyzing RTL ---"
    ghdl -a --std=08 --work=work $RTL_DIR/gpio_regs.vhd
    ghdl -a --std=08 --work=work $RTL_DIR/gpio_bit.vhd
    ghdl -a --std=08 --work=work $RTL_DIR/gpio_wrapper.vhd
    ghdl -a --std=08 --work=work $RTL_DIR/gpio_$bus.vhd

    echo "--- Analyzing Testbench ---"
    ghdl -a --std=08 --work=work $TB_DIR/tb_gpio_$bus.vhd

    echo "--- Elaborating ---"
    ghdl -e --std=08 --work=work tb_gpio_$bus

    echo "--- Simulating ---"
    ghdl -r --std=08 --work=work tb_gpio_$bus | tee ghdl_$bus.log

    # Check result
    test_marker=$(echo $bus | tr '[:lower:]' '[:upper:]')
    if grep -q "${test_marker} TEST PASSED" ghdl_$bus.log || grep -q "TEST PASSED" ghdl_$bus.log; then
        echo "--------------------------"
        echo "GHDL $bus SIMULATION PASSED"
        echo "--------------------------"
    else
        echo "--------------------------"
        echo "GHDL $bus SIMULATION FAILED"
        echo "--------------------------"
        exit 1
    fi
done

echo "=================================================="
echo "ALL GHDL NATIVE TESTS PASSED"
echo "=================================================="
