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
# --lint-only: Only perform linting
# -Wall: Enable all warnings
# -Wno-DECLFILENAME: Ignore filename vs module name mismatch
verilator --lint-only -Wall -Wno-DECLFILENAME \
    -I$SV_RTL_DIR \
    $SV_RTL_DIR/timer_core.sv \
    $SV_RTL_DIR/timer_regs.sv \
    $SV_RTL_DIR/timer_apb.sv \
    $SV_RTL_DIR/timer_axi.sv \
    $SV_RTL_DIR/timer_wb.sv \
    --top-module timer_axi

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
