#!/bin/bash
# run_uvm.sh
# Unified package version with isolated AXI TB

set -e

if [ -z "$GEMINI_IP_ROOT" ]; then
    export GEMINI_IP_ROOT=$(pwd)
fi

# Clean previous build artifacts
rm -rf xsim.dir *.log *.jou *.pb

BUS_TYPE=$1
if [ -z "$BUS_TYPE" ]; then
    BUS_TYPE="core"
fi

case ${BUS_TYPE} in
  core)
    BUS_FLAG="CORE_ONLY"
    TEST_NAME="fifo_rand_test"
    TOP_FILE="IP/common/sync_fifo/verif/uvm/tb/tb_top.sv"
    ;;
  axi)
    BUS_FLAG="BUS_AXI"
    TEST_NAME="fifo_axi_basic_test"
    TOP_FILE="IP/common/sync_fifo/verif/uvm/tb/tb_axi.sv"
    ;;
  apb)
    BUS_FLAG="BUS_APB"
    TEST_NAME="fifo_apb_basic_test"
    TOP_FILE="IP/common/sync_fifo/verif/uvm/tb/tb_top.sv"
    ;;
  wb)
    BUS_FLAG="BUS_WB"
    TEST_NAME="fifo_wb_basic_test"
    TOP_FILE="IP/common/sync_fifo/verif/uvm/tb/tb_top.sv"
    ;;
  *)
    echo "Unknown BUS_TYPE: ${BUS_TYPE}"
    exit 1
    ;;
esac

export BUS_TYPE=${BUS_FLAG}

UVM_OPTS="-i IP/common/sync_fifo/verif/uvm/agents/fifo_agent \
         -i IP/common/lib/verif/uvm/agents/apb_agent \
         -i IP/common/lib/verif/uvm/agents/axi_agent \
         -i IP/common/lib/verif/uvm/agents/wb_agent \
         -i IP/common/sync_fifo/verif/uvm/env \
         -i IP/common/sync_fifo/verif/uvm/seq \
         -i IP/common/sync_fifo/verif/uvm/tests"

COMMON_OPTS="-d SIMULATION -d BUS_WIDTH=32 -d ${BUS_FLAG}"

echo "--- Compiling RTL ---"
xvlog -sv ${COMMON_OPTS} \
    ${GEMINI_IP_ROOT}/IP/common/lib/rtl/axi4lite_slave_adapter.sv \
    ${GEMINI_IP_ROOT}/IP/common/lib/rtl/apb_slave_adapter.sv \
    ${GEMINI_IP_ROOT}/IP/common/lib/rtl/wb_slave_adapter.sv \
    ${GEMINI_IP_ROOT}/IP/common/sync_fifo/rtl/verilog/sync_fifo.sv \
    ${GEMINI_IP_ROOT}/IP/common/sync_fifo/rtl/verilog/sync_fifo_axi.sv \
    ${GEMINI_IP_ROOT}/IP/common/sync_fifo/rtl/verilog/sync_fifo_apb.sv \
    ${GEMINI_IP_ROOT}/IP/common/sync_fifo/rtl/verilog/sync_fifo_wb.sv

echo "--- Compiling Agents ---"
xvlog -sv -L uvm ${UVM_OPTS} \
    ${GEMINI_IP_ROOT}/IP/common/lib/verif/uvm/agents/apb_agent/apb_if.sv \
    ${GEMINI_IP_ROOT}/IP/common/lib/verif/uvm/agents/apb_agent/apb_agent_pkg.sv \
    ${GEMINI_IP_ROOT}/IP/common/lib/verif/uvm/agents/axi_agent/axi_if.sv \
    ${GEMINI_IP_ROOT}/IP/common/lib/verif/uvm/agents/axi_agent/axi_agent_pkg.sv \
    ${GEMINI_IP_ROOT}/IP/common/lib/verif/uvm/agents/wb_agent/wb_if.sv \
    ${GEMINI_IP_ROOT}/IP/common/lib/verif/uvm/agents/wb_agent/wb_agent_pkg.sv \
    ${GEMINI_IP_ROOT}/IP/common/sync_fifo/verif/uvm/agents/fifo_agent/fifo_if.sv \
    ${GEMINI_IP_ROOT}/IP/common/sync_fifo/verif/uvm/agents/fifo_agent/fifo_agent_pkg.sv

echo "--- Compiling Env & Master Test Package ---"
xvlog -sv -L uvm ${UVM_OPTS} \
    ${GEMINI_IP_ROOT}/IP/common/sync_fifo/verif/uvm/env/sync_fifo_env_pkg.sv \
    ${GEMINI_IP_ROOT}/IP/common/sync_fifo/verif/uvm/tests/sync_fifo_all_tests_pkg.sv

echo "--- Compiling Top ---"
xvlog -sv -L uvm ${UVM_OPTS} ${COMMON_OPTS} \
    ${GEMINI_IP_ROOT}/${TOP_FILE}

echo "--- Elaborating ---"
xelab -debug all tb_top -s top_sim -timescale 1ns/1ps -L uvm

echo "--- Simulating ---"
xsim top_sim -R -testplusarg "UVM_TESTNAME=${TEST_NAME}" -log uvm_sim.log

if grep -q "UVM_ERROR :    0" uvm_sim.log && grep -q "UVM_FATAL :    0" uvm_sim.log; then
    echo "UVM SIMULATION PASSED (${BUS_TYPE})"
    exit 0
else
    echo "UVM SIMULATION FAILED (${BUS_TYPE})"
    exit 1
fi
