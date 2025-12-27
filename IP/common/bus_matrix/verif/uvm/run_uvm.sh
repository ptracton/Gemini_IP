#!/bin/bash
# Description: Run UVM Simulation for Bus Matrix IP using Xilinx Vivado

# Paths
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
IP_DIR="$SCRIPT_DIR/../.."
SV_RTL_DIR="$IP_DIR/rtl/verilog"
VHDL_RTL_DIR="$IP_DIR/rtl/vhdl"
UVM_DIR="$SCRIPT_DIR"
# Source Setup
source $IP_DIR/../../../setup.sh

SHARED_AGENTS_DIR="${GEMINI_IP_ROOT}/IP/common/lib/verif/uvm/agents"

# Defaults
BUS_TYPE="mixed" 
TEST_NAME="bus_matrix_base_test"
LANG="verilog"
COVERAGE=0
BRIDGE=0

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -cov) COVERAGE=1 ;;
        -bridge) BRIDGE=1 ;;
        bridge_*) TEST_NAME=$1; BRIDGE=1 ;;
        bus_matrix_*) TEST_NAME=$1 ;;
        verilog|vhdl) LANG=$1 ;;
    esac
    shift
done

# Working Directory
WORK_DIR="work_${TEST_NAME}_${LANG}"
if [ $BRIDGE -eq 1 ]; then WORK_DIR="work_bridge_${TEST_NAME}_${LANG}"; fi
mkdir -p $WORK_DIR
cd $WORK_DIR

# Initial Defines
DEFINES=""
TOP="tb_bus_matrix"
if [ $BRIDGE -eq 1 ]; then 
    TOP="tb_ahb_apb_bridge"
    if [ "$LANG" == "vhdl" ]; then
        DEFINES="-d VHDL_DUT"
    fi
fi

# Coverage Flags
XELAB_COV_FLAGS=""
XSIM_COV_FLAGS=""
if [ $COVERAGE -eq 1 ]; then
    XELAB_COV_FLAGS="--cc_type sbct --cc_db $TEST_NAME"
    # Functional coverage also supported
    XSIM_COV_FLAGS="-cov_db_name $TEST_NAME"
fi

echo "=================================================="
echo "Running UVM Simulation: $TEST_NAME ($LANG)"
if [ $BRIDGE -eq 1 ]; then echo "Mode: BRIDGE TEST"; fi
if [ $COVERAGE -eq 1 ]; then echo "Coverage: ENABLED"; fi
echo "=================================================="

# Clean
rm -rf xsim.dir *.log *.jou *.pb

if [ $BRIDGE -eq 1 ]; then
    if [ "$LANG" == "verilog" ]; then
        echo "--- Compiling SV Bridge RTL ---"
        xvlog -sv $SV_RTL_DIR/ahb_apb_bridge.sv
    else
        echo "--- Compiling VHDL Bridge RTL ---"
        xvhdl -2008 -work work $VHDL_RTL_DIR/ahb_apb_bridge.vhd
    fi
else
    if [ "$LANG" == "verilog" ]; then
        echo "--- Compiling SV Matrix RTL ---"
        # Compile Package First
        xvlog -sv $SV_RTL_DIR/bus_matrix_pkg.sv

        # Core Components
        xvlog -sv $SV_RTL_DIR/bus_matrix_decoder.sv 
        xvlog -sv $SV_RTL_DIR/bus_matrix_arbiter.sv 
        xvlog -sv $SV_RTL_DIR/bus_matrix_register_slice.sv
        
        # Wrappers (Dependent on Core)
        xvlog -sv $SV_RTL_DIR/bus_matrix_ahb.sv 
        xvlog -sv $SV_RTL_DIR/bus_matrix_axi.sv 
        xvlog -sv $SV_RTL_DIR/bus_matrix_wb.sv
    else
        echo "--- Compiling VHDL Matrix RTL ---"
        xvhdl -2008 -work work $VHDL_RTL_DIR/bus_matrix_pkg.vhd
        xvhdl -2008 -work work $VHDL_RTL_DIR/bus_matrix_decoder.vhd
        xvhdl -2008 -work work $VHDL_RTL_DIR/bus_matrix_arbiter.vhd
        xvhdl -2008 -work work $VHDL_RTL_DIR/bus_matrix_register_slice.vhd
        xvhdl -2008 -work work $VHDL_RTL_DIR/bus_matrix_ahb.vhd
        xvhdl -2008 -work work $VHDL_RTL_DIR/bus_matrix_axi.vhd
        xvhdl -2008 -work work $VHDL_RTL_DIR/bus_matrix_wb.vhd
    fi
fi

echo "--- Compiling UVM Components ---"
xvlog -sv -L uvm \
    -i $SHARED_AGENTS_DIR/axi_agent \
    -i $SHARED_AGENTS_DIR/ahb_agent \
    -i $SHARED_AGENTS_DIR/wb_agent \
    -i $SHARED_AGENTS_DIR/apb_agent \
    $SHARED_AGENTS_DIR/axi_agent/axi_if.sv \
    $SHARED_AGENTS_DIR/axi_agent/axi_agent_pkg.sv \
    $SHARED_AGENTS_DIR/ahb_agent/ahb_if.sv \
    $SHARED_AGENTS_DIR/ahb_agent/ahb_agent_pkg.sv \
    $SHARED_AGENTS_DIR/wb_agent/wb_if.sv \
    $SHARED_AGENTS_DIR/wb_agent/wb_agent_pkg.sv \
    $SHARED_AGENTS_DIR/apb_agent/apb_if.sv \
    $SHARED_AGENTS_DIR/apb_agent/apb_agent_pkg.sv

if [ $BRIDGE -eq 1 ]; then
    xvlog -sv -L uvm \
        -i $UVM_DIR/uvm_env \
        -i $UVM_DIR/tests \
        $UVM_DIR/uvm_env/bridge_env_pkg.sv \
        $UVM_DIR/tests/bridge_test_pkg.sv
else
    xvlog -sv -L uvm \
        -i $UVM_DIR/uvm_env \
        -i $UVM_DIR/tests \
        -i $UVM_DIR/seq \
        $UVM_DIR/uvm_env/bus_matrix_env_pkg.sv \
        $UVM_DIR/seq/bus_matrix_seq_pkg.sv \
        $UVM_DIR/tests/bus_matrix_test_pkg.sv
fi

echo "--- Compiling Top ---"
xvlog -sv -L uvm $DEFINES $UVM_DIR/tb/$TOP.sv

echo "--- Elaborating ---"
xelab -debug all $XELAB_COV_FLAGS $TOP -s top_sim -timescale 1ns/1ps -L uvm -L work

echo "--- Simulating ---"
xsim top_sim -runall $XSIM_COV_FLAGS -testplusarg UVM_TESTNAME=$TEST_NAME -log uvm_sim.log

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
