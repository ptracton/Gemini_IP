#!/bin/bash
# Description: Cleans up Cocotb simulation artifacts for Bus Matrix IP

echo "Cleaning Cocotb artifacts..."

# Remove sim_build directories
rm -rf sim_build_*

# Remove results files
rm -f results.xml

# Remove Python cache
rm -rf __pycache__

# Remove GHDL simulation binaries and objects
rm -f bus_matrix_axi bus_matrix_apb bus_matrix_wb
rm -f *.o
rm -f *.vcd

echo "Done."
