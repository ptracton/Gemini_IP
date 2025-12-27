#!/bin/bash
# Description: Run Coverage flow (Multi-build, merge)

# Source setup script
source ../../../../../setup.sh

echo "--------------------------------------------------"
echo "Running Tests with Coverage..."
echo "--------------------------------------------------"

TESTS=("bus_matrix_base_test" "bus_matrix_rand_test" "bus_matrix_error_test" "bus_matrix_contention_test" "bus_matrix_stress_test")

for TEST in "${TESTS[@]}"; do
    echo "--- Building and Running $TEST ---"
    ./run_uvm.sh $TEST -cov
done

echo "--------------------------------------------------"
echo "Merging Code Coverage..."
echo "--------------------------------------------------"

# 1. Merge all database into a consolidated report
MERGE_CMD="xcrg -merge_cc -cc_report code_cov_report"
for TEST in "${TESTS[@]}"; do
    # Each test run created its own work directory
    # We point xcrg to the xsim.codeCov directory inside each work dir
    MERGE_CMD="$MERGE_CMD -cc_dir work_${TEST}_verilog/xsim.codeCov -cc_db $TEST"
done

echo "Executing: $MERGE_CMD"
eval $MERGE_CMD

# 2. Generate a text report for easy summary viewing
echo "--- Generating Text Report ---"
TEXT_REPORT_CMD="xcrg -merge_cc -report_format text -cc_report code_cov_text_report"
for TEST in "${TESTS[@]}"; do
    TEXT_REPORT_CMD="$TEXT_REPORT_CMD -cc_dir work_${TEST}_verilog/xsim.codeCov -cc_db $TEST"
done
eval $TEXT_REPORT_CMD

echo "--------------------------------------------------"
echo "Done. Report in $(pwd)/code_cov_report/index.html"
echo "Text summary:"
if [ -d "code_cov_text_report" ]; then
    cat code_cov_text_report/*.txt 2>/dev/null | grep -A 20 "Overall Score"
fi
echo "--------------------------------------------------"

