#!/bin/bash
# run_iverilog.sh

# Ensure we are in the script directory
cd "$(dirname "$0")"

# Cleanup
rm -rf work
mkdir -p work

# Compile
iverilog -g2012 -I../../../lib/verif \
    -o work/timer_core.vvp \
    -s tb_timer_core \
    ../../rtl/verilog/timer_core.sv \
    ../../tb/tb_timer_core.sv

# Run
cd work
vvp timer_core.vvp || exit 1
cd ..

# Compile & Run APB
echo "--- Compiling APB Test ---"
iverilog -g2012 -I../../../lib/verif \
    -o work/timer_apb.vvp \
    -s tb_timer_apb \
    ../../../lib/rtl/apb_slave_adapter.sv \
    ../../rtl/verilog/timer_core.sv \
    ../../rtl/verilog/timer_regs.sv \
    ../../rtl/verilog/timer_apb.sv \
    ../../tb/tb_timer_apb.sv

cd work
vvp timer_apb.vvp || exit 1
cd ..

# Compile & Run AXI
echo "--- Compiling AXI Test ---"
iverilog -g2012 -I../../../lib/verif \
    -o work/timer_axi.vvp \
    -s tb_timer_axi \
    ../../../lib/rtl/axi4lite_slave_adapter.sv \
    ../../rtl/verilog/timer_core.sv \
    ../../rtl/verilog/timer_regs.sv \
    ../../rtl/verilog/timer_axi.sv \
    ../../tb/tb_timer_axi.sv

cd work
vvp timer_axi.vvp || exit 1
cd ..

# Compile & Run Wishbone
echo "--- Compiling Wishbone Test ---"
iverilog -g2012 -I../../../lib/verif \
    -o work/timer_wb.vvp \
    -s tb_timer_wb \
    ../../../lib/rtl/wb_slave_adapter.sv \
    ../../rtl/verilog/timer_core.sv \
    ../../rtl/verilog/timer_regs.sv \
    ../../rtl/verilog/timer_wb.sv \
    ../../tb/tb_timer_wb.sv

cd work
vvp timer_wb.vvp || exit 1
cd ..
