#!/bin/bash
# Description: Cleans up Formal verification artifacts for Bus Matrix IP

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

echo "Cleaning Formal artifacts..."

# Remove SBY directories (axi, apb, wb)
rm -rf "$SCRIPT_DIR/axi"
rm -rf "$SCRIPT_DIR/apb"
rm -rf "$SCRIPT_DIR/wb"

# Remove log files
rm -f "$SCRIPT_DIR"/*.log

echo "Done."
