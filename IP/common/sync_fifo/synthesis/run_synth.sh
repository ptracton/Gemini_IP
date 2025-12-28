#!/bin/bash
# synthesis/run_synth.sh
# Run All Synthesis Flows for all FIFO versions

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT not set."
    exit 1
fi

IP_DIR="$GEMINI_IP_ROOT/IP/common/sync_fifo"
# Base results directory
BASE_RESULTS_DIR="$IP_DIR/synthesis/results"
rm -rf "$BASE_RESULTS_DIR"
mkdir -p "$BASE_RESULTS_DIR"

MODULES=("sync_fifo" "sync_fifo_apb" "sync_fifo_axi" "sync_fifo_ahb" "sync_fifo_wb")
LANGS=("sv" "vhdl")

echo "=================================================="
echo "Starting Synthesis for Sync FIFO"
echo "=================================================="

for module in "${MODULES[@]}"; do
    echo "----------------------------------------------------"
    echo "Processing Module: $module"
    echo "----------------------------------------------------"

    # Define module-specific output dir
    MODULE_RESULTS_DIR="$BASE_RESULTS_DIR/$module"
    mkdir -p "$MODULE_RESULTS_DIR"

    for lang in "${LANGS[@]}"; do
        # Vivado
        if command -v vivado >/dev/null 2>&1; then
            echo "[Vivado-$lang] Synthesizing $module..."
            mkdir -p "$MODULE_RESULTS_DIR/vivado/$lang"
            vivado -mode batch -source "$IP_DIR/synthesis/run_vivado.tcl" -tclargs $module $lang xc7a35tcpg236-1 "$MODULE_RESULTS_DIR/vivado/$lang" > "$MODULE_RESULTS_DIR/vivado_${lang}.log" 2>&1
            if [ $? -eq 0 ]; then echo "  [Vivado-$lang] PASS"; else echo "  [Vivado-$lang] FAIL"; fi
        fi

        # Quartus
        if command -v quartus_sh >/dev/null 2>&1; then
            echo "[Quartus-$lang] Synthesizing $module..."
            # Quartus likes running in a project directory
            mkdir -p "$MODULE_RESULTS_DIR/quartus/$lang"
            cd "$MODULE_RESULTS_DIR/quartus/$lang"
            quartus_sh -t "$IP_DIR/synthesis/run_quartus.tcl" $module $lang "$MODULE_RESULTS_DIR/quartus/$lang" > "$MODULE_RESULTS_DIR/quartus_${lang}.log" 2>&1
            if [ $? -eq 0 ]; then echo "  [Quartus-$lang] PASS"; else echo "  [Quartus-$lang] FAIL"; fi
            cd "$IP_DIR"
        fi
    done

    # Yosys (SystemVerilog only)
    if command -v yosys >/dev/null 2>&1; then
        echo "[Yosys-SV] Synthesizing $module..."
        export TOP_MODULE=$module
        export OUTPUT_DIR="$MODULE_RESULTS_DIR/yosys"
        mkdir -p "$OUTPUT_DIR"
        yosys -c "$IP_DIR/synthesis/run_yosys.tcl" > "$OUTPUT_DIR/yosys_${module}.log" 2>&1
        if [ $? -eq 0 ]; then echo "  [Yosys-SV] PASS"; else echo "  [Yosys-SV] FAIL"; fi
    fi
done

echo "=================================================="
echo "Synthesis Complete"
echo "=================================================="
