# Description: Script to run ModelSim simulations for General Timer (Verilog)
#-------------------------------------------------------------------------------

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    echo "Please source the project setup script:"
    echo "  source <path_to_gemini_ip>/setup.sh"
    exit 1
fi

# Create and enter work directory
mkdir -p work
cd work

# Clean previous runs (optional)
rm -rf work transcript *.log

echo "=================================================="
echo "Compiling Design and Testbenches"
echo "=================================================="
# Compile everything
vsim -c -do ../run_modelsim.do > compile.log 2>&1

if grep -q "Error:" compile.log; then
    echo "COMPILATION FAILED"
    cat compile.log
    exit 1
fi

TESTS=("core" "apb" "axi" "wb")
ALL_PASSED=true

for test in "${TESTS[@]}"; do
    echo "=================================================="
    echo "Running ModelSim Simulation for: $test"
    echo "=================================================="
    
    # Run simulation
    # -c : batch mode
    # -voptargs="+acc" : preserve visibility for debugging
    # -do "run -all" : run simulation to finish
    vsim -c -voptargs="+acc" -do "run -all" work.tb_timer_$test > run_$test.log 2>&1
    
    # Check result
    if grep -q "ALL.*PASSED" run_$test.log || grep -q "TESTS PASSED" run_$test.log; then
        echo "PASS: $test"
    else
        echo "FAIL: $test"
        cat run_$test.log
        ALL_PASSED=false
    fi
done

echo "=================================================="
if [ "$ALL_PASSED" = true ]; then
    echo "ALL MODELSIM SIMULATIONS COMPLETED SUCCESSFULLY"
else
    echo "SOME SIMULATIONS FAILED"
    exit 1
fi
echo "=================================================="
