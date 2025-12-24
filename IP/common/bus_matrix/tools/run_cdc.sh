#!/bin/bash
# Description: Run CDC and structural linting using Verilator

# Paths
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
IP_DIR="$SCRIPT_DIR/.."
SV_RTL_DIR="$IP_DIR/rtl/verilog"

echo "=================================================="
echo "Running CDC and structural linting with Verilator"
echo "=================================================="

# Run Verilator Lint
SHARED_RTL_DIR="$IP_DIR/../../common/lib/rtl"
SHARED_VERIF_DIR="$IP_DIR/../../common/lib/verif"
verilator --lint-only -Wall -Wno-DECLFILENAME \
    -I$SV_RTL_DIR -I$SHARED_RTL_DIR -I$SHARED_VERIF_DIR \
    $SHARED_RTL_DIR/axi4lite_slave_adapter.sv \
    $SHARED_RTL_DIR/apb_slave_adapter.sv \
    $SHARED_RTL_DIR/wb_slave_adapter.sv \
    $SV_RTL_DIR/bus_matrix_core.sv \
    $SV_RTL_DIR/bus_matrix_regs.sv \
    $SV_RTL_DIR/bus_matrix_apb.sv \
    $SV_RTL_DIR/bus_matrix_axi.sv \
    $SV_RTL_DIR/bus_matrix_wb.sv \
    --top-module bus_matrix_axi

if [ $? -eq 0 ]; then
    echo "--------------------------"
    echo "VERILATOR LINT PASSED"
    echo "--------------------------"
else
    echo "--------------------------"
    echo "VERILATOR LINT FAILED"
    echo "--------------------------"
    exit 1
fi
