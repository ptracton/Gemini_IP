#!/bin/bash
# Description: Cleans up Icarus Verilog simulation artifacts

echo "Cleaning Icarus Verilog artifacts..."

# Remove workspace directory
rm -rf work

# Remove waveforms (VCD)
rm -f *.vcd

# Remove compiled executables (if any generated in root)
rm -f *.vvp

echo "Done."
