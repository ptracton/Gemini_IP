#!/bin/bash
# Description: Run UVM Simulation for Bus Matrix IP using Xilinx Vivado

# Paths
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
IP_DIR="$SCRIPT_DIR/../.."
SV_RTL_DIR="$IP_DIR/rtl/verilog"
VHDL_RTL_DIR="$IP_DIR/rtl/vhdl"
UVM_DIR="$SCRIPT_DIR"
SHARED_AGENTS_DIR="$IP_DIR/../../common/lib/verif/uvm/agents"

# Source Setup
source $IP_DIR/../../../setup.sh

# Defaults
BUS_TYPE="mixed" # The testbench instantiates all 3, so 'mixed' or generic
TEST_NAME="bus_matrix_base_test"
LANG="verilog"

# Parse arguments
if [ -n "$1" ]; then TEST_NAME=$1; fi # Arg 1: TestName
if [ -n "$2" ]; then LANG=$2; fi      # Arg 2: Language

# Working Directory
WORK_DIR="work_${TEST_NAME}_${LANG}"
mkdir -p $WORK_DIR
cd $WORK_DIR

# Initial Defines
DEFINES=""
TOP="tb_bus_matrix"

echo "=================================================="
echo "Running UVM Simulation: $TEST_NAME ($LANG)"
echo "=================================================="

# Clean
rm -rf xsim.dir *.log *.jou *.pb

if [ "$LANG" == "verilog" ]; then
    echo "--- Compiling SV RTL ---"
    # Compile Package First
    xvlog -sv $SV_RTL_DIR/bus_matrix_pkg.sv

    # Core Components
    xvlog -sv $SV_RTL_DIR/bus_matrix_decoder.sv 
    xvlog -sv $SV_RTL_DIR/bus_matrix_arbiter.sv 
    xvlog -sv $SV_RTL_DIR/bus_matrix_slave_port.sv 
    xvlog -sv $SV_RTL_DIR/bus_matrix_master_port.sv 
    xvlog -sv $SV_RTL_DIR/brr_protection.sv 
    xvlog -sv $SV_RTL_DIR/bus_matrix_param_check.sv 
    
    # Wrappers (Dependent on Core)
    xvlog -sv $SV_RTL_DIR/bus_matrix_ahb.sv 
    xvlog -sv $SV_RTL_DIR/bus_matrix_axi.sv 
    xvlog -sv $SV_RTL_DIR/bus_matrix_wb.sv
else
    echo "--- Compiling VHDL RTL ---"
    # Not fully structured for VHDL mixed sim in this specific UVM run yet, 
    # but provided for future extension.
    # We would need to map the VHDL files here.
    echo "VHDL UVM run not fully configured in this script version."
    exit 1
fi

echo "--- Compiling UVM Components ---"
# Compile Agents
xvlog -sv -L uvm \
    -i $SHARED_AGENTS_DIR/axi_agent \
    -i $SHARED_AGENTS_DIR/ahb_agent \
    -i $SHARED_AGENTS_DIR/wb_agent \
    $SHARED_AGENTS_DIR/axi_agent/axi_if.sv \
    $SHARED_AGENTS_DIR/axi_agent/axi_agent_pkg.sv \
    $SHARED_AGENTS_DIR/ahb_agent/ahb_if.sv \
    $SHARED_AGENTS_DIR/ahb_agent/ahb_agent_pkg.sv \
    $SHARED_AGENTS_DIR/wb_agent/wb_if.sv \
    $SHARED_AGENTS_DIR/wb_agent/wb_agent_pkg.sv 

# Compile Env and Tests
xvlog -sv -L uvm \
    -i $UVM_DIR/uvm_env \
    -i $UVM_DIR/tests \
    -i $UVM_DIR/seq \
    $UVM_DIR/uvm_env/bus_matrix_env_pkg.sv \
    $UVM_DIR/seq/bus_matrix_seq_pkg.sv \
    $UVM_DIR/tests/bus_matrix_test_pkg.sv

echo "--- Compiling Top ---"
xvlog -sv -L uvm $DEFINES \
    $UVM_DIR/tb/$TOP.sv

echo "--- Elaborating ---"
xelab -debug all $TOP -s top_sim -timescale 1ns/1ps -L uvm

echo "--- Simulating ---"
xsim top_sim -runall -testplusarg UVM_TESTNAME=$TEST_NAME -log uvm_sim.log

# Check Result
if grep -q "UVM_ERROR :    0" uvm_sim.log && grep -q "UVM_FATAL :    0" uvm_sim.log; then
    echo "--------------------------"
    echo "UVM SIMULATION PASSED"
    echo "--------------------------"
else
    echo "--------------------------"
    echo "UVM SIMULATION FAILED"
    echo "--------------------------"
    grep "UVM_ERROR" uvm_sim.log
    grep "UVM_FATAL" uvm_sim.log
    exit 1
fi
