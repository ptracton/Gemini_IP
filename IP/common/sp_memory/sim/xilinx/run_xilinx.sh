#!/bin/bash
# run_xilinx.sh
# Script to run sp_memory Xilinx Vivado simulations

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT environment variable not set."
    exit 1
fi

SIM_DIR=$GEMINI_IP_ROOT/IP/common/sp_memory/sim/xilinx
IP_DIR=$GEMINI_IP_ROOT/IP/common/sp_memory
TB_DIR=$IP_DIR/tb
SV_RTL_DIR=$IP_DIR/rtl/verilog
V_RTL_DIR=$IP_DIR/rtl/vhdl

mkdir -p $SIM_DIR/build

run_sv_test() {
    TEST_NAME=$1
    MACRO=$2
    TB_TOP=$3
    WRAPPER=$4
    WIDTH=$5
    DEPTH=$6
    TECH=$7
    
    echo "Running Xilinx SV Test: $TEST_NAME ($WIDTH, $DEPTH, $TECH)"
    
    cd $SIM_DIR/build
    rm -rf xsim.dir
    
    FILES="$SV_RTL_DIR/sp_memory.sv"
    if [ ! -z "$WRAPPER" ]; then
        FILES="$FILES $SV_RTL_DIR/$WRAPPER"
    fi
    FILES="$FILES $TB_DIR/$TB_TOP.sv"
    
    MACRO_ARG=""
    if [ ! -z "$MACRO" ]; then
        MACRO_ARG="-d $MACRO"
    fi
    
    xvlog --sv $MACRO_ARG $FILES
    xelab -debug typical -top $TB_TOP -snapshot $TEST_NAME --timescale 1ns/1ps \
          -generic_top "WIDTH=$WIDTH" -generic_top "DEPTH=$DEPTH" -generic_top "TECHNOLOGY=$TECH"
    xsim $TEST_NAME -R
}

run_vhdl_test() {
    TEST_NAME=$1
    MACRO=$2
    TB_TOP=$3
    WRAPPER=$4
    WIDTH=$5
    DEPTH=$6
    TECH=$7
    
    echo "Running Xilinx VHDL Test: $TEST_NAME ($WIDTH, $DEPTH, $TECH)"
    
    cd $SIM_DIR/build
    rm -rf xsim.dir
    
    V_FILES="$V_RTL_DIR/sp_memory.vhd"
    if [ ! -z "$WRAPPER" ]; then
        V_FILES="$V_FILES $V_RTL_DIR/$WRAPPER"
    fi
    xvhdl -2008 $V_FILES
    
    MACRO_ARG=""
    if [ ! -z "$MACRO" ]; then
        MACRO_ARG="-d $MACRO"
    fi
    
    xvlog --sv $MACRO_ARG $TB_DIR/$TB_TOP.sv
    
    xelab -debug typical -top $TB_TOP -snapshot $TEST_NAME --timescale 1ns/1ps \
          -generic_top "WIDTH=$WIDTH" -generic_top "DEPTH=$DEPTH" -generic_top "TECHNOLOGY=$TECH"
    xsim $TEST_NAME -R
}

# Simple dispatcher
if [ -z "$1" ]; then
    run_sv_test "sn_sv_native" "" "tb_sp_memory" "" 32 1024 "GENERIC"
else
    case $1 in
        "Xilinx_SV_Native") run_sv_test "sn_sv_native" "" "tb_sp_memory" "" 32 1024 "GENERIC" ;;
        "Xilinx_SV_AXI")    run_sv_test "sn_sv_axi" "BUS_TYPE_AXI" "tb_sp_memory_bus" "sp_memory_axi.sv" 32 2048 "XILINX" ;;
        "Xilinx_VHDL_AXI")  run_vhdl_test "sn_vhdl_axi" "BUS_TYPE_AXI" "tb_sp_memory_bus" "sp_memory_axi.vhd" 32 2048 "XILINX" ;;
        *) echo "Unknown test: $1"; exit 1 ;;
    esac
fi
