#!/bin/bash
# Clean up verification artifacts

# Determine script location regarding execution
# Assuming run from project root based on previous context, but making it robust
VERIF_ROOT="IP/interface/GPIO/verif"

if [ ! -d "$VERIF_ROOT" ]; then
    echo "Error: Directory $VERIF_ROOT not found. Please run from project root."
    exit 1
fi

echo "Cleaning up verification artifacts in $VERIF_ROOT..."

# Cocotb
rm -rf $VERIF_ROOT/cocotb/sim_build_*
rm -f  $VERIF_ROOT/cocotb/results.xml
rm -rf $VERIF_ROOT/cocotb/__pycache__
rm -f  $VERIF_ROOT/cocotb/*.o

# Formal
rm -rf $VERIF_ROOT/formal/axi
rm -rf $VERIF_ROOT/formal/apb
rm -rf $VERIF_ROOT/formal/wb

# UVM
rm -rf $VERIF_ROOT/uvm/work
rm -f  $VERIF_ROOT/uvm/xcrg.log
rm -f  $VERIF_ROOT/uvm/*.jou
rm -f  $VERIF_ROOT/uvm/*.pb
rm -f  $VERIF_ROOT/uvm/*.log
rm -rf $VERIF_ROOT/uvm/xsim.dir
rm -rf $VERIF_ROOT/uvm/xsim.covdb

echo "Cleanup complete."
