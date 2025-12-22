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

# Project Paths
SCRIPT_DIR=$(dirname "$0")
IP_DIR="$SCRIPT_DIR/../.."
RTL_DIR="$IP_DIR/rtl/verilog"
TB_DIR="$SCRIPT_DIR/.."

# Clean previous runs
rm -rf work transcript vsim.wlf

echo "--- Creating Library ---"
vlib work

echo "--- Compiling RTL ---"
vlog -sv -timescale "1ns/1ps" \
    $RTL_DIR/gpio_bit.sv \
    $RTL_DIR/gpio_wrapper.sv \
    $RTL_DIR/gpio_regs.sv \
    $RTL_DIR/gpio_axi.sv

echo "--- Compiling Testbench ---"
vlog -sv -timescale "1ns/1ps" $TB_DIR/tb_gpio_axi.sv

echo "--- Simulating ---"
vsim -c -do "run -all; quit" tb_gpio_axi | tee transcript

# Check result
if grep -q "TEST PASSED" transcript; then
    echo "--------------------------"
    echo "MODELSIM SIMULATION PASSED"
    echo "--------------------------"
else
    echo "--------------------------"
    echo "MODELSIM SIMULATION FAILED"
    echo "--------------------------"
    exit 1
fi
