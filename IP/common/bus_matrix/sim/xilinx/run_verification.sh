#!/bin/bash
set -e

# Project Paths
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
IP_DIR="$SCRIPT_DIR/../../.."
RTL_DIR="$IP_DIR/bus_matrix/rtl/verilog"

# Ensure environment is set up
source $IP_DIR/../setup.sh

mkdir -p work_verif
cd work_verif

# Clean
rm -rf xsim.dir *.log *.jou *.pb

echo "=================================================="
echo "Running Bus Matrix Verification"
echo "=================================================="

echo "--- Compiling RTL ---"
xvlog -sv \
    $RTL_DIR/bus_matrix_pkg.sv \
    $RTL_DIR/bus_matrix_arbiter.sv \
    $RTL_DIR/bus_matrix_decoder.sv \
    $RTL_DIR/bus_matrix_register_slice.sv \
    $RTL_DIR/bus_matrix_wb.sv \
    $RTL_DIR/bus_matrix_ahb.sv \
    $RTL_DIR/bus_matrix_axi.sv \
    $RTL_DIR/bus_matrix_tb.sv

echo "--- Elaborating ---"
xelab -debug typical bus_matrix_tb -s snapshot_tb

echo "--- Simulating ---"
xsim snapshot_tb -runall -log simulation.log

cat simulation.log
