#!/bin/bash

# generic-setup.sh
# 
# This script sets up the environment variables for the Gemini_IP project.
# It should be sourced, not executed.

# Get the directory where this script is located
# This allows the script to be sourced from any directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

export GEMINI_IP_ROOT="$SCRIPT_DIR"

# Tool Setup

# Vivado
# Source this first so it doesn't override our manual prepends if it tries to
if [ -f /opt/Xilinx/Vivado/2023.2/settings64.sh ]; then
    source /opt/Xilinx/Vivado/2023.2/settings64.sh
fi

# Modelsim
export PATH=$PATH:/opt/intelFPGA_pro/21.1/modelsim_ase/bin

# OSS Cad Suite (Front of PATH)
# Done last to ensure it stays at the front
export PATH=/opt/oss-cad-suite/bin:$PATH

# Intel Quartus Prime Lite
export PATH=$PATH:/opt/intelFPGA_lite/23.1std/quartus/bin

# Python Virtual Environment
if [ -f "$GEMINI_IP_ROOT/virtualenv/GEMINI_IP_PYTHON/bin/activate" ]; then
    source "$GEMINI_IP_ROOT/virtualenv/GEMINI_IP_PYTHON/bin/activate"
fi

echo "GEMINI_IP_ROOT set to $GEMINI_IP_ROOT"
