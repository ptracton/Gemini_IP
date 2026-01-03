#!/bin/bash
set -e

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT environment variable not set."
    exit 1
fi

echo "Starting Synthesis for sp_memory..."

# TODO: Add specific synthesis commands for Vivado/Quartus/Yosys
# Validating BRAM inference would happen here.

echo "Synthesis script initialized."
