#!/bin/bash

# -----------------------------------------------------------------------------
# Script: run_ghdl.sh
# Description:
#    Compiles and runs GHDL simulations for the SPI Slave IP and its wrappers.
#    Sets up the environment and executes VHDL-2008 tests.
#
# Author: Gemini-3 AI
# -----------------------------------------------------------------------------

set -e

# Environment Setup
if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set. Please source setup.sh"
    exit 1
fi

SPI_ROOT=$GEMINI_IP_ROOT/IP/interface/SPI_Slave
OUT_DIR=$SPI_ROOT/sim/ghdl/work

mkdir -p $OUT_DIR

echo "Compiling SPI Slave VHDL RTL..."
ghdl -a --std=08 --workdir=$OUT_DIR $SPI_ROOT/rtl/vhdl/spi_async_fifo.vhd
ghdl -a --std=08 --workdir=$OUT_DIR $SPI_ROOT/rtl/vhdl/spi_slave_core.vhd
ghdl -a --std=08 --workdir=$OUT_DIR $SPI_ROOT/rtl/vhdl/spi_slave_wb.vhd
ghdl -a --std=08 --workdir=$OUT_DIR $SPI_ROOT/rtl/vhdl/spi_slave_axi.vhd
ghdl -a --std=08 --workdir=$OUT_DIR $SPI_ROOT/rtl/vhdl/spi_slave_ahb.vhd

# -----------------------------------------------------------------------------
# Testbench: SPI Slave Core
# -----------------------------------------------------------------------------
echo "Compiling SPI Slave Core Testbench..."
ghdl -a --std=08 --workdir=$OUT_DIR $SPI_ROOT/tb/tb_spi_slave_core.vhd
ghdl -e --std=08 --workdir=$OUT_DIR tb_spi_slave_core

echo "Running Core Simulation..."
ghdl -r --std=08 --workdir=$OUT_DIR tb_spi_slave_core --stop-delta=20000 --stop-time=100us

# -----------------------------------------------------------------------------
# Testbench: SPI Slave Wishbone Wrapper
# -----------------------------------------------------------------------------
echo "Compiling SPI Slave Wishbone Wrapper Testbench..."
ghdl -a --std=08 --workdir=$OUT_DIR $SPI_ROOT/tb/tb_spi_slave_wb.vhd
ghdl -e --std=08 --workdir=$OUT_DIR tb_spi_slave_wb

echo "Running Wishbone Simulation..."
ghdl -r --std=08 --workdir=$OUT_DIR tb_spi_slave_wb --stop-delta=20000 --stop-time=100us

# -----------------------------------------------------------------------------
# Testbench: SPI Slave AXI4-Lite Wrapper
# -----------------------------------------------------------------------------
echo "Compiling SPI Slave AXI4-Lite Wrapper Testbench..."
ghdl -a --std=08 --workdir=$OUT_DIR $SPI_ROOT/tb/tb_spi_slave_axi.vhd
ghdl -e --std=08 --workdir=$OUT_DIR tb_spi_slave_axi

echo "Running AXI Simulation..."
ghdl -r --std=08 --workdir=$OUT_DIR tb_spi_slave_axi --stop-delta=20000 --stop-time=100us

# -----------------------------------------------------------------------------
# Testbench: SPI Slave AHB Master Wrapper
# -----------------------------------------------------------------------------
echo "Compiling SPI Slave AHB Master Wrapper Testbench..."
ghdl -a --std=08 --workdir=$OUT_DIR $SPI_ROOT/tb/tb_spi_slave_ahb.vhd
ghdl -e --std=08 --workdir=$OUT_DIR tb_spi_slave_ahb

echo "Running AHB Simulation..."
ghdl -r --std=08 --workdir=$OUT_DIR tb_spi_slave_ahb --stop-delta=20000 --stop-time=100us

echo "All VHDL Simulations Completed Successfully"
