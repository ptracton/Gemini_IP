#!/bin/bash
# run_iverilog.sh

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    exit 1
fi

IP_DIR="$GEMINI_IP_ROOT/IP/interface/UART"
cd "$IP_DIR"

echo "Compiling UART Core (SystemVerilog) with Icarus Verilog..."
iverilog -g2012 -o sim/iverilog/uart_core_tb \
    ../../../IP/common/sync_fifo/rtl/verilog/sync_fifo.sv \
    rtl/verilog/uart_core.sv \
    tb/tb_uart_core.sv

if [ $? -eq 0 ]; then
    echo "Compilation successful. Running simulation..."
    vvp sim/iverilog/uart_core_tb
else
    echo "Compilation failed."
    exit 1
fi
