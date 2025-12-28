#!/bin/bash
# Cleanup Sync FIFO Artifacts

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    echo "Please source setup.sh"
    exit 1
fi

IP_DIR="$GEMINI_IP_ROOT/IP/common/sync_fifo"
cd "$IP_DIR"

echo "Cleaning Native Simulations..."
rm -f sim/iverilog/*.vvp sim/iverilog/*.vcd
rm -f sim/ghdl/*.vcd sim/ghdl/*.cf
rm -rf sim/modelsim/work sim/modelsim/transcript sim/modelsim/*.vcd
rm -rf sim/xilinx/xsim.dir sim/xilinx/*.pb sim/xilinx/*.jou sim/xilinx/*.log sim/xilinx/*.wdb sim/xilinx/*.str

echo "Cleaning Cocotb..."
rm -rf verif/cocotb/sim_build verif/cocotb/__pycache__ verif/cocotb/*.xml verif/cocotb/*.vcd

echo "Cleaning Synthesis..."
rm -rf synthesis/results synthesis/*.log synthesis/*.jou

echo "Cleaning Logs..."
rm -f tools/*.log

echo "Cleaning Root Artifacts..."
rm -rf db incremental_db
rm -f *.vcd *.qpsf *.o vivado* tb_sync_fifo *.cf *.qsf *.qpf *.vvp
