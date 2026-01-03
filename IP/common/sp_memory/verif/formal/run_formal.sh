#!/bin/bash
# File: run_formal.sh
# Description: Runner script for sp_memory formal verification with multiple tasks.

set -e

# Use provided GEMINI_IP_ROOT or assume current structure
if [ -z "$GEMINI_IP_ROOT" ]; then
    SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
    export GEMINI_IP_ROOT=$(realpath $SCRIPT_DIR/../../../../..)
fi

FORMAL_DIR="$GEMINI_IP_ROOT/IP/common/sp_memory/verif/formal"
cd "$FORMAL_DIR"

echo "=================================================="
echo "Running Formal Verification: sp_memory"
echo "=================================================="

# Check if sby is in path
if ! command -v sby &> /dev/null; then
    echo "Error: sby (SymbiYosys) not found in PATH."
    exit 1
fi

# Clean previous runs
rm -rf sp_memory_*/

# Run SBY for all tasks
# If tasks are defined, sby runs them all by default or we can specify.
# We'll run them sequentially and check status.
TASKS=("core" "axi" "ahb" "apb" "wb")

for task in "${TASKS[@]}"; do
    echo "--------------------------------------------------"
    echo "Task: $task"
    echo "--------------------------------------------------"
    sby -f sp_memory.sby "$task"
done

echo "=================================================="
echo "Formal Verification Complete"
echo "=================================================="
