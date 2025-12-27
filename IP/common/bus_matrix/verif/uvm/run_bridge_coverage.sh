#!/bin/bash
# Description: Run Coverage flow for AHB-APB Bridge

# Source setup script
source ../../../../../setup.sh

echo "--------------------------------------------------"
echo "Running Bridge Tests with Coverage..."
echo "--------------------------------------------------"

TESTS=("bridge_rand_test" "bridge_error_test" "bridge_reset_test")

for TEST in "${TESTS[@]}"; do
    echo "--- Building and Running $TEST ---"
    ./run_uvm.sh $TEST -bridge -cov verilog
done

echo "--------------------------------------------------"
echo "Merging Code Coverage..."
echo "--------------------------------------------------"

# 1. Merge all database into a consolidated report
MERGE_CMD="xcrg -merge_cc -cc_report bridge_code_cov_report"
for TEST in "${TESTS[@]}"; do
    MERGE_CMD="$MERGE_CMD -cc_dir work_bridge_${TEST}_verilog/xsim.codeCov -cc_db $TEST"
done

echo "Executing: $MERGE_CMD"
eval $MERGE_CMD

# 2. Generate a text report for easy summary viewing
echo "--- Generating Text Report ---"
TEXT_REPORT_CMD="xcrg -merge_cc -report_format text -cc_report bridge_code_cov_text_report"
for TEST in "${TESTS[@]}"; do
    TEXT_REPORT_CMD="$TEXT_REPORT_CMD -cc_dir work_bridge_${TEST}_verilog/xsim.codeCov -cc_db $TEST"
done
eval $TEXT_REPORT_CMD

echo "--------------------------------------------------"
echo "Done. Report in $(pwd)/bridge_code_cov_report/index.html"
echo "Text summary:"
if [ -d "bridge_code_cov_text_report" ]; then
    cat bridge_code_cov_text_report/*.txt 2>/dev/null | grep -A 20 "Overall Score"
fi
echo "--------------------------------------------------"
