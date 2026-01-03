#!/bin/bash
#-------------------------------------------------------------------------------
# File: run_modelsim.sh
# Description: ModelSim simulation orchestration for sp_memory IP.
#
# Tests multiple widths and depths for all bus interfaces.
#
# Usage: ./run_modelsim.sh
#-------------------------------------------------------------------------------

set -e

# Ensure environment is set up
if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    echo "Please source the project setup script:"
    echo "  source <path_to_gemini_ip>/setup.sh"
    exit 1
fi

# Set search paths
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
IP_DIR=$(realpath "$SCRIPT_DIR/../..")
RTL_DIR="$IP_DIR/rtl/verilog"
TB_DIR="$IP_DIR/tb"

# Test configurations
WIDTHS=(32 64)
DEPTHS=(256 512)
BUS_TYPES=("native" "axi" "apb" "wb" "ahb")
LANGS=("verilog" "vhdl")

# Create and enter work directory
mkdir -p "$SCRIPT_DIR/work_dir"
cd "$SCRIPT_DIR/work_dir"

# Summary logging
SUMMARY_LOG="regression_summary.log"
 echo "ModelSim Regression Summary - $(date)" > "$SUMMARY_LOG"
 echo "--------------------------------------------------" >> "$SUMMARY_LOG"

# Clean previous runs
rm -rf work transcript

PASS_COUNT=0
TOTAL_COUNT=0

for lang in "${LANGS[@]}"; do
    for width in "${WIDTHS[@]}"; do
        for depth in "${DEPTHS[@]}"; do
            for bus in "${BUS_TYPES[@]}"; do
                TOTAL_COUNT=$((TOTAL_COUNT + 1))
                TEST_ID="${lang}_${bus}_w${width}_d${depth}"
                
                echo "=================================================="
                echo "Running ModelSim: LANG=$lang, BUS=$bus, WIDTH=$width, DEPTH=$depth"
                echo "=================================================="
                
                # Recreate library
                if [ -d "work" ]; then vdel -all; fi
                vlib work
                
                # Language-specific RTL directory
                LANG_RTL_DIR="$IP_DIR/rtl/$lang"
                if [ "$lang" == "verilog" ]; then
                    RTL_EXT="sv"
                    COMPILE_CMD="vlog -work work -sv -timescale 1ns/1ps"
                else
                    RTL_EXT="vhd"
                    COMPILE_CMD="vcom -work work -2008"
                fi

                # Compile RTL Core
                $COMPILE_CMD "$LANG_RTL_DIR/sp_memory.$RTL_EXT"
                
                TOP_TB=""
                VLOG_OPTS=""
                
                # Always use SystemVerilog Testbench (Mixed Language)
                if [ "$bus" == "native" ]; then
                    TOP_TB="tb_sp_memory"
                    vlog -work work -sv -timescale "1ns/1ps" "$TB_DIR/tb_sp_memory.sv"
                else
                    TOP_TB="tb_sp_memory_bus"
                    BUS_UPPER=$(echo "$bus" | tr '[:lower:]' '[:upper:]')
                    VLOG_OPTS="+define+BUS_TYPE_$BUS_UPPER"
                    
                    # Compile Bus Wrapper
                    $COMPILE_CMD "$LANG_RTL_DIR/sp_memory_$bus.$RTL_EXT"
                    
                    # Compile Bus TB
                    vlog -work work -sv -timescale "1ns/1ps" $VLOG_OPTS "$TB_DIR/tb_sp_memory_bus.sv"
                fi
                
                # Simulate
                # -G sets parameters for the top-level module (SV) or generics (VHDL)
                LOG_FILE="transcript_$TEST_ID.log"
                vsim -work work -c -GWIDTH="$width" -GDEPTH="$depth" -do "run -all; quit" "$TOP_TB" | tee "$LOG_FILE"
                
                # Check for success
                if grep -q "ALL TESTS PASSED" "$LOG_FILE" || grep -q "Test Complete" "$LOG_FILE" || grep -q "report: ALL TESTS PASSED." "$LOG_FILE"; then
                    echo "RESULT: $TEST_ID -> PASS"
                    echo "| OK | $TEST_ID | PASS |" >> "$SUMMARY_LOG"
                    PASS_COUNT=$((PASS_COUNT + 1))
                else
                    echo "RESULT: $TEST_ID -> FAIL"
                    echo "| XX | $TEST_ID | FAIL |" >> "$SUMMARY_LOG"
                    echo "Error: Simulation failed for $TEST_ID"
                    exit 1
                fi
            done
        done
    done
done

echo "=================================================="
echo "Final Summary: $PASS_COUNT/$TOTAL_COUNT PASSED"
echo "=================================================="
cat "$SUMMARY_LOG"
