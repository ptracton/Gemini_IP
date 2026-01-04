#!/bin/bash
# Description: Run UVM Simulation for SP Memory IP using Xilinx Vivado

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    echo "Please source the project setup script:"
    echo "  source <path_to_gemini_ip>/setup.sh"
    exit 1
fi

# Paths
IP_DIR="$GEMINI_IP_ROOT/IP/common/sp_memory"
SV_RTL_DIR="$IP_DIR/rtl/verilog"
VHDL_RTL_DIR="$IP_DIR/rtl/vhdl"
UVM_DIR="$IP_DIR/verif/uvm"

# Defaults
BUS_TYPE="axi"
TEST_NAME="sp_memory_access_test"
LANG="verilog"
TECH="GENERIC"
ECC=1
PARITY=0

# Parse arguments
# Usage: ./run_uvm.sh [bus] [lang] [test] [tech] [ecc] [parity] [-args ...]
if [ -n "$1" ]; then BUS_TYPE=$1; shift; fi
if [ -n "$1" ]; then LANG=$1; shift; fi
if [ -n "$1" ]; then TEST_NAME=$1; shift; fi
if [ -n "$1" ]; then TECH=$1; shift; fi
if [ -n "$1" ]; then ECC=$1; shift; fi
if [ -n "$1" ]; then PARITY=$1; shift; fi

EXTRA_ARGS=""
if [ "$1" == "-args" ]; then
    shift
    EXTRA_ARGS="$@"
fi

# Working Directory
WORK_DIR="$UVM_DIR/work_${BUS_TYPE}_${TEST_NAME}_${LANG}_${TECH}_ECC${ECC}_PAR${PARITY}"
mkdir -p $WORK_DIR
cd $WORK_DIR

# Initial Defines
DEFINES="-d TECHNOLOGY=$TECH -d ECC_EN=$ECC -d PARITY_EN=$PARITY"

# Extract INIT_FILE if present in EXTRA_ARGS
# Looking for +INIT_FILE=filename
if [[ $EXTRA_ARGS =~ \+INIT_FILE=([^[:space:]]+) ]]; then
    INIT_VAL="${BASH_REMATCH[1]}"
    DEFINES="$DEFINES -d INIT_FILE=$INIT_VAL"
    # Remove +INIT_FILE argument from EXTRA_ARGS to avoid xsim errors
    EXTRA_ARGS=${EXTRA_ARGS//+INIT_FILE=[^[:space:]]*/}
fi

TOP="tb_top"

echo "=================================================="
echo "Running UVM Simulation: $BUS_TYPE ($LANG) Tech=$TECH ECC=$ECC PARITY=$PARITY"
echo "=================================================="

# Set defines based on bus type
if [ "$BUS_TYPE" == "axi" ]; then 
    DEFINES="$DEFINES -d BUS_AXI"
elif [ "$BUS_TYPE" == "apb" ]; then 
    DEFINES="$DEFINES -d BUS_APB"
elif [ "$BUS_TYPE" == "wb" ]; then 
    DEFINES="$DEFINES -d BUS_WB"
elif [ "$BUS_TYPE" == "ahb" ]; then
    DEFINES="$DEFINES -d BUS_AHB"
fi

if [ "$LANG" == "vhdl" ]; then
    TOP="tb_top_vhdl"
fi

# Clean
rm -rf xsim.dir *.log *.jou *.pb

# Compile RTL
if [ "$LANG" == "verilog" ]; then
    echo "--- Compiling SV RTL ---"
    SHARED_RTL_DIR="$IP_DIR/../../common/lib/rtl"
    xvlog -sv -d SIMULATION \
        $SHARED_RTL_DIR/axi4lite_slave_adapter.sv \
        $SHARED_RTL_DIR/apb_slave_adapter.sv \
        $SHARED_RTL_DIR/wb_slave_adapter.sv \
        $SV_RTL_DIR/sp_memory.sv \
        $SV_RTL_DIR/sp_memory_apb.sv \
        $SV_RTL_DIR/sp_memory_axi.sv \
        $SV_RTL_DIR/sp_memory_wb.sv \
        $SV_RTL_DIR/sp_memory_ahb.sv
else
    echo "--- Compiling VHDL RTL ---"
    SHARED_RTL_DIR="$IP_DIR/../../common/lib/rtl"
    xvhdl -2008 $SHARED_RTL_DIR/axi4lite_slave_adapter.vhd
    xvhdl -2008 $SHARED_RTL_DIR/apb_slave_adapter.vhd
    xvhdl -2008 $SHARED_RTL_DIR/wb_slave_adapter.vhd
    xvhdl -2008 $VHDL_RTL_DIR/sp_memory.vhd
    xvhdl -2008 $VHDL_RTL_DIR/sp_memory_apb.vhd
    xvhdl -2008 $VHDL_RTL_DIR/sp_memory_axi.vhd
    xvhdl -2008 $VHDL_RTL_DIR/sp_memory_wb.vhd
    xvhdl -2008 $VHDL_RTL_DIR/sp_memory_ahb.vhd
fi

echo "--- Compiling UVM Components ---"
SHARED_AGENTS_DIR="$IP_DIR/../../common/lib/verif/uvm/agents"
xvlog -sv -L uvm \
    -i $UVM_DIR/seq \
    -i $UVM_DIR/tests \
    -i $UVM_DIR/agents/sp_memory_agent \
    -i $SHARED_AGENTS_DIR/axi_agent \
    -i $SHARED_AGENTS_DIR/apb_agent \
    -i $SHARED_AGENTS_DIR/wb_agent \
    -i $SHARED_AGENTS_DIR/ahb_agent \
    -i $UVM_DIR/uvm_env \
    $SHARED_AGENTS_DIR/apb_agent/apb_if.sv \
    $SHARED_AGENTS_DIR/apb_agent/apb_agent_pkg.sv \
    $SHARED_AGENTS_DIR/axi_agent/axi_if.sv \
    $SHARED_AGENTS_DIR/axi_agent/axi_agent_pkg.sv \
    $SHARED_AGENTS_DIR/wb_agent/wb_if.sv \
    $SHARED_AGENTS_DIR/wb_agent/wb_agent_pkg.sv \
    $SHARED_AGENTS_DIR/ahb_agent/ahb_if.sv \
    $SHARED_AGENTS_DIR/ahb_agent/ahb_agent_pkg.sv \
    $UVM_DIR/agents/sp_memory_agent/sp_memory_if.sv \
    $UVM_DIR/agents/sp_memory_agent/sp_memory_agent_pkg.sv \
    $UVM_DIR/uvm_env/sp_memory_env_pkg.sv \
    $UVM_DIR/tests/sp_memory_test_pkg.sv

echo "--- Compiling Top ---"
xvlog -sv -L uvm $DEFINES \
    $UVM_DIR/tb/$TOP.sv

echo "--- Elaborating ---"
xelab -debug all $TOP -s top_sim -timescale 1ns/1ps -L uvm -cc_type sbct

echo "--- Simulating ---"
xsim top_sim $EXTRA_ARGS -runall -testplusarg UVM_TESTNAME=$TEST_NAME -testplusarg BUS_TYPE=${BUS_TYPE^^} -log uvm_sim.log

# Archive Coverage
COV_REPO_DIR="$IP_DIR/coverage_repo/xsim.codeCov"
mkdir -p $COV_REPO_DIR
if [ -d "xsim.codeCov/top_sim" ]; then
    DB_NAME="uvm_${TEST_NAME}_${BUS_TYPE}_${LANG}_${TECH}_ECC${ECC}_PAR${PARITY}"
    rm -rf $COV_REPO_DIR/$DB_NAME
    cp -r xsim.codeCov/top_sim $COV_REPO_DIR/$DB_NAME
fi

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
