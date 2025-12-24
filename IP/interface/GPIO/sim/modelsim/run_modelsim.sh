#!/bin/bash
#-------------------------------------------------------------------------------
# File: run_modelsim.sh
# Description: ModelSim vsim orchestration script for GPIO IP.
#
# How it operates:
# This script uses ModelSim tools (vlib, vlog, vsim) to compile and run
# the SystemVerilog testbench.
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
rm -rf work transcript vsim.wlf

for bus in "${BUS_TYPES[@]}"; do
    echo "=================================================="
    echo "Running ModelSim Simulation for BUS: $bus"
    echo "=================================================="
    
    echo "--- Creating Library ---"
    vlib work_$bus

    echo "--- Compiling RTL ---"
    SHARED_RTL_DIR="$IP_DIR/../../common/lib/rtl"
    vlog -work work_$bus -sv -timescale "1ns/1ps" \
        $SHARED_RTL_DIR/axi4lite_slave_adapter.sv \
        $SHARED_RTL_DIR/apb_slave_adapter.sv \
        $SHARED_RTL_DIR/wb_slave_adapter.sv \
        $RTL_DIR/gpio_bit.sv \
        $RTL_DIR/gpio_wrapper.sv \
        $RTL_DIR/gpio_regs.sv \
        $RTL_DIR/gpio_$bus.sv

    echo "--- Compiling Testbench ---"
    SHARED_VERIF_DIR="$IP_DIR/../../common/lib/verif"
    vlog -work work_$bus -sv -timescale "1ns/1ps" +incdir+$SHARED_VERIF_DIR $TB_DIR/tb_gpio_$bus.sv

    echo "--- Simulating ---"
    vsim -work work_$bus -c -do "run -all; quit" tb_gpio_$bus | tee transcript_$bus
    
    # Check result
    test_marker=$(echo $bus | tr '[:lower:]' '[:upper:]')
    if grep -q "${test_marker} TEST PASSED" transcript_$bus || grep -q "TEST PASSED" transcript_$bus; then
        echo "--------------------------"
        echo "MODELSIM $bus SIMULATION PASSED"
        echo "--------------------------"
    else
        echo "--------------------------"
        echo "MODELSIM $bus SIMULATION FAILED"
        echo "--------------------------"
        exit 1
    fi
done

echo "=================================================="
echo "ALL MODELSIM NATIVE TESTS PASSED"
echo "=================================================="
