#!/bin/bash
# Icarus Verilog runner for SPI Master

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    exit 1
fi

SIM_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SIM_DIR"

# Generate Temp Timescale
echo '`timescale 1ns / 1ps' > timescale.sv
trap "rm -f timescale.sv" EXIT

IVERILOG_BIN="iverilog"
VVP_BIN="vvp"

SRC_DIR="$GEMINI_IP_ROOT/IP/interface/SPI_Master/rtl/verilog"
TB_DIR="$GEMINI_IP_ROOT/IP/interface/SPI_Master/tb"
FIFO_DIR="$GEMINI_IP_ROOT/IP/common/sync_fifo/rtl/verilog"
LIB_DIR="$GEMINI_IP_ROOT/IP/common/lib/rtl"
VERIF_DIR="$GEMINI_IP_ROOT/IP/common/lib/verif"

FAILED=0

# 1. Core Simulation
echo "Running Core Simulation..."
echo "Compiling..."
$IVERILOG_BIN -g2012 -o spi_core_sim \
    "$FIFO_DIR/sync_fifo.sv" \
    "$SRC_DIR/spi_master_core.sv" \
    "$TB_DIR/tb_spi_master_core.sv"

if [ $? -eq 0 ]; then
    echo "Simulating..."
    $VVP_BIN spi_core_sim
    if [ $? -ne 0 ]; then FAILED=1; fi
else
    echo "Core Compilation failed."
    FAILED=1
fi

# 2. APB Wrapper Simulation
echo "Running APB Wrapper Simulation..."
$IVERILOG_BIN -g2012 -I"$VERIF_DIR" -o spi_apb_sim \
    "$FIFO_DIR/sync_fifo.sv" \
    "$LIB_DIR/apb_slave_adapter.sv" \
    "$SRC_DIR/spi_master_registers.sv" \
    "$SRC_DIR/spi_master_core.sv" \
    "$SRC_DIR/spi_master_apb.sv" \
    "$TB_DIR/tb_spi_master_apb.sv"

if [ $? -eq 0 ]; then
    $VVP_BIN spi_apb_sim
    if [ $? -ne 0 ]; then FAILED=1; fi
else
    echo "APB Compilation failed."
    FAILED=1
fi

# 3. AXI Wrapper Simulation
echo "Running AXI Wrapper Simulation..."
$IVERILOG_BIN -g2012 -I"$VERIF_DIR" -o spi_axi_sim \
    "timescale.sv" \
    "$FIFO_DIR/sync_fifo.sv" \
    "$LIB_DIR/axi4lite_slave_adapter.sv" \
    "$SRC_DIR/spi_master_registers.sv" \
    "$SRC_DIR/spi_master_core.sv" \
    "$SRC_DIR/spi_master_axi.sv" \
    "$TB_DIR/tb_spi_master_axi.sv"

if [ $? -eq 0 ]; then
    $VVP_BIN spi_axi_sim
    if [ $? -ne 0 ]; then FAILED=1; fi
else
    echo "AXI Compilation failed."
    FAILED=1
fi

# 4. Wishbone Wrapper Simulation
echo "Running Wishbone Wrapper Simulation..."
$IVERILOG_BIN -g2012 -I"$VERIF_DIR" -o spi_wb_sim \
    "timescale.sv" \
    "$FIFO_DIR/sync_fifo.sv" \
    "$LIB_DIR/wb_slave_adapter.sv" \
    "$SRC_DIR/spi_master_registers.sv" \
    "$SRC_DIR/spi_master_core.sv" \
    "$SRC_DIR/spi_master_wb.sv" \
    "$TB_DIR/tb_spi_master_wb.sv"

if [ $? -eq 0 ]; then
    $VVP_BIN spi_wb_sim
    if [ $? -ne 0 ]; then FAILED=1; fi
else
    echo "Wishbone Compilation failed."
    FAILED=1
fi

if [ $FAILED -eq 0 ]; then
    echo "All Icarus Verilog Simulations PASSED"
    exit 0
else
    echo "Some Icarus Verilog Simulations FAILED"
    exit 1
fi
