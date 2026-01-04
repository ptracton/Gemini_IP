#!/bin/bash
# Description: Run full UVM regression for sp_memory IP to hit >90% coverage

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set. Please set it to the root of the repo."
    exit 1
fi

IP_DIR="$GEMINI_IP_ROOT/IP/common/sp_memory"
UVM_RUN="$IP_DIR/verif/uvm/run_uvm.sh"
INIT_FILE="$GEMINI_IP_ROOT/IP/common/sp_memory/verif/uvm/mem_init.hex"

echo "=================================================="
echo "Starting Full UVM Regression for sp_memory"
echo "=================================================="

# Feature Specific Tests
$UVM_RUN axi verilog sp_memory_bist_test GENERIC 1 1 -args "+INIT_FILE=$INIT_FILE"
$UVM_RUN axi verilog sp_memory_sleep_test GENERIC 1 1 -args "+INIT_FILE=$INIT_FILE"
$UVM_RUN axi verilog sp_memory_error_test GENERIC 1 1 -args "+INIT_FILE=$INIT_FILE"
$UVM_RUN axi verilog sp_memory_axi_corner_test GENERIC 1 1 -args "+INIT_FILE=$INIT_FILE"
$UVM_RUN axi verilog sp_memory_ecc_bitflip_test GENERIC 1 1 -args "+INIT_FILE=$INIT_FILE"

# Technology Specific Runs for Coverage
$UVM_RUN axi verilog sp_memory_stress_test XILINX 1 1 -args "+INIT_FILE=$INIT_FILE"
$UVM_RUN axi verilog sp_memory_stress_test ALTERA 1 1 -args "+INIT_FILE=$INIT_FILE"

# Standardizing Interface Runs on GENERIC MAX Config
$UVM_RUN axi verilog sp_memory_stress_test GENERIC 1 1 -args "+INIT_FILE=$INIT_FILE"
$UVM_RUN apb verilog sp_memory_stress_test GENERIC 1 1 -args "+INIT_FILE=$INIT_FILE"
$UVM_RUN wb  verilog sp_memory_stress_test GENERIC 1 1 -args "+INIT_FILE=$INIT_FILE"
$UVM_RUN ahb verilog sp_memory_stress_test GENERIC 1 1 -args "+INIT_FILE=$INIT_FILE"

echo "=================================================="
echo "Regression Complete. Generating Coverage Report..."
echo "=================================================="

# Merging Coverage (Aggregrating ALL runs now that parameters are standardized)
MERGE_DIR="$IP_DIR/cov_merge_final"
REPORT_DIR="$IP_DIR/coverage_report_final"
# Assuming coverage_repo is populated by run_uvm.sh or previous steps. 
# Based on previous script, it assumes data is in IP/common/sp_memory/coverage_repo/xsim.codeCov
REPO_DIR="$IP_DIR/coverage_repo/xsim.codeCov"

mkdir -p $MERGE_DIR/xsim.codeCov
rm -rf $MERGE_DIR/xsim.codeCov/*

if [ -d "$REPO_DIR" ]; then
    for d in $REPO_DIR/*; do
        if [ -d "$d" ]; then
            db_name=$(basename $d)
            ln -sf $(readlink -f $d) $MERGE_DIR/xsim.codeCov/$db_name
        fi
    done

    # Run xcrg with merged database
    # Constructing arguments for xcrg
    DB_ARGS=""
    for db in $MERGE_DIR/xsim.codeCov/*; do
        if [ -d "$db" ]; then
            DB_ARGS="$DB_ARGS -cc_db $(basename $db)"
        fi
    done
    
    # Note: xcrg expects -cc_db name relative to -cc_dir or absolute paths? 
    # The previous script did: ls ... | xargs -I {} echo "-cc_db {}"
    # It passed just the name.
    # So: xcrg -merge_cc -cc_dir ./IP/common/sp_memory/cov_merge_final ...
    
    cd $MERGE_DIR
    xcrg -merge_cc -cc_dir . $DB_ARGS -cc_report $REPORT_DIR
else
    echo "Warning: Coverage repository $REPO_DIR not found. Skipping merge."
fi
