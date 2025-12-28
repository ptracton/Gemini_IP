#!/bin/bash
# run_gui.sh
# Launch ModelSim in GUI mode with wave scripts

if [ "$#" -ne 1 ]; then
    echo "Usage: ./run_gui.sh <axi|apb|wb>"
    exit 1
fi

BUS=$1
BUS_UPPER=$(echo $BUS | tr '[:lower:]' '[:upper:]')

# Source environment
if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    echo "Please source the project setup script:"
    echo "  source <path_to_gemini_ip>/setup.sh"
    exit 1
fi

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$SCRIPT_DIR"

echo "=================================================="
echo "Launching ModelSim GUI for BUS: $BUS_UPPER"
echo "=================================================="

# Create work library if not exists
if [ ! -d "work_$BUS" ]; then
    vlib work_$BUS
fi

# Compile RTL
vlog -work work_$BUS -sv -timescale "1ns/1ps" \
    ../../rtl/verilog/gpio_bit.sv \
    ../../rtl/verilog/gpio_wrapper.sv \
    ../../rtl/verilog/gpio_regs.sv \
    ../../rtl/verilog/gpio_$BUS.sv

# Compile Testbench
vlog -work work_$BUS -sv -timescale "1ns/1ps" ../../tb/tb_gpio_$BUS.sv

# Simulate in GUI mode
vsim -work work_$BUS -i -do "do waves_$BUS.do; run -all" tb_gpio_$BUS
