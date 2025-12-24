#!/bin/bash
set -e

# Project Paths
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
# Adjust path to find IP root (IP/common/bus_matrix/sim/icarus -> ../../../..)
# Assuming script is in sim/icarus/
IP_DIR="$SCRIPT_DIR/../../../.."
RTL_DIR="$IP_DIR/common/bus_matrix/rtl/verilog"

# Create output directory
mkdir -p work_iverilog
cd work_iverilog

echo "=================================================="
echo "Running Icarus Verilog Verification"
echo "=================================================="

echo "--- Compiling RTL ---"
# -g2012 for SystemVerilog support
iverilog -g2012 -o bus_matrix_tb.vvp \
    -I $RTL_DIR \
    $RTL_DIR/bus_matrix_pkg.sv \
    $RTL_DIR/bus_matrix_arbiter.sv \
    $RTL_DIR/bus_matrix_decoder.sv \
    $RTL_DIR/bus_matrix_register_slice.sv \
    $RTL_DIR/bus_matrix_wb.sv \
    $RTL_DIR/bus_matrix_ahb.sv \
    $RTL_DIR/bus_matrix_axi.sv \
    $RTL_DIR/bus_matrix_tb.sv

echo "--- Running Simulation ---"
vvp bus_matrix_tb.vvp | tee simulation.log

echo "=================================================="
if grep -q "FAIL" simulation.log; then
    echo "TEST FAILED"
    exit 1
else
    echo "TEST PASSED"
    exit 0
fi
