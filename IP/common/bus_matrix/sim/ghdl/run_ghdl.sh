#!/bin/bash
# ------------------------------------------------------------------------------
# File: run_ghdl.sh
# Description: GHDL orchestration script for Bus Matrix IP (VHDL).
# ------------------------------------------------------------------------------
set -e

# Project Paths
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
IP_DIR="$SCRIPT_DIR/../../../../"
RTL_DIR="$IP_DIR/common/bus_matrix/rtl/vhdl"
TB_DIR="$IP_DIR/common/bus_matrix/tb"

# Create work directory
mkdir -p work_ghdl
cd work_ghdl

# Clean
rm -f *.o *.cf *.vcd

echo "=================================================="
echo "Running GHDL Simulation for: bus_matrix_tb"
echo "=================================================="

echo "--- Analyzing Common BFMs ---"
ghdl -a --std=08 $IP_DIR/common/lib/verif/wb_bfm_pkg.vhd
ghdl -a --std=08 $IP_DIR/common/lib/verif/axi_bfm_pkg.vhd

echo "--- Analyzing RTL ---"
ghdl -a --std=08 $RTL_DIR/bus_matrix_pkg.vhd
ghdl -a --std=08 $RTL_DIR/bus_matrix_arbiter.vhd
ghdl -a --std=08 $RTL_DIR/bus_matrix_decoder.vhd
ghdl -a --std=08 $RTL_DIR/bus_matrix_register_slice.vhd
ghdl -a --std=08 $RTL_DIR/bus_matrix_wb.vhd
ghdl -a --std=08 $RTL_DIR/bus_matrix_ahb.vhd
# AXI not tested in this TB yet, but including compilation
ghdl -a --std=08 $RTL_DIR/bus_matrix_axi.vhd

echo "--- Analyzing Testbench ---"
ghdl -a --std=08 $TB_DIR/bus_matrix_tb.vhd

echo "--- Elaborating ---"
ghdl -e --std=08 bus_matrix_tb

echo "--- Simulating ---"
ghdl -r --std=08 bus_matrix_tb --vcd=bus_matrix.vcd --stop-time=1us

echo "=================================================="
echo "GHDL SIMULATION COMPLETE"
echo "=================================================="
