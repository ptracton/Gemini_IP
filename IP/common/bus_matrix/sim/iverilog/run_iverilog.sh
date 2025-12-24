#!/bin/bash
# run_iverilog.sh

# Ensure we are in the script directory
cd "$(dirname "$0")"

# Cleanup
rm -rf work
mkdir -p work

# Compile
iverilog -g2012 -I../../../lib/verif \
    -o work/bus_matrix_core.vvp \
    -s tb_bus_matrix_core \
    ../../rtl/verilog/bus_matrix_core.sv \
    ../../tb/tb_bus_matrix_core.sv

# Run
cd work
vvp bus_matrix_core.vvp || exit 1
cd ..

# Compile & Run APB
echo "--- Compiling APB Test ---"
iverilog -g2012 -I../../../lib/verif \
    -o work/bus_matrix_apb.vvp \
    -s tb_bus_matrix_apb \
    ../../../lib/rtl/apb_slave_adapter.sv \
    ../../rtl/verilog/bus_matrix_core.sv \
    ../../rtl/verilog/bus_matrix_regs.sv \
    ../../rtl/verilog/bus_matrix_apb.sv \
    ../../tb/tb_bus_matrix_apb.sv

cd work
vvp bus_matrix_apb.vvp || exit 1
cd ..

# Compile & Run AXI
echo "--- Compiling AXI Test ---"
iverilog -g2012 -I../../../lib/verif \
    -o work/bus_matrix_axi.vvp \
    -s tb_bus_matrix_axi \
    ../../../lib/rtl/axi4lite_slave_adapter.sv \
    ../../rtl/verilog/bus_matrix_core.sv \
    ../../rtl/verilog/bus_matrix_regs.sv \
    ../../rtl/verilog/bus_matrix_axi.sv \
    ../../tb/tb_bus_matrix_axi.sv

cd work
vvp bus_matrix_axi.vvp || exit 1
cd ..

# Compile & Run Wishbone
echo "--- Compiling Wishbone Test ---"
iverilog -g2012 -I../../../lib/verif \
    -o work/bus_matrix_wb.vvp \
    -s tb_bus_matrix_wb \
    ../../../lib/rtl/wb_slave_adapter.sv \
    ../../rtl/verilog/bus_matrix_core.sv \
    ../../rtl/verilog/bus_matrix_regs.sv \
    ../../rtl/verilog/bus_matrix_wb.sv \
    ../../tb/tb_bus_matrix_wb.sv

cd work
vvp bus_matrix_wb.vvp || exit 1
cd ..
