#!/bin/bash
# Clean up synthesis artifacts

# Ensure environment is set up
if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    echo "Please source the project setup script:"
    echo "  source <path_to_gemini_ip>/setup.sh"
    exit 1
fi

SYNTH_DIR="$GEMINI_IP_ROOT/IP/interface/GPIO/synthesis"

if [ ! -d "$SYNTH_DIR" ]; then
    echo "Error: Directory $SYNTH_DIR not found. Please run from project root."
    exit 1
fi

echo "Cleaning up synthesis artifacts in $SYNTH_DIR..."

rm -rf $SYNTH_DIR/results/*
rm -f $SYNTH_DIR/*.log
rm -f $SYNTH_DIR/*.jou
rm -f $SYNTH_DIR/*.pb
rm -rf $SYNTH_DIR/.Xil
rm -rf $SYNTH_DIR/db
rm -rf $SYNTH_DIR/incremental_db
rm -f $SYNTH_DIR/*.qpf
rm -f $SYNTH_DIR/*.qsf
rm -f $SYNTH_DIR/*.qws

echo "Cleanup complete."
