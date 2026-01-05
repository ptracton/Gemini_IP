#!/bin/bash
# ------------------------------------------------------------------------------
# Script: run_ghdl.sh
# Description: Compiles and runs the VHDL-2008 testbench using GHDL.
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
WORK_DIR="$SPI_ROOT/sim/ghdl/work"

# Create work directory
mkdir -p $WORK_DIR
cd $WORK_DIR

# Clean
rm -rf *.cf

# Analyze
ghdl -a --std=08 $SPI_ROOT/rtl/vhdl/spi_async_fifo.vhd
ghdl -a --std=08 $SPI_ROOT/rtl/vhdl/spi_slave_core.vhd
ghdl -a --std=08 $SPI_ROOT/tb/tb_spi_slave_core.vhd

# Elaborate
ghdl -e --std=08 tb_spi_slave_core

# Run
ghdl -r --std=08 tb_spi_slave_core --stop-delta=20000 --stop-time=100us --wave=spi_slave.ghw | tee simulation.log

if [ $? -ne 0 ]; then
    echo "Simulation Failed"
    exit 1
fi

echo "Simulation Passed"
