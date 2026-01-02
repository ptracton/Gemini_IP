#!/bin/bash
# Cleanup script for SPI Master IP
# Cleans simulation artifacts from all tools

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IP_DIR="$(dirname "$SCRIPT_DIR")"

echo "Cleaning SPI Master IP artifacts..."

# Clean tools directory
echo "  Cleaning tools directory..."
cd "$IP_DIR/tools"
rm -rf *.o *.cf *.log

# Clean Icarus Verilog artifacts
echo "  Cleaning Icarus Verilog artifacts..."
cd "$IP_DIR/sim/iverilog"
rm -rf *.vvp *.log *.vcd

# Clean GHDL artifacts
echo "  Cleaning GHDL artifacts..."
cd "$IP_DIR/sim/ghdl"
rm -rf *.o *.cf *.log work-obj*.cf e~*.o

# Clean ModelSim artifacts
echo "  Cleaning ModelSim artifacts..."
cd "$IP_DIR/sim/modelsim"
rm -rf work transcript *.log *.wlf vsim.wlf

# Clean Xilinx artifacts
echo "  Cleaning Xilinx artifacts..."
cd "$IP_DIR/sim/xilinx"
rm -rf xsim.dir *.log *.jou *.pb *.wdb .Xil
rm -rf xvlog.* xvhdl.* xelab.* xsim.*

# Clean Formal verification artifacts
echo "  Cleaning Formal verification artifacts..."
cd "$IP_DIR/verif/formal"
rm -rf spi_master_core spi_master_apb spi_master_axi spi_master_wb
rm -rf *.log

# Clean Cocotb artifacts
if [ -d "$IP_DIR/verif/cocotb" ]; then
    echo "  Cleaning Cocotb artifacts..."
    cd "$IP_DIR/verif/cocotb"
    rm -rf sim_build __pycache__ results.xml *.vcd *.log
fi

echo "Cleanup complete."
