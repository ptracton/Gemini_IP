#!/bin/bash
# run_iverilog.sh
# Script to run sp_memory Iverilog simulations

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT environment variable not set."
    exit 1
fi

SIM_DIR=$GEMINI_IP_ROOT/IP/common/sp_memory/sim/iverilog
IP_DIR=$GEMINI_IP_ROOT/IP/common/sp_memory
TB_DIR=$IP_DIR/tb
RTL_DIR=$IP_DIR/rtl/verilog

mkdir -p $SIM_DIR/build

run_test() {
    TEST_NAME=$1
    MACRO=$2
    TB_FILE=$3
    WRAPPER=$4
    
    echo "Running Iverilog Test: $TEST_NAME"
    
    FILES="$RTL_DIR/sp_memory.sv"
    if [ ! -z "$WRAPPER" ]; then
        FILES="$FILES $RTL_DIR/$WRAPPER"
    fi
    FILES="$FILES $TB_DIR/$TB_FILE"
    
    COMPILE_ARGS="-g2012"
    if [ ! -z "$MACRO" ]; then
        COMPILE_ARGS="$COMPILE_ARGS -D$MACRO"
    fi
    
    iverilog $COMPILE_ARGS -o $SIM_DIR/build/$TEST_NAME.vvp $FILES
    if [ $? -ne 0 ]; then
        echo "Error: Compilation failed for $TEST_NAME"
        exit 1
    fi
    
    vvp $SIM_DIR/build/$TEST_NAME.vvp
    if [ $? -ne 0 ]; then
        echo "Error: Simulation failed for $TEST_NAME"
        exit 1
    fi
}

# Run All Tests if no arguments, or specific test
if [ -z "$1" ]; then
    run_test "Native_SV" "" "tb_sp_memory.sv" ""
    run_test "Native_SV_AXI" "BUS_TYPE_AXI" "tb_sp_memory_bus.sv" "sp_memory_axi.sv"
    run_test "Native_SV_APB" "BUS_TYPE_APB" "tb_sp_memory_bus.sv" "sp_memory_apb.sv"
    run_test "Native_SV_WB"  "BUS_TYPE_WB"  "tb_sp_memory_bus.sv" "sp_memory_wb.sv"
    run_test "Native_SV_AHB" "BUS_TYPE_AHB" "tb_sp_memory_bus.sv" "sp_memory_ahb.sv"
else
    case $1 in
        "Native_SV")     run_test "Native_SV" "" "tb_sp_memory.sv" "" ;;
        "Native_SV_AXI") run_test "Native_SV_AXI" "BUS_TYPE_AXI" "tb_sp_memory_bus.sv" "sp_memory_axi.sv" ;;
        "Native_SV_APB") run_test "Native_SV_APB" "BUS_TYPE_APB" "tb_sp_memory_bus.sv" "sp_memory_apb.sv" ;;
        "Native_SV_WB")  run_test "Native_SV_WB"  "BUS_TYPE_WB"  "tb_sp_memory_bus.sv" "sp_memory_wb.sv"  ;;
        "Native_SV_AHB") run_test "Native_SV_AHB" "BUS_TYPE_AHB" "tb_sp_memory_bus.sv" "sp_memory_ahb.sv" ;;
        *) echo "Unknown test: $1"; exit 1 ;;
    esac
fi
