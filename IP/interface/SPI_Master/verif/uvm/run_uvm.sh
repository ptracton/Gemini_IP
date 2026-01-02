#!/bin/bash

# Check if GEMINI_IP_ROOT is set
if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    echo "Please source the setup.sh script from the root of the repository."
    echo "Example: source <repo_root>/setup.sh"
    exit 1
fi

# Directory definitions
UVM_DIR=$(pwd)
COV_REPORT_DIR="coverage_report_regression"

# Stop on error
set -e

echo "========================================"
echo "Starting SPI Master UVM Regression"
echo "========================================"

# Clean previous run
echo "Cleaning..."
make clean

# Compile
echo "Compiling..."
make comp

# Elaborate
echo "Elaborating..."
make elab

# Run Tests
TESTS=(
    "spi_master_sanity_test"
    "spi_master_tx_test"
    "spi_master_coverage_test"
    "spi_master_dma_test"
    "spi_master_apb_stress_test"
)

echo "Running Tests..."
for test_name in "${TESTS[@]}"; do
    echo "----------------------------------------"
    echo "  Running Test: $test_name"
    echo "----------------------------------------"
    make run TEST=$test_name
done

echo "========================================"
echo "Generating Coverage Report"
echo "========================================"

# Generate Coverage Report
xcrg -cc_dir cov_db -cc_db spi_master_cc -report_format text,html -report_dir $COV_REPORT_DIR

echo "========================================"
echo "Regression Complete!"
echo "Report: $UVM_DIR/$COV_REPORT_DIR/index.html"
echo "========================================"
