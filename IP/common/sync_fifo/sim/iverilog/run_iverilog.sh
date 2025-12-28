#!/bin/bash
# Run Icarus Verilog Simulation

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    exit 1
fi

IP_DIR="$GEMINI_IP_ROOT/IP/common/sync_fifo"
RTL_DIR="$IP_DIR/rtl/verilog"
TB_DIR="$IP_DIR/tb"

echo "Compiling..."
iverilog -g2012 -o test_fifo.vvp \
    -I "$RTL_DIR" \
    "$RTL_DIR/sync_fifo.sv" \
    "$TB_DIR/tb_sync_fifo.sv"

if [ $? -eq 0 ]; then
    echo "Running..."
    vvp test_fifo.vvp
else
    echo "Compilation Failed"
    exit 1
fi
