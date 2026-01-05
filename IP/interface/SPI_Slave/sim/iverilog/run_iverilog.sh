#!/bin/bash
# ------------------------------------------------------------------------------
# Script: run_iverilog.sh
# Description: Compiles and runs the SystemVerilog testbench using Icarus Verilog.
#              Checks for GEMINI_IP_ROOT environment variable.
# Author: Gemini-3 AI
# ------------------------------------------------------------------------------

# Check for GEMINI_IP_ROOT
if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    echo "Please source 'setup.sh' in the project root."
    exit 1
fi

# Define paths
SPI_ROOT="$GEMINI_IP_ROOT/IP/interface/SPI_Slave"
OUT_DIR="$SPI_ROOT/sim/iverilog/out"

# Create output directory
mkdir -p $OUT_DIR

# Compile
iverilog -g2012 -DSIMULATION \
    -o $OUT_DIR/spi_slave.vvp \
    $SPI_ROOT/rtl/verilog/spi_async_fifo.sv \
    $SPI_ROOT/rtl/verilog/spi_slave_core.sv \
    $SPI_ROOT/tb/tb_spi_slave_core.sv

# Check for compilation errors
if [ $? -ne 0 ]; then
    echo "Compilation Failed"
    exit 1
fi

# Run Simulation
cd $OUT_DIR
vvp -l simulation.log spi_slave.vvp

# Check for runtime errors
if [ $? -ne 0 ]; then
    echo "Simulation Failed"
    exit 1
fi

echo "Simulation Passed"
