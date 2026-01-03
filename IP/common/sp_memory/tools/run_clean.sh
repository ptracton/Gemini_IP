#!/bin/bash
set -e

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT environment variable not set."
    exit 1
fi

ROOT_DIR=$GEMINI_IP_ROOT/IP/common/sp_memory
cd "$ROOT_DIR"

echo "Cleaning sp_memory artifacts..."

# Clean Sim
rm -rf sim_build *.log *.jou *.pb *.wdb xsim.dir .Xil *.vcd
cd verif/cocotb && make clean && cd - > /dev/null
cd tb && rm -f *.vvp *.vcd && cd - > /dev/null

echo "Clean Complete."
