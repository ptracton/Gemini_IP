#!/bin/bash
# Run Vivado Synthesis for all Bus Matrix variants

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

LANGS=("verilog")
TARGET_MODULES=("bus_matrix_ahb" "bus_matrix_axi" "bus_matrix_wb" "ahb_apb_bridge")

for LANG in "${LANGS[@]}"; do
    for MODULE in "${TARGET_MODULES[@]}"; do
        RESULT_DIR="results/${MODULE}_${LANG}"
        echo "----------------------------------------------------------------"
        echo "Synthesizing $MODULE ($LANG) for part $PART..."
        echo "----------------------------------------------------------------"
        
        # Create log directory if needed
        mkdir -p "$RESULT_DIR"
        
        # Vivado Synthesis
        echo "Running Vivado..."
        vivado -mode batch -source run_vivado.tcl -tclargs "$MODULE" "$PART" "$RESULT_DIR" > "$RESULT_DIR/vivado.log" 2>&1
        
        if [ $? -eq 0 ]; then
            echo "PASS: $MODULE ($LANG) Vivado synthesis successful."
            echo "      Report: $RESULT_DIR/${MODULE}_utilization.rpt"
        else
            echo "FAIL: $MODULE ($LANG) Vivado synthesis failed."
            echo "      Check log: $RESULT_DIR/vivado.log"
        fi

        # Quartus Synthesis
        echo "Running Quartus..."
        if command -v quartus_sh &> /dev/null; then
            quartus_sh -t run_quartus.tcl "$MODULE" "$RESULT_DIR" > "$RESULT_DIR/quartus.log" 2>&1
            if [ $? -eq 0 ]; then
                echo "PASS: $MODULE ($LANG) Quartus synthesis successful."
                echo "      Log: $RESULT_DIR/quartus.log"
            else
                echo "FAIL: $MODULE ($LANG) Quartus synthesis failed."
                echo "      Check log: $RESULT_DIR/quartus.log"
            fi
        else
            echo "SKIP: Quartus not found in PATH."
        fi

        # Yosys Synthesis (Verilog/SV only for now)
        if [ "$LANG" == "verilog" ]; then
            echo "Running Yosys..."
            if command -v yosys &> /dev/null; then
                yosys -c run_yosys.tcl -- "$MODULE" "$RESULT_DIR" > "$RESULT_DIR/yosys.log" 2>&1
                if [ $? -eq 0 ]; then
                    echo "PASS: $MODULE ($LANG) Yosys synthesis successful."
                    echo "      Log: $RESULT_DIR/yosys.log"
                else
                    echo "FAIL: $MODULE ($LANG) Yosys synthesis failed."
                    echo "      Check log: $RESULT_DIR/yosys.log"
                fi
            else
                echo "SKIP: Yosys not found in PATH."
            fi
        fi
    done
done

echo "----------------------------------------------------------------"
echo "All runs completed."
