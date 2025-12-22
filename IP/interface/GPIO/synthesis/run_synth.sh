#!/bin/bash
# Run Vivado Synthesis for all GPIO variants

# Default Part (Artix-7)
PART="xc7a35ticsg324-1L"

# Check if Vivado is in PATH
if ! command -v vivado &> /dev/null; then
    echo "Error: Vivado not found in PATH."
    echo "Please source your Vivado settings script (e.g., settings64.sh)"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

MODULES=("gpio_apb" "gpio_axi" "gpio_wb")

for MODULE in "${MODULES[@]}"; do
    echo "----------------------------------------------------------------"
    echo "Synthesizing $MODULE for part $PART..."
    echo "----------------------------------------------------------------"
    
    # Create log directory if needed
    mkdir -p "results/$MODULE"
    
    vivado -mode batch -source run_vivado.tcl -tclargs "$MODULE" "$PART" > "results/$MODULE/vivado.log" 2>&1
    
    if [ $? -eq 0 ]; then
        echo "PASS: $MODULE Vivado synthesis successful."
        echo "      Report: results/$MODULE/${MODULE}_utilization.rpt"
    else
        echo "FAIL: $MODULE Vivado synthesis failed."
        echo "      Check log: results/$MODULE/vivado.log"
    fi

    # Yosys Synthesis
    echo "Synthesizing $MODULE with Yosys..."
    if command -v yosys &> /dev/null; then
        yosys -c run_yosys.tcl -- "$MODULE" > "results/$MODULE/yosys.log" 2>&1
        if [ $? -eq 0 ]; then
            echo "PASS: $MODULE Yosys synthesis successful."
            echo "      Log: results/$MODULE/yosys.log"
        else
            echo "FAIL: $MODULE Yosys synthesis failed."
            echo "      Check log: results/$MODULE/yosys.log"
        fi
    else
        echo "SKIP: Yosys not found in PATH."
    fi
done

echo "----------------------------------------------------------------"
echo "All runs completed."
