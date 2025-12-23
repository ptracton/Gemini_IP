#!/bin/bash
# Description: Cleans up ModelSim simulation artifacts

echo "Cleaning ModelSim artifacts..."

# Remove directories
rm -rf work work_vhdl

# Remove logs and transcripts
rm -f transcript *.log

# Remove waveforms
rm -f *.vcd *.wlf

echo "Done."
