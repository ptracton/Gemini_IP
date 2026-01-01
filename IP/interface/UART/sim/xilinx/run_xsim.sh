#!/bin/bash
# Run Xilinx Simulation (SV and VHDL) for UART Core

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    exit 1
fi

UART_DIR="$GEMINI_IP_ROOT/IP/interface/UART"
FIFO_DIR="$GEMINI_IP_ROOT/IP/common/sync_fifo"

# Create sim directory if it doesn't exist
mkdir -p sim/xilinx/xsim_work

# SystemVerilog
echo "Compiling UART Core (SystemVerilog) with Xilinx xvlog..."
xvlog -sv -work xil_defaultlib \
    "$FIFO_DIR/rtl/verilog/sync_fifo.sv" \
    "$UART_DIR/rtl/verilog/uart_core.sv" \
    "$UART_DIR/tb/tb_uart_core.sv"

echo "Elaborating SystemVerilog Design..."
xelab -debug typical -top xil_defaultlib.tb_uart_core -snapshot tb_uart_sv -L xil_defaultlib

echo "Running SystemVerilog Simulation..."
xsim tb_uart_sv -R

# VHDL
echo "Compiling UART Core (VHDL) with Xilinx xvhdl..."
xvhdl -2008 -work xil_defaultlib \
    "$FIFO_DIR/rtl/vhdl/sync_fifo.vhd" \
    "$UART_DIR/rtl/vhdl/uart_core.vhd" \
    "$UART_DIR/tb/tb_uart_core.vhd"

echo "Elaborating VHDL Design..."
xelab -debug typical -top xil_defaultlib.tb_uart_core -snapshot tb_uart_vhd -L xil_defaultlib

echo "Running VHDL Simulation..."
xsim tb_uart_vhd -R
