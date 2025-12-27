#!/bin/bash
# ------------------------------------------------------------------------------
# File: run_modelsim_vhdl.sh
# Description: Shell script to launch ModelSim VHDL simulation
# ------------------------------------------------------------------------------

# Source Setup to get Modelsim in PATH
IP_DIR="../../../.."
source $IP_DIR/../setup.sh

# Create work dir if needed
mkdir -p work_vhdl
cd work_vhdl

# Run ModelSim in batch mode
# Using -do with the absolute path to the .do file
vsim -64 -c -do ../run_modelsim_vhdl.do > simulation.log 2>&1

# Check results
echo "=================================================="
echo "ModelSim VHDL Simulation Results"
echo "=================================================="

# Check for both "All tests completed" and verify no errors
# Unlike SV where we check log logic in script, here we rely on the DO file running to completion
# and the report output effectively being in simulation.log

if grep -q "All tests completed" simulation.log; then
    if grep -q "Error:" simulation.log || grep -q "FAIL" simulation.log; then
        # Note: GHDL prints "report note", ModelSim might print "Note: ..."
        # But "FAIL" string is explicit in our TB report messages
        echo "TEST FAILED"
        echo "--------------------------------------------------"
        grep "Error:" simulation.log
        grep "FAIL" simulation.log
        echo "--------------------------------------------------"
        exit 1
    else
        echo "TEST PASSED"
        exit 0
    fi
else
    echo "SIMULATION FAILED TO COMPLETE"
    tail -n 20 simulation.log
    exit 1
fi
