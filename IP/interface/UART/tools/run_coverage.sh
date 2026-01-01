#!/bin/bash
# run_coverage.sh
# Orchestrate UART IP coverage collection and reporting

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT not set"
    exit 1
fi

COCOTB_DIR="$GEMINI_IP_ROOT/IP/interface/UART/verif/cocotb"
COVERAGE_DIR="$GEMINI_IP_ROOT/IP/interface/UART/verif/coverage"
mkdir -p "$COVERAGE_DIR"

# Clean previous coverage data
rm -f "$COCOTB_DIR"/*.dat
rm -rf "$COVERAGE_DIR"/*

echo "--- Starting Coverage Collection ---"

# List of targets to run for coverage
# We use Verilator (SV) for coverage collection
BUS_TYPES=("AXI" "APB" "WB")

for BUS in "${BUS_TYPES[@]}"; do
    echo "Running Coverage for BUS=$BUS..."
    cd "$COCOTB_DIR"
    make clean
    # Capture output for debugging and check status
    make BUS=$BUS SIM=verilator TOPLEVEL_LANG=verilog COVERAGE=1 > "$COVERAGE_DIR/sim_${BUS}.log" 2>&1
    
    # Cocotb with Verilator usually produces coverage.dat
    if [ -f "coverage.dat" ]; then
        mv coverage.dat "$COVERAGE_DIR/coverage_${BUS}.dat"
        echo "  BUS=$BUS: Coverage data collected."
    else
        echo "  BUS=$BUS: ERROR - No coverage data found."
    fi
done

echo "--- Merging Coverage Data ---"
cd "$COVERAGE_DIR"
# Correct syntax for verilator_coverage merging
# verilator_coverage [options] <files>...
# --write-dat is often used or just specifying the output file with redirect or specific flag
# Using the standard merge approach if supported by the version
verilator_coverage --write merged_coverage.dat coverage_*.dat

echo "--- Generating HTML Report ---"
# Generate annotation report
verilator_coverage merged_coverage.dat --annotate info.txt

echo "Coverage report summary saved to $COVERAGE_DIR/info.txt"
if [ -f "$COVERAGE_DIR/info.txt" ]; then
    grep "TOTAL" "$COVERAGE_DIR/info.txt" || true
else
    echo "Error: info.txt not generated."
fi
