#!/bin/bash
# ------------------------------------------------------------------------------
# Script: run_iverilog.sh
# Description: Compiles and runs the SystemVerilog testbench using Icarus Verilog.
#              Checks for GEMINI_IP_ROOT environment variable.
# Author: Gemini-3 AI
# ------------------------------------------------------------------------------

# Check for GEMINI_IP_ROOT
if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    echo "Please source 'setup.sh' in the project root."
    exit 1
fi

# Define paths
SPI_ROOT="$GEMINI_IP_ROOT/IP/interface/SPI_Slave"
OUT_DIR="$SPI_ROOT/sim/iverilog/out"

# Create output directory
mkdir -p $OUT_DIR

# Compile
iverilog -g2012 -DSIMULATION \
    -o $OUT_DIR/spi_slave.vvp \
    $SPI_ROOT/rtl/verilog/spi_async_fifo.sv \
    $SPI_ROOT/rtl/verilog/spi_slave_core.sv \
    $SPI_ROOT/tb/tb_spi_slave_core.sv

# Check for compilation errors
if [ $? -ne 0 ]; then
    echo "Compilation Failed"
    exit 1
fi

# Run Simulation
cd $OUT_DIR
vvp -l simulation.log spi_slave.vvp

# Check for runtime errors
if [ $? -ne 0 ]; then
    echo "Simulation Failed"
    exit 1
fi


# -----------------------------------------------------------------------------
# Testbench: SPI Slave Wishbone Wrapper
# -----------------------------------------------------------------------------
echo "Compiling SPI Slave Wishbone Wrapper Testbench..."
iverilog -g2012 -DSIMULATION \
    -o $OUT_DIR/tb_spi_slave_wb.vvp \
    -I $SPI_ROOT/rtl/verilog \
    $SPI_ROOT/rtl/verilog/spi_async_fifo.sv \
    $SPI_ROOT/rtl/verilog/spi_slave_core.sv \
    $SPI_ROOT/rtl/verilog/spi_slave_wb.sv \
    $SPI_ROOT/tb/tb_spi_slave_wb.sv

if [ $? -eq 0 ]; then
    echo "Running Wishbone Simulation..."
    vvp -l simulation_wb.log $OUT_DIR/tb_spi_slave_wb.vvp
    if [ $? -ne 0 ]; then
        echo "Wishbone Simulation Failed"
        exit 1
    else
        echo "Wishbone Simulation Passed"
    fi
else
    echo "Wishbone Compilation Failed"
    exit 1
fi

# -----------------------------------------------------------------------------
# Testbench: SPI Slave AXI4-Lite Wrapper
# -----------------------------------------------------------------------------
echo "Compiling SPI Slave AXI4-Lite Wrapper Testbench..."
iverilog -g2012 -DSIMULATION \
    -o $OUT_DIR/tb_spi_slave_axi.vvp \
    -I $SPI_ROOT/rtl/verilog \
    $SPI_ROOT/rtl/verilog/spi_async_fifo.sv \
    $SPI_ROOT/rtl/verilog/spi_slave_core.sv \
    $SPI_ROOT/rtl/verilog/spi_slave_axi.sv \
    $SPI_ROOT/tb/tb_spi_slave_axi.sv

if [ $? -eq 0 ]; then
    echo "Running AXI Simulation..."
    vvp -l simulation_axi.log $OUT_DIR/tb_spi_slave_axi.vvp
    if [ $? -ne 0 ]; then
        echo "AXI Simulation Failed"
        exit 1
    else
        echo "AXI Simulation Passed"
    fi
else
    echo "AXI Compilation Failed"
    exit 1
fi


# -----------------------------------------------------------------------------
# Testbench: SPI Slave AHB Master Wrapper
# -----------------------------------------------------------------------------
echo "Compiling SPI Slave AHB Master Wrapper Testbench..."
iverilog -g2012 -DSIMULATION \
    -o $OUT_DIR/tb_spi_slave_ahb.vvp \
    -I $SPI_ROOT/rtl/verilog \
    $SPI_ROOT/rtl/verilog/spi_async_fifo.sv \
    $SPI_ROOT/rtl/verilog/spi_slave_core.sv \
    $SPI_ROOT/rtl/verilog/spi_slave_ahb.sv \
    $SPI_ROOT/tb/tb_spi_slave_ahb.sv

if [ $? -eq 0 ]; then
    echo "Running AHB Simulation..."
    vvp -l simulation_ahb.log $OUT_DIR/tb_spi_slave_ahb.vvp
    if [ $? -ne 0 ]; then
        echo "AHB Simulation Failed"
        exit 1
    else
        echo "AHB Simulation Passed"
    fi
else
    echo "AHB Compilation Failed"
    exit 1
fi

echo "All SV Simulations Completed"
