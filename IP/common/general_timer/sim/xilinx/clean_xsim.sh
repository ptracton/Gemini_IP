#!/bin/bash
# Description: Cleans up Xilinx simulation artifacts

echo "Cleaning Xilinx artifacts..."

# Remove workspace directories
rm -rf work work_vhdl

# Remove Xilinx specific logs and journals
rm -f *.log *.jou *.pb

# Remove waveform databases (if any outside work)
rm -f *.wdb *.vcd

echo "Done."
