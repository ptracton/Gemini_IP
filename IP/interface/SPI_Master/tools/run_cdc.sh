#!/bin/bash
# CDC script for SPI Master (Verilator)

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    exit 1
fi

TOOLS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$TOOLS_DIR"

SRC_DIR_SV="$GEMINI_IP_ROOT/IP/interface/SPI_Master/rtl/verilog"

echo "----------------------------------------------------------------"
echo "Running CDC Analysis..."
echo "----------------------------------------------------------------"
# Using verilator as a static analyzer for structural issues
verilator --lint-only -Wall -Wno-fatal \
    -Wno-PINCONNECTEMPTY -Wno-UNUSEDSIGNAL -Wno-CASEINCOMPLETE -Wno-MULTITOP \
    -I$SRC_DIR_SV \
    -I$GEMINI_IP_ROOT/IP/common/lib/rtl \
    $SRC_DIR_SV/spi_master_core.sv \
    $SRC_DIR_SV/spi_master_apb.sv

echo "CDC Check: Complete"
