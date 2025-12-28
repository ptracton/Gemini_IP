#!/bin/bash
# Run Linting for Sync FIFO

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    exit 1
fi

IP_DIR="$GEMINI_IP_ROOT/IP/common/sync_fifo"
SV_RTL_DIR="$IP_DIR/rtl/verilog"
VHDL_RTL_DIR="$IP_DIR/rtl/vhdl"

echo "Linting SystemVerilog..."
verilator --lint-only -Wall -Wno-DECLFILENAME "$SV_RTL_DIR/sync_fifo.sv" --top-module sync_fifo

echo "Linting VHDL..."
ghdl -s --std=08 "$GEMINI_IP_ROOT/IP/common/sync_fifo/rtl/vhdl/sync_fifo.vhd"
