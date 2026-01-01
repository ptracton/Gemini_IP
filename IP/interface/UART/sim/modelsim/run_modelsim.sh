#!/bin/bash
# Run ModelSim Simulation for UART Core

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    exit 1
fi

# Create work library
if [ ! -d "sim/modelsim/work" ]; then
    vlib sim/modelsim/work
fi

UART_DIR="$GEMINI_IP_ROOT/IP/interface/UART"
FIFO_DIR="$GEMINI_IP_ROOT/IP/common/sync_fifo"

echo "Compiling UART Core (SystemVerilog) with ModelSim..."
vlog -work sim/modelsim/work -sv \
    "$FIFO_DIR/rtl/verilog/sync_fifo.sv" \
    "$UART_DIR/rtl/verilog/uart_core.sv" \
    "$UART_DIR/tb/tb_uart_core.sv"

echo "Running SystemVerilog Simulation..."
vsim -work sim/modelsim/work -c -do "run -all; quit" tb_uart_core

echo "Compiling UART Core (VHDL) with ModelSim..."
vcom -work sim/modelsim/work -2008 \
    "$FIFO_DIR/rtl/vhdl/sync_fifo.vhd" \
    "$UART_DIR/rtl/vhdl/uart_core.vhd" \
    "$UART_DIR/tb/tb_uart_core.vhd"

echo "Running VHDL Simulation..."
vsim -work sim/modelsim/work -c -do "run -all; quit" tb_uart_core
