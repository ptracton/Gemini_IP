#!/bin/bash
# SPI Master Regression Runner
# Runs all simulations (SV & VHDL) across available tools.

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set. Please source setup.sh before running this script."
    exit 1
fi

SIM_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SIM_DIR"

FAILED=0

echo "========================================"

# 0. Linting
echo "Step 0: Linting (Verilator & GHDL)"
cd "$SIM_DIR/../tools"
if [ -f "run_lint.sh" ]; then
    chmod +x run_lint.sh
    ./run_lint.sh > lint.out 2>&1
    if [ $? -eq 0 ]; then
        echo "[PASS] Linting"
    else
        echo "[FAIL] Linting. Check log: $SIM_DIR/../tools/lint.out"
        FAILED=1
    fi
else
    echo "[SKIPPED] Lint scripts not found."
fi

# 1. Icarus Verilog
echo "Step 1: Icarus Verilog (SV)"
cd "$SIM_DIR/iverilog"
chmod +x run_iverilog.sh
./run_iverilog.sh > iverilog.out 2>&1
if [ $? -eq 0 ]; then
    echo "[PASS] Icarus Verilog Simulations"
else
    echo "[FAIL] Icarus Verilog Simulations. Check log: $SIM_DIR/iverilog/iverilog.out"
    FAILED=1
fi

# 2. GHDL
echo "Step 2: GHDL (VHDL)"
cd "$SIM_DIR/ghdl"
chmod +x run_ghdl.sh
if command -v ghdl &> /dev/null; then
    ./run_ghdl.sh > ghdl.out 2>&1
    if [ $? -eq 0 ]; then
        echo "[PASS] GHDL Simulations"
    else
        echo "[FAIL] GHDL Simulations. Check log: $SIM_DIR/ghdl/ghdl.out"
        FAILED=1
    fi
else
    echo "[SKIPPED] GHDL not found."
fi

# 3. Xilinx Vivado (xsim)
echo "Step 3: Xilinx Vivado (xsim)"
cd "$SIM_DIR/xilinx"
chmod +x run_xsim.sh run_xsim_vhdl.sh
if command -v xsim &> /dev/null; then
    echo "  - Running SystemVerilog..."
    ./run_xsim.sh > xsim_sv.out 2>&1
    if [ $? -eq 0 ]; then
        echo "[PASS] Xilinx SV Simulations"
    else
        echo "[FAIL] Xilinx SV Simulations. Check log: $SIM_DIR/xilinx/xsim_sv.out"
        FAILED=1
    fi
    
    echo "  - Running VHDL..."
    ./run_xsim_vhdl.sh > xsim_vhdl.out 2>&1
    if [ $? -eq 0 ]; then
        echo "[PASS] Xilinx VHDL Simulations"
    else
        echo "[FAIL] Xilinx VHDL Simulations. Check log: $SIM_DIR/xilinx/xsim_vhdl.out"
        FAILED=1
    fi
else
    echo "[SKIPPED] Xilinx Vivado (xsim) not found."
fi

# 4. ModelSim (vsim)
echo "Step 4: ModelSim (vsim)"
cd "$SIM_DIR/modelsim"
chmod +x run_modelsim.sh run_modelsim_vhdl.sh
if command -v vsim &> /dev/null; then
    echo "  - Running SystemVerilog..."
    ./run_modelsim.sh > modelsim_sv.out 2>&1
    if [ $? -eq 0 ]; then
        echo "[PASS] ModelSim SV Simulations"
    else
        echo "[FAIL] ModelSim SV Simulations. Check log: $SIM_DIR/modelsim/modelsim_sv.out"
        FAILED=1
    fi

    echo "  - Running VHDL..."
    ./run_modelsim_vhdl.sh > modelsim_vhdl.out 2>&1
    if [ $? -eq 0 ]; then
        echo "[PASS] ModelSim VHDL Simulations"
    else
        echo "[FAIL] ModelSim VHDL Simulations. Check log: $SIM_DIR/modelsim/modelsim_vhdl.out"
        FAILED=1
    fi
else
    echo "[SKIPPED] ModelSim (vsim) not found."
fi

# 5. Cocotb Verification
echo "Step 5: Cocotb Verification"
cd "$SIM_DIR/../verif/cocotb"
if [ -f "run_cocotb.sh" ]; then
    chmod +x run_cocotb.sh
    # Source setup inside if needed, but run_cocotb.sh sources it.
    ./run_cocotb.sh > cocotb.out 2>&1
    if [ $? -eq 0 ]; then
        echo "[PASS] Cocotb Verification"
    else
        echo "[FAIL] Cocotb Verification. Check log: $SIM_DIR/../verif/cocotb/cocotb.out"
        FAILED=1
    fi
else
    echo "[SKIPPED] Cocotb script not found."
fi

echo "========================================"
if [ $FAILED -eq 0 ]; then
    echo "FULL REGRESSION PASSED"
else
    echo "REGRESSION FAILED"
fi
echo "========================================"

exit $FAILED
