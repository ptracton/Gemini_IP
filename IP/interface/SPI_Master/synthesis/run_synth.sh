#!/bin/bash
# Multi-tool Synthesis Runner for SPI Master
# Supports Xilinx Vivado, Intel Quartus, and Yosys

# Default Parts
VIVADO_PART="xc7a35tcpg236-1"
QUARTUS_DEVICE="5CGXFC7C7F23C8"

# Ensure environment is set up
if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    echo "Please source the project setup script:"
    echo "  source <path_to_gemini_ip>/setup.sh"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

MODULES=("spi_master_apb" "spi_master_axi" "spi_master_wb")

for MODULE in "${MODULES[@]}"; do
    echo "================================================================"
    echo "Processing Module: $MODULE"
    echo "================================================================"
    
    mkdir -p "results/$MODULE"
    
    # 1. Xilinx Vivado
    if command -v vivado &> /dev/null; then
        echo "[VIVADO] Starting synthesis for $MODULE..."
        vivado -mode batch -source run_vivado.tcl -tclargs "$MODULE" "results/$MODULE" > "results/$MODULE/vivado.log" 2>&1
        if [ $? -eq 0 ]; then
            echo "[VIVADO] PASS: Synthesis successful."
        else
            echo "[VIVADO] FAIL: Synthesis failed. Check results/$MODULE/vivado.log"
        fi
    else
        echo "[VIVADO] SKIP: Vivado not found in PATH."
    fi

    # 2. Intel Quartus
    if command -v quartus_sh &> /dev/null; then
        echo "[QUARTUS] Starting synthesis for $MODULE..."
        quartus_sh -t run_quartus.tcl "$MODULE" "results/$MODULE" > "results/$MODULE/quartus.log" 2>&1
        if [ $? -eq 0 ]; then
            echo "[QUARTUS] PASS: Synthesis successful."
        else
            echo "[QUARTUS] FAIL: Synthesis failed. Check results/$MODULE/quartus.log"
        fi
    else
        echo "[QUARTUS] SKIP: Quartus not found in PATH."
    fi

    # 3. Yosys
    if command -v yosys &> /dev/null; then
        echo "[YOSYS] Starting synthesis for $MODULE..."
        export TOP_MODULE="$MODULE"
        export OUTPUT_DIR="results/$MODULE"
        yosys -c run_yosys.tcl > "results/$MODULE/yosys.log" 2>&1
        if [ $? -eq 0 ]; then
            echo "[YOSYS] PASS: Synthesis successful."
        else
            echo "[YOSYS] FAIL: Synthesis failed. Check results/$MODULE/yosys.log"
        fi
    else
        echo "[YOSYS] SKIP: Yosys not found in PATH."
    fi
done

echo "================================================================"
echo "All synthesis runs completed."
echo "================================================================"
