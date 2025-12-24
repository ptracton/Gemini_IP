#!/bin/bash
# Description: Master cleanup script for Bus Matrix IP
# This script calls all individual cleanup scripts across the project.

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
TIMER_DIR=$(cd "$SCRIPT_DIR/.." && pwd)

echo "=================================================="
echo "Bus Matrix: Starting Full Project Cleanup"
echo "=================================================="

# 1. Native Simulations
echo "[1/4] Cleaning Native Simulations..."
(cd "$TIMER_DIR/sim/modelsim" && chmod +x clean_modelsim.sh && ./clean_modelsim.sh)
(cd "$TIMER_DIR/sim/xilinx"   && chmod +x clean_xsim.sh     && ./clean_xsim.sh)
(cd "$TIMER_DIR/sim/ghdl"     && chmod +x clean_ghdl.sh     && ./clean_ghdl.sh)
(cd "$TIMER_DIR/sim/iverilog" && chmod +x clean_iverilog.sh && ./clean_iverilog.sh)

# 2. Cocotb
echo "[2/4] Cleaning Cocotb..."
(cd "$TIMER_DIR/verif/cocotb" && chmod +x clean_cocotb.sh && ./clean_cocotb.sh)

# 3. UVM
echo "[3/4] Cleaning UVM..."
(cd "$TIMER_DIR/verif/uvm"    && chmod +x clean_uvm.sh    && ./clean_uvm.sh)

# 4. Formal
echo "[4/4] Cleaning Formal..."
(cd "$TIMER_DIR/verif/formal" && chmod +x clean_formal.sh && ./clean_formal.sh)
# 5. Synthesis
echo "[5/6] Cleaning Synthesis..."
(cd "$TIMER_DIR/synthesis" && chmod +x cleanup.sh && ./cleanup.sh)

# 6. General artifacts
echo "[6/6] Cleaning General artifacts..."
rm -f "$TIMER_DIR"/*.log
rm -f "$TIMER_DIR"/*.vcd
# rm -f "$TIMER_DIR"/bus_matrix_regression_results.md
rm -f "$SCRIPT_DIR"/*.log

echo "=================================================="
echo "Full Project Cleanup Complete."
echo "=================================================="
