#!/bin/bash
# run_ghdl.sh
cd "$(dirname "$0")"

# Cleanup
rm -rf work
mkdir -p work
cd work

echo "--- Analyzing Core VHDL ---"
ghdl -a --std=08 ../../../rtl/vhdl/timer_core.vhd
ghdl -a --std=08 ../../../rtl/vhdl/timer_regs.vhd
ghdl -a --std=08 ../../../tb/tb_timer_core.vhd

echo "--- Elaborating & Running Core Test ---"
ghdl -e --std=08 tb_timer_core
ghdl -r --std=08 tb_timer_core --vcd=core.vcd || exit 1

echo "--- Analyzing APB VHDL ---"
SHARED_RTL_DIR="../../../../common/lib/rtl"
ghdl -a --std=08 $SHARED_RTL_DIR/apb_slave_adapter.vhd
ghdl -a --std=08 ../../../rtl/vhdl/timer_apb.vhd
ghdl -a --std=08 ../../../tb/tb_timer_apb.vhd

echo "--- Elaborating & Running APB Test ---"
ghdl -e --std=08 tb_timer_apb
ghdl -r --std=08 tb_timer_apb --vcd=apb.vcd || exit 1

echo "--- Analyzing AXI VHDL ---"
ghdl -a --std=08 $SHARED_RTL_DIR/axi4lite_slave_adapter.vhd
ghdl -a --std=08 ../../../rtl/vhdl/timer_axi.vhd
ghdl -a --std=08 ../../../tb/tb_timer_axi.vhd

echo "--- Elaborating & Running AXI Test ---"
ghdl -e --std=08 tb_timer_axi
ghdl -r --std=08 tb_timer_axi --vcd=axi.vcd || exit 1

echo "--- Analyzing WB VHDL ---"
ghdl -a --std=08 $SHARED_RTL_DIR/wb_slave_adapter.vhd
ghdl -a --std=08 ../../../rtl/vhdl/timer_wb.vhd
ghdl -a --std=08 ../../../tb/tb_timer_wb.vhd

echo "--- Elaborating & Running WB Test ---"
ghdl -e --std=08 tb_timer_wb
ghdl -r --std=08 tb_timer_wb --vcd=wb.vcd || exit 1

echo "ALL GHDL TESTS PASSED"
