#!/bin/bash

# Define the root of the simulation directory
SIM_ROOT="$(dirname "$0")"

echo "Cleaning up simulation artifacts in $SIM_ROOT..."

# Directories to remove
find "$SIM_ROOT" -type d -name "work" -exec rm -rf {} +
find "$SIM_ROOT" -type d -name "xsim.dir" -exec rm -rf {} +
find "$SIM_ROOT" -type d -name "work_axi" -exec rm -rf {} +
find "$SIM_ROOT" -type d -name "work_apb" -exec rm -rf {} +
find "$SIM_ROOT" -type d -name "work_wb" -exec rm -rf {} +

# Files to remove
find "$SIM_ROOT" -type f -name "*.log" -delete
find "$SIM_ROOT" -type f -name "*.jou" -delete
find "$SIM_ROOT" -type f -name "*.pb" -delete
find "$SIM_ROOT" -type f -name "*.wdb" -delete
find "$SIM_ROOT" -type f -name "*.vcd" -delete
find "$SIM_ROOT" -type f -name "*.cf" -delete # GHDL
find "$SIM_ROOT" -type f -name "compile.log" -delete
find "$SIM_ROOT" -type f -name "elaborate.log" -delete
find "$SIM_ROOT" -type f -name "simulate.log" -delete
find "$SIM_ROOT" -type f -name "vsim.wlf" -delete
find "$SIM_ROOT" -type f -name "transcript" -delete
find "$SIM_ROOT" -type f -name "modelsim.ini" -delete

echo "Cleanup complete."
