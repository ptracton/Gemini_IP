#!/bin/bash
# run_formal.sh

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT not set"
    exit 1
fi

# Ensure SymbiYosys is in PATH
export PATH=$PATH:/opt/oss-cad-suite/bin

FORMAL_DIR="$GEMINI_IP_ROOT/IP/interface/UART/verif/formal"

if [ ! -d "$FORMAL_DIR" ]; then
    echo "Error: Formal directory not found: $FORMAL_DIR"
    exit 1
fi

cd "$FORMAL_DIR"
echo "Running Formal Verification: uart_core.sby"
sby -f uart_core.sby
echo "Running Formal Verification: uart_axi.sby"
sby -f uart_axi.sby
echo "Running Formal Verification: uart_apb.sby"
sby -f uart_apb.sby
echo "Running Formal Verification: uart_wb.sby"
sby -f uart_wb.sby
