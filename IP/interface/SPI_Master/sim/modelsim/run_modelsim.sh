#!/bin/bash
# ModelSim runner for SPI Master (SystemVerilog)

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    exit 1
fi

SIM_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SIM_DIR"

if [ -d "work" ]; then
    rm -rf work
fi
vlib work

SRC_DIR="$GEMINI_IP_ROOT/IP/interface/SPI_Master/rtl/verilog"
TB_DIR="$GEMINI_IP_ROOT/IP/interface/SPI_Master/tb"
COMMON_RTL="$GEMINI_IP_ROOT/IP/common"
LIB_RTL="$GEMINI_IP_ROOT/IP/common/lib/rtl"
LIB_VERIF="$GEMINI_IP_ROOT/IP/common/lib/verif"

set -e

# Compile FIFO
vlog -sv -timescale "1ns/1ps" "$COMMON_RTL/sync_fifo/rtl/verilog/sync_fifo.sv"

# Compile Adapters
vlog -sv -timescale "1ns/1ps" "$LIB_RTL/apb_slave_adapter.sv" "$LIB_RTL/axi4lite_slave_adapter.sv" "$LIB_RTL/wb_slave_adapter.sv"

# Compile Core and Wrappers
vlog -sv -timescale "1ns/1ps" "$SRC_DIR/spi_master_registers.sv" "$SRC_DIR/spi_master_core.sv"
vlog -sv -timescale "1ns/1ps" "$SRC_DIR/spi_master_apb.sv" "$SRC_DIR/spi_master_axi.sv" "$SRC_DIR/spi_master_wb.sv"

# Compile Testbenches (with incdir for BFMs)
vlog -sv -timescale "1ns/1ps" +incdir+"$LIB_VERIF" "$TB_DIR/tb_spi_master_core.sv"
vlog -sv -timescale "1ns/1ps" +incdir+"$LIB_VERIF" "$TB_DIR/tb_spi_master_apb.sv"
vlog -sv -timescale "1ns/1ps" +incdir+"$LIB_VERIF" "$TB_DIR/tb_spi_master_axi.sv"
vlog -sv -timescale "1ns/1ps" +incdir+"$LIB_VERIF" "$TB_DIR/tb_spi_master_wb.sv"

# Run Simulations
echo "Running Core Sim..."
vsim -c tb_spi_master_core -do "run -all; quit"

echo "Running APB Sim..."
vsim -c tb_spi_master_apb -do "run -all; quit"

echo "Running AXI Sim..."
vsim -c tb_spi_master_axi -do "run -all; quit"

echo "Running Wishbone Sim..."
vsim -c tb_spi_master_wb -do "run -all; quit"

echo "All ModelSim SV Simulations PASSED"
