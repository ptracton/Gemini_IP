#!/bin/bash
# run_ghdl.sh

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    exit 1
fi

IP_DIR="$GEMINI_IP_ROOT/IP/interface/UART"
cd "$IP_DIR"

mkdir -p sim/ghdl

echo "Compiling UART Core (VHDL) with GHDL..."
ghdl -a --std=08 --work=work -Psim/ghdl ../../../IP/common/sync_fifo/rtl/vhdl/sync_fifo.vhd
ghdl -a --std=08 --work=work -Psim/ghdl rtl/vhdl/uart_core.vhd
ghdl -a --std=08 --work=work -Psim/ghdl tb/tb_uart_core.vhd
ghdl -e --std=08 --work=work -Psim/ghdl tb_uart_core

if [ $? -eq 0 ]; then
    echo "Compilation successful. Running simulation..."
    ghdl -r --std=08 --work=work -Psim/ghdl tb_uart_core --stop-time=1ms
else
    echo "Compilation failed."
    exit 1
fi
