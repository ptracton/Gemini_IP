#!/bin/bash
# run_synth.sh
# Master synthesis script for UART IP variants

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    exit 1
fi

IP_DIR="$GEMINI_IP_ROOT/IP/interface/UART"
SYN_DIR="$IP_DIR/synthesis"
OUT_ROOT="$IP_DIR/sim/synthesis" # Or simulation results? Maybe sim/synthesis

mkdir -p "$OUT_ROOT"

# List of variants to synthesize
VARIANTS=("uart_axi" "uart_apb" "uart_wb" "uart_axi_vhd" "uart_apb_vhd" "uart_wb_vhd")

for variant in "${VARIANTS[@]}"; do
    echo "--------------------------------------------------------"
    echo "Synthesizing Variant: $variant"
    echo "--------------------------------------------------------"
    
    mkdir -p "$OUT_ROOT/$variant"
    
    # Vivado
    echo "Running Vivado Synthesis..."
    vivado -mode batch -source "$SYN_DIR/run_vivado.tcl" -tclargs "$variant" "$OUT_ROOT/$variant" -nolog -nojournal
    
    # Quartus
    echo "Running Quartus Synthesis..."
    quartus_sh -t "$SYN_DIR/run_quartus.tcl" "$variant" "$OUT_ROOT/$variant"
    
    # Yosys
    echo "Running Yosys Synthesis..."
    export TOP_MODULE=$variant
    export OUTPUT_DIR="$OUT_ROOT/$variant"
    yosys -m ghdl -c "$SYN_DIR/run_yosys.tcl"
done

echo "Synthesis Validation Complete."
