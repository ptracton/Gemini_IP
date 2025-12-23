#!/bin/bash
#-------------------------------------------------------------------------------
# File: run_modelsim_vhdl.sh
# Description: Script to run ModelSim simulations for General Timer (VHDL)
#-------------------------------------------------------------------------------

# Create and enter work directory for VHDL
mkdir -p work_vhdl
cd work_vhdl

# Clean previous runs (optional)
rm -rf work transcript *.log

echo "=================================================="
echo "Compiling VHDL Design and Testbenches"
echo "=================================================="
# Compile everything
vsim -c -do ../run_modelsim_vhdl.do > compile.log 2>&1

if grep -q "Error:" compile.log; then
    echo "COMPILATION FAILED"
    cat compile.log
    exit 1
fi

TESTS=("core" "apb" "axi" "wb")
ALL_PASSED=true

for test in "${TESTS[@]}"; do
    echo "=================================================="
    echo "Running ModelSim Simulation for: $test (VHDL)"
    echo "=================================================="
    
    # Run simulation
    # -c : batch mode
    # -voptargs="+acc" : preserve visibility
    # -do "run -all" : run simulation to finish
    # VHDL testbench entity names match the file names usually (tb_timer_core, etc)
    vsim -c -voptargs="+acc" -do "run -all; quit" work.tb_timer_$test > run_$test.log 2>&1
    
    # Check result
    if grep -q "ALL.*PASSED" run_$test.log || grep -q "TESTS PASSED" run_$test.log || grep -q "Test Completed" run_$test.log; then
        echo "PASS: $test"
    else
        echo "FAIL: $test"
        cat run_$test.log
        ALL_PASSED=false
    fi
done

echo "=================================================="
if [ "$ALL_PASSED" = true ]; then
    echo "ALL MODELSIM VHDL SIMULATIONS COMPLETED SUCCESSFULLY"
else
    echo "SOME VHDL SIMULATIONS FAILED"
    exit 1
fi
echo "=================================================="
