#!/bin/bash
# Run Xilinx Simulation (SV and VHDL)

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    exit 1
fi

IP_DIR="$GEMINI_IP_ROOT/IP/common/sync_fifo"
SV_RTL_DIR="$IP_DIR/rtl/verilog"
VHDL_RTL_DIR="$IP_DIR/rtl/vhdl"
TB_DIR="$IP_DIR/tb"

# SystemVerilog
echo "Running SystemVerilog Simulation..."
xvlog -sv "$SV_RTL_DIR/sync_fifo.sv" "$TB_DIR/tb_sync_fifo.sv"
xelab -debug typical -top tb_sync_fifo -snapshot tb_fifo_sv
xsim tb_fifo_sv -R

# VHDL
echo "Running VHDL Simulation..."
xvhdl -2008 "$VHDL_RTL_DIR/sync_fifo.vhd" "$TB_DIR/tb_sync_fifo.vhd"
xelab -debug typical -top tb_sync_fifo -snapshot tb_fifo_vhd
xsim tb_fifo_vhd -R
