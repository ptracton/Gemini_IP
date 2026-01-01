#!/bin/bash
# run_lint.sh

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    exit 1
fi

IP_DIR="$GEMINI_IP_ROOT/IP/interface/UART"
cd "$IP_DIR"

# Run Verilator Lint
echo "Running Verilator Lint (SystemVerilog)..."
verilator --lint-only -Wall --top-module uart_axi \
    -Wno-TIMESCALEMOD -Wno-PINCONNECTEMPTY -Wno-UNUSEDPARAM -Wno-UNUSEDSIGNAL \
    -I$GEMINI_IP_ROOT/IP/common/lib/rtl \
    -I$GEMINI_IP_ROOT/IP/common/sync_fifo/rtl/verilog \
    -I$GEMINI_IP_ROOT/IP/interface/UART/rtl/verilog \
    rtl/verilog/uart_core.sv \
    rtl/verilog/uart_axi.sv \
    rtl/verilog/uart_apb.sv \
    rtl/verilog/uart_wb.sv

if [ $? -eq 0 ]; then
    echo "Verilator Lint PASSED."
else
    echo "Verilator Lint FAILED."
    # exit 1 # Don't exit yet, check VHDL too
fi

echo "Running GHDL Lint (VHDL)..."
ghdl -a --std=08 --work=work \
    $GEMINI_IP_ROOT/IP/common/lib/rtl/*.vhd \
    $GEMINI_IP_ROOT/IP/common/sync_fifo/rtl/vhdl/sync_fifo.vhd \
    rtl/vhdl/uart_core.vhd \
    rtl/vhdl/uart_axi.vhd \
    rtl/vhdl/uart_apb.vhd \
    rtl/vhdl/uart_wb.vhd

if [ $? -eq 0 ]; then
    echo "GHDL Lint PASSED."
else
    echo "GHDL Lint FAILED."
    exit 1
fi
