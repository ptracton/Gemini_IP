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
rm -rf sim/modelsim/work_dir
rm -f tools/*.log tools/*.vcd tools/*.o
cd verif/cocotb && make clean && cd - > /dev/null
cd tb && rm -f *.vvp *.vcd && cd - > /dev/null
rm -rf verif/formal/sp_memory_*

# Clean UVM
rm -rf verif/uvm/work_* verif/uvm/xsim.dir verif/uvm/*.log verif/uvm/*.pb verif/uvm/*.jou verif/uvm/*.wdb
rm -rf coverage* test_bist_merge test_bist_report cov_merge* axi_stress_report

echo "Clean Complete."
