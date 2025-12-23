#!/bin/bash
# Description: Cleans up UVM simulation artifacts for General Timer IP

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
UVM_WORK_DIR="$SCRIPT_DIR/work"

echo "Cleaning UVM artifacts..."

# Remove the work directory entirely
if [ -d "$UVM_WORK_DIR" ]; then
    rm -rf "$UVM_WORK_DIR"
    echo "Removed $UVM_WORK_DIR"
fi

# Remove any top-level log files if they exist
rm -f "$SCRIPT_DIR"/*.log
rm -f "$SCRIPT_DIR"/*.jou
rm -f "$SCRIPT_DIR"/*.pb

echo "Done."
