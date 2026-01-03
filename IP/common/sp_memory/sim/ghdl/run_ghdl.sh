#!/bin/bash
# run_ghdl.sh
# Script to run sp_memory GHDL simulations

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT environment variable not set."
    exit 1
fi

SIM_DIR=$GEMINI_IP_ROOT/IP/common/sp_memory/sim/ghdl
IP_DIR=$GEMINI_IP_ROOT/IP/common/sp_memory
TB_DIR=$IP_DIR/tb
RTL_DIR=$IP_DIR/rtl/vhdl

mkdir -p $SIM_DIR/build

run_test() {
    TEST_NAME=$1
    TB_ENTITY=$2
    TB_FILE=$3
    WRAPPER=$4
    
    ghdl -i --std=08 --workdir=$SIM_DIR/build $RTL_DIR/sp_memory.vhd
    ghdl -i --std=08 --workdir=$SIM_DIR/build $TB_DIR/$TB_FILE
    
    ghdl -m --std=08 --workdir=$SIM_DIR/build $TB_ENTITY
    if [ $? -ne 0 ]; then
        echo "Error: Compilation failed for $TEST_NAME"
        exit 1
    fi
    
    ghdl -r --std=08 --workdir=$SIM_DIR/build $TB_ENTITY --stop-time=1000ns
    if [ $? -ne 0 ]; then
        echo "Error: Simulation failed for $TEST_NAME"
        exit 1
    fi
}

# Run All Tests if no arguments, or specific test
if [ -z "$1" ]; then
    run_test "Native_VHDL" "tb_sp_memory" "tb_sp_memory.vhd" ""
    # Add bus tests here once tb_sp_memory_bus.vhd is ready
else
    case $1 in
        "Native_VHDL") run_test "Native_VHDL" "tb_sp_memory" "tb_sp_memory.vhd" "" ;;
        *) echo "Unknown test: $1"; exit 1 ;;
    esac
fi
