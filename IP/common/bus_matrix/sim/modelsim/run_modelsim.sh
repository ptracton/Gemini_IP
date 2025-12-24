#!/bin/bash
# ------------------------------------------------------------------------------
# File: run_modelsim.sh
# Description: Shell script to launch ModelSim simulation
# ------------------------------------------------------------------------------

# Source Setup to get Modelsim in PATH
IP_DIR="../../../.."
source $IP_DIR/../setup.sh

# Create work dir if needed (handled by vsim mostly but good practice)
mkdir -p work_sim
cd work_sim

# Run ModelSim in batch mode
# Using -do with the absolute path to the .do file we just created
# We assume the script is executed from sim/modelsim/
vsim -c -do ../run_modelsim.do > simulation.log 2>&1

# Check results
echo "=================================================="
echo "ModelSim Simulation Results"
echo "=================================================="

if grep -q "All tests completed" simulation.log; then
    if grep -q "Error" simulation.log || grep -q "FAIL" simulation.log; then
        echo "TEST FAILED"
        echo "--------------------------------------------------"
        grep "Error" simulation.log
        grep "FAIL" simulation.log
        echo "--------------------------------------------------"
        exit 1
    else
        echo "TEST PASSED"
        exit 0
    fi
else
    echo "SIMULATION FAILED TO COMPLETE"
    # Print tail of log
    tail -n 20 simulation.log
    exit 1
fi
