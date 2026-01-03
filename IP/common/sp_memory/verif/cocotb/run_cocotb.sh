#!/bin/bash
set -e

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT environment variable not set."
    exit 1
fi

cd "$GEMINI_IP_ROOT/IP/common/sp_memory/verif/cocotb"

# clean artifacts function
clean() {
    rm -rf sim_build __pycache__ results.xml
}

echo "Starting Cocotb Regression for sp_memory"

# 1. SystemVerilog - 32-bit
echo "========================================"
echo "TEST 1: SystemVerilog (WIDTH=32)"
echo "========================================"
clean
make TOPLEVEL_LANG=verilog WIDTH=32

# 2. SystemVerilog - 128-bit
echo "========================================"
echo "TEST 2: SystemVerilog (WIDTH=128)"
echo "========================================"
clean
make TOPLEVEL_LANG=verilog WIDTH=128

# 3. VHDL - 32-bit
echo "========================================"
echo "TEST 3: VHDL (WIDTH=32)"
echo "========================================"
clean
make TOPLEVEL_LANG=vhdl WIDTH=32

# 4. VHDL - 128-bit
echo "========================================"
echo "TEST 4: VHDL (WIDTH=128)"
echo "========================================"
clean
make TOPLEVEL_LANG=vhdl WIDTH=128

echo "========================================"
echo "All Core Tests Passed!"
echo "========================================"
