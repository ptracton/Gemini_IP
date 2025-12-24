#!/bin/bash
#-------------------------------------------------------------------------------
# File: run_iverilog.sh
# Description: Icarus Verilog orchestration script for GPIO IP.
#
# How it operates:
# This script uses iverilog and vvp to compile and run SystemVerilog directed
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
RTL_DIR="$IP_DIR/rtl/verilog"
TB_DIR="$IP_DIR/tb"

# List of bus types to test
BUS_TYPES=("axi" "apb" "wb")

# Create and enter work directory
mkdir -p work
cd work

# Clean previous runs
rm -f *.vvp *.log

for bus in "${BUS_TYPES[@]}"; do
    echo "=================================================="
    echo "Running Icarus Verilog Simulation for BUS: $bus"
    echo "=================================================="
    
    echo "--- Compiling ---"
    SHARED_RTL_DIR="$IP_DIR/../../common/lib/rtl"
    SHARED_VERIF_DIR="$IP_DIR/../../common/lib/verif"
    iverilog -g2012 -o gpio_$bus.vvp -D SIMULATION -I $SHARED_VERIF_DIR \
        $SHARED_RTL_DIR/axi4lite_slave_adapter.sv \
        $SHARED_RTL_DIR/apb_slave_adapter.sv \
        $SHARED_RTL_DIR/wb_slave_adapter.sv \
        $RTL_DIR/gpio_bit.sv \
        $RTL_DIR/gpio_wrapper.sv \
        $RTL_DIR/gpio_regs.sv \
        $RTL_DIR/gpio_$bus.sv \
        $TB_DIR/tb_gpio_$bus.sv

    echo "--- Simulating ---"
    vvp gpio_$bus.vvp | tee iverilog_$bus.log

    # Check result
    test_marker=$(echo $bus | tr '[:lower:]' '[:upper:]')
    if grep -q "${test_marker} TEST PASSED" iverilog_$bus.log || grep -q "TEST PASSED" iverilog_$bus.log; then
        echo "--------------------------"
        echo "IVERILOG $bus SIMULATION PASSED"
        echo "--------------------------"
    else
        echo "--------------------------"
        echo "IVERILOG $bus SIMULATION FAILED"
        echo "--------------------------"
        exit 1
    fi
done

echo "=================================================="
echo "ALL IVERILOG NATIVE TESTS PASSED"
echo "=================================================="
