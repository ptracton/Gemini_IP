#!/bin/bash
# SPI Master Formal Verification Runner Script

if [ -z "$GEMINI_IP_ROOT" ]; then
    SETUP_FILE="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../../" && pwd)/setup.sh"
    if [ -f "$SETUP_FILE" ]; then
        source "$SETUP_FILE"
    else
        echo "Error: GEMINI_IP_ROOT is not set and setup.sh not found"
        exit 1
    fi
fi

FORMAL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$FORMAL_DIR"

# Check if SymbiYosys is installed
if ! command -v sby &> /dev/null; then
    echo "ERROR: SymbiYosys (sby) is not installed."
    echo ""
    echo "To install SymbiYosys, you can:"
    echo "  1. Install oss-cad-suite: https://github.com/YosysHQ/oss-cad-suite-build"
    echo "  2. Or install individually: pip install sby"
    echo ""
    exit 1
fi

echo "========================================"
echo "SPI Master Formal Verification"
echo "========================================"

FAILED=0

# Run Core Verification
echo "Step 1: Verifying SPI Master Core..."
sby -f spi_master_core.sby > formal_core.log 2>&1
if grep -q "PASS" spi_master_core/status; then
    echo "[PASS] SPI Master Core verification"
else
    echo "[FAIL] SPI Master Core verification"
    FAILED=1
fi

# Run APB Wrapper Verification
echo "Step 2: Verifying APB Wrapper..."
sby -f spi_master_apb.sby > formal_apb.log 2>&1
if grep -q "PASS" spi_master_apb/status; then
    echo "[PASS] APB Wrapper verification"
else
    echo "[FAIL] APB Wrapper verification"
    FAILED=1
fi

# Run AXI Wrapper Verification
echo "Step 3: Verifying AXI Wrapper..."
sby -f spi_master_axi.sby > formal_axi.log 2>&1
if grep -q "PASS" spi_master_axi/status; then
    echo "[PASS] AXI Wrapper verification"
else
    echo "[FAIL] AXI Wrapper verification"
    FAILED=1
fi

# Run Wishbone Wrapper Verification
echo "Step 4: Verifying Wishbone Wrapper..."
sby -f spi_master_wb.sby > formal_wb.log 2>&1
if grep -q "PASS" spi_master_wb/status; then
    echo "[PASS] Wishbone Wrapper verification"
else
    echo "[FAIL] Wishbone Wrapper verification"
    FAILED=1
fi

echo "========================================"
if [ $FAILED -eq 0 ]; then
    echo "FORMAL VERIFICATION PASSED"
else
    echo "FORMAL VERIFICATION FAILED"
    echo "Check logs in $FORMAL_DIR for details"
fi
echo "========================================"

exit $FAILED
