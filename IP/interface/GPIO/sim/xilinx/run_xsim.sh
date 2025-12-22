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

# Project Paths
SCRIPT_DIR=$(dirname "$0")
IP_DIR="$SCRIPT_DIR/../.."
RTL_DIR="$IP_DIR/rtl/verilog"
TB_DIR="$SCRIPT_DIR/.."

# Clean previous runs
rm -rf xsim.dir *.log *.jou *.pb

echo "--- Compiling RTL ---"
xvlog -sv \
    $RTL_DIR/gpio_bit.sv \
    $RTL_DIR/gpio_wrapper.sv \
    $RTL_DIR/gpio_regs.sv \
    $RTL_DIR/gpio_axi.sv

echo "--- Compiling Testbench ---"
xvlog -sv $TB_DIR/tb_gpio_axi.sv

echo "--- Elaborating ---"
xelab -debug typical tb_gpio_axi -s snapshot_tb_gpio_axi -timescale 1ns/1ps

echo "--- Simulating ---"
xsim snapshot_tb_gpio_axi -runall -log xsim.log

# Check result
if grep -q "TEST PASSED" xsim.log; then
    echo "--------------------------"
    echo "XSIM SIMULATION PASSED"
    echo "--------------------------"
else
    echo "--------------------------"
    echo "XSIM SIMULATION FAILED"
    echo "--------------------------"
    exit 1
fi
