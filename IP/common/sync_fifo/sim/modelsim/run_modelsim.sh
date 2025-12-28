#!/bin/bash
# Run ModelSim Simulation

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    exit 1
fi

if [ ! -d "work" ]; then
    vlib work
fi

IP_DIR="$GEMINI_IP_ROOT/IP/common/sync_fifo"

# SV
vlog -sv "$IP_DIR/rtl/verilog/sync_fifo.sv" "$IP_DIR/tb/tb_sync_fifo.sv"
vsim -c -do "run -all; quit" tb_sync_fifo

# VHDL
vcom -2008 "$IP_DIR/rtl/vhdl/sync_fifo.vhd" "$IP_DIR/tb/tb_sync_fifo.vhd"
vsim -c -do "run -all; quit" tb_sync_fifo
