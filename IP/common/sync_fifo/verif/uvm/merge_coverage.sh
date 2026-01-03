#!/bin/bash
# Description: Merge all Code Coverage databases in coverage_repo

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    echo "Please source the project setup script:"
    echo "  source <path_to_gemini_ip>/setup.sh"
    exit 1
fi

# Source Setup
IP_DIR="$GEMINI_IP_ROOT/IP/common/sync_fifo/verif/uvm"
COV_REPO_DIR="$IP_DIR/coverage_repo"
REPORT_DIR="$IP_DIR/joined_code_cov_report"

echo "=================================================="
echo "Merging Code Coverage from $COV_REPO_DIR"
echo "=================================================="

# Iterate over direct coverage databases in usage
CC_DBS=""
count=0
for d in "$COV_REPO_DIR"/*; do
    if [ -d "$d" ]; then
        db_name=$(basename "$d")
        CC_DBS="$CC_DBS -cc_db $db_name"
        ((count++))
    fi
done

if [ $count -eq 0 ]; then
    echo "No coverage databases found in $CODE_COV_DIR."
    exit 1
fi

echo "Found $count databases."

# Run merge
cmd="xcrg -merge_cc -cc_dir $COV_REPO_DIR $CC_DBS -cc_report $REPORT_DIR -report_format html"
echo "Executing: $cmd"
eval $cmd

echo "=================================================="
echo "Merge Complete."
echo "Report: $REPORT_DIR/dashboard.html"
echo "=================================================="
