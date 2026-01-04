#!/bin/bash
# clean_project.sh
# description: Recursively cleans all build artifacts and temporary files from the project.

set -e

PROJECT_ROOT=$(pwd)

echo "Starting project cleanup from: ${PROJECT_ROOT}"

# Function to remove directories
clean_dirs() {
    echo "  Cleaning directories..."
    find . -type d \( \
        -name "xsim.dir" -o \
        -name ".Xil" -o \
        -name "sim_build" -o \
        -name "__pycache__" -o \
        -name "sp_memory_core" -o \
        -name "sp_memory_axi" -o \
        -name "sp_memory_ahb" -o \
        -name "sp_memory_apb" -o \
        -name "sp_memory_wb" -o \
        -name "work" -o \
        -name "work_*" -o \
        -name "coverage_repo" -o \
        -name "cov_merge_final" -o \
        -name "coverage_report_final" \
    \) -exec rm -rf {} +
}

# Function to remove files
clean_files() {
    echo "  Cleaning files..."
    find . -type f \( \
        -name "*.log" -o \
        -name "*.jou" -o \
        -name "*.pb" -o \
        -name "*.wdb" -o \
        -name "*.vcd" -o \
        -name "*.fst" -o \
        -name "*.o" -o \
        -name "*.vvp" -o \
        -name "*.cf" -o \
        -name "*.xml" -o \
        -name "run_xsim.sh" -o \
        -name "webtalk*" -o \
        -name "xelab*" -o \
        -name "xsim*" -o \
        -name "PASS" -o \
        -name "status" -o \
        -name "status.sqlite" -o \
        -name "*.il" -o \
        -name "*.y2" -o \
        -name "*.ys" -o \
        -name "*.smt2" -o \
        -name "logfile.txt" -o \
        -name "design.json" -o \
        -name "logfile_basecase.txt" -o \
        -name "logfile_induction.txt" \
    \) -delete
}

# Execute cleaning
clean_dirs
clean_files

echo "Cleanup complete."
