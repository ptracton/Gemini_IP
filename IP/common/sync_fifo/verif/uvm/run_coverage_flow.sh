#!/bin/bash
# Description: Run Coverage flow for Sync FIFO

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    echo "Please source the project setup script:"
    echo "  source <path_to_gemini_ip>/setup.sh"
    exit 1
fi

set -e

IP_DIR="$GEMINI_IP_ROOT/IP/common/sync_fifo/verif/uvm"

# Clean previous coverage
rm -rf $IP_DIR/coverage_repo
rm -rf $IP_DIR/xsim.codeCov

# Run all tests
$IP_DIR/run_uvm.sh core
$IP_DIR/run_uvm.sh axi
$IP_DIR/run_uvm.sh apb
$IP_DIR/run_uvm.sh wb

# Merge results
$IP_DIR/merge_coverage.sh
