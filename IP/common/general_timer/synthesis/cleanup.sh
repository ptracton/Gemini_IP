#!/bin/bash
# Cleanup Synthesis Artifacts

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Cleaning Synthesis artifacts..."

# Remove results directory
if [ -d "results" ]; then
    rm -rf results
    echo "  Removed results directory"
fi

# Remove any root-level logs if they exist
rm -f *.log *.jou *.str *.pb

# Remove Quartus artifacts
rm -rf db incremental_db
rm -f *.qpf *.qsf

# Remove Xilinx artifacts
rm -rf .Xil

echo "Synthesis cleanup complete."
