#!/bin/bash
# Description: Cleans up GHDL simulation artifacts

echo "Cleaning GHDL artifacts..."

# Remove workspace directory
rm -rf work

# Remove waveforms (VCD)
rm -f *.vcd

echo "Done."
