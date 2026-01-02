#!/bin/bash

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set. Please source setup.sh before running this script."
    exit 1
fi

WORK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$WORK_DIR"

FAILED=0


echo "Running SPI Master Core Test..."
make BUS_TYPE=CORE
if [ $? -ne 0 ]; then FAILED=1; fi

echo "Running SPI Master APB Test..."
make BUS_TYPE=APB
if [ $? -ne 0 ]; then FAILED=1; fi

echo "Running SPI Master AXI Test..."
make BUS_TYPE=AXI
if [ $? -ne 0 ]; then FAILED=1; fi

echo "Running SPI Master Wishbone Test..."
make BUS_TYPE=WB
if [ $? -ne 0 ]; then FAILED=1; fi

if [ $FAILED -ne 0 ]; then
    echo "Cocotb Regression FAILED"
    exit 1
else
    echo "Cocotb Regression PASSED"
    exit 0
fi
