#!/bin/bash
# Run GHDL Simulation

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    exit 1
fi

IP_DIR="$GEMINI_IP_ROOT/IP/common/sync_fifo"
RTL_DIR="$IP_DIR/rtl/vhdl"
TB_DIR="$IP_DIR/tb"

echo "Analyzing..."
ghdl -a --std=08 "$RTL_DIR/sync_fifo.vhd"
ghdl -a --std=08 "$TB_DIR/tb_sync_fifo.vhd"

echo "Elaborating..."
ghdl -e --std=08 tb_sync_fifo

echo "Running..."
ghdl -r --std=08 tb_sync_fifo --vcd=dump.vcd

