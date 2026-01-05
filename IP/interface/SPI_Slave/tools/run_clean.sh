#!/bin/bash
# Clean up script for SPI Slave IP

# Get script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
IP_ROOT="$SCRIPT_DIR/.."

echo "Cleaning up SPI Slave artifacts in $IP_ROOT..."

# Generic artifacts
find $IP_ROOT -type d -name "work" -exec rm -rf {} +
find $IP_ROOT -type d -name "xsim.dir" -exec rm -rf {} +
find $IP_ROOT -type f -name "*.log" -exec rm -f {} +
find $IP_ROOT -type f -name "*.vcd" -exec rm -f {} +
find $IP_ROOT -type f -name "*.wdb" -exec rm -f {} +
find $IP_ROOT -type f -name "*.pb" -exec rm -f {} +
find $IP_ROOT -type f -name "*.jou" -exec rm -f {} +
find $IP_ROOT -type f -name "*.str" -exec rm -f {} +
find $IP_ROOT -type f -name "vsim.wlf" -exec rm -f {} +
find $IP_ROOT -type f -name "transcript" -exec rm -f {} +

# Icarus Output Directory
if [ -d "$IP_ROOT/sim/iverilog/out" ]; then
    echo "Removing $IP_ROOT/sim/iverilog/out..."
    rm -rf "$IP_ROOT/sim/iverilog/out"
fi

echo "Cleanup complete."
