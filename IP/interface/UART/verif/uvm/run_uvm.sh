#!/bin/bash
# UVM Run Script for UART IP using Xilinx Vivado (xsim)

# Cleanup
rm -rf xsim.dir *.log *.pb *.jou *.wdb

# Paths
IP_ROOT=../../../../..
COMMON_LIB=$IP_ROOT/IP/common/lib/verif/uvm/agents
UART_UVM=.

# Simulation Configuration
# Usage: ./run_uvm.sh [TESTNAME] [BUS_TYPE]
# BUS_TYPE: APB (default), AXI, WB
TESTNAME=${1:-uart_sanity_test}
BUS_TYPE=${2:-APB}
DEFINE_FLAG="-d TEST_$BUS_TYPE"

echo "Running $TESTNAME on $BUS_TYPE Bus..."


# 0. Global
xvlog -sv $DEFINE_FLAG $UART_UVM/glbl.sv

# 1. Interfaces & Packages
xvlog -sv -L uvm $DEFINE_FLAG \
    -i $COMMON_LIB/apb_agent \
    -i $COMMON_LIB/axi_agent \
    -i $COMMON_LIB/wb_agent \
    -i $UART_UVM/agents/uart_agent \
    -i $UART_UVM/env \
    -i $UART_UVM/tests \
    -i $UART_UVM \
    $COMMON_LIB/apb_agent/apb_if.sv \
    $COMMON_LIB/axi_agent/axi_if.sv \
    $COMMON_LIB/wb_agent/wb_if.sv \
    $UART_UVM/agents/uart_agent/uart_if.sv \
    $COMMON_LIB/apb_agent/apb_agent_pkg.sv \
    $COMMON_LIB/axi_agent/axi_agent_pkg.sv \
    $COMMON_LIB/wb_agent/wb_agent_pkg.sv \
    $UART_UVM/agents/uart_agent/uart_agent_pkg.sv \
    $UART_UVM/env/uart_env_pkg.sv \
    $UART_UVM/tests/uart_test_pkg.sv

# 2. DUT
xvlog -sv -L uvm $DEFINE_FLAG \
    -i $IP_ROOT/IP/common/sync_fifo/rtl/verilog \
    -i $IP_ROOT/IP/common/lib/rtl \
    -i $IP_ROOT/IP/interface/UART/rtl/verilog \
    $IP_ROOT/IP/common/sync_fifo/rtl/verilog/sync_fifo.sv \
    $IP_ROOT/IP/common/lib/rtl/apb_slave_adapter.sv \
    $IP_ROOT/IP/common/lib/rtl/axi4lite_slave_adapter.sv \
    $IP_ROOT/IP/common/lib/rtl/wb_slave_adapter.sv \
    $IP_ROOT/IP/interface/UART/rtl/verilog/uart_core.sv \
    $IP_ROOT/IP/interface/UART/rtl/verilog/uart_apb.sv \
    $IP_ROOT/IP/interface/UART/rtl/verilog/uart_axi.sv \
    $IP_ROOT/IP/interface/UART/rtl/verilog/uart_wb.sv

# 3. TB Top
xvlog -sv -L uvm $DEFINE_FLAG \
    -i $UART_UVM/tb \
    -i $UART_UVM \
    $UART_UVM/tb/tb_top.sv

# Simulation

# Elaboration
# Elaboration
xelab -L uvm -cov_db_dir ./xsim.codecov_$TESTNAME -cov_db_name $TESTNAME -cc_type sbct -debug typical tb_top glbl -s ${TESTNAME}_sim -timescale 1ns/1ps $DEFINE_FLAG

xsim ${TESTNAME}_sim -testplusarg "UVM_TESTNAME=$TESTNAME" -testplusarg "BUS_TYPE=$BUS_TYPE" -runall
