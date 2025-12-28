#!/bin/bash
# Run Linting for Sync FIFO

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    exit 1
fi

IP_DIR="$GEMINI_IP_ROOT/IP/common/sync_fifo"
SV_RTL_DIR="$IP_DIR/rtl/verilog"
VHDL_RTL_DIR="$IP_DIR/rtl/vhdl"

echo "Linting SystemVerilog..."
verilator --lint-only -Wall -Wno-DECLFILENAME "$GEMINI_IP_ROOT/IP/common/lib/rtl/apb_slave_adapter.sv"
verilator --lint-only -Wall -Wno-DECLFILENAME "$GEMINI_IP_ROOT/IP/common/lib/rtl/axi4lite_slave_adapter.sv"
verilator --lint-only -Wall -Wno-DECLFILENAME "$GEMINI_IP_ROOT/IP/common/lib/rtl/wb_slave_adapter.sv"
verilator --lint-only -Wall -Wno-DECLFILENAME "$SV_RTL_DIR/sync_fifo.sv" --top-module sync_fifo
verilator --lint-only -Wall -Wno-DECLFILENAME -I"$GEMINI_IP_ROOT/IP/common/lib/rtl" -I"$SV_RTL_DIR" "$SV_RTL_DIR/sync_fifo_apb.sv" --top-module sync_fifo_apb
verilator --lint-only -Wall -Wno-DECLFILENAME -I"$GEMINI_IP_ROOT/IP/common/lib/rtl" -I"$SV_RTL_DIR" "$SV_RTL_DIR/sync_fifo_axi.sv" --top-module sync_fifo_axi
verilator --lint-only -Wall -Wno-DECLFILENAME -I"$GEMINI_IP_ROOT/IP/common/lib/rtl" -I"$SV_RTL_DIR" "$SV_RTL_DIR/sync_fifo_wb.sv" --top-module sync_fifo_wb
# AXI Wrapper
verilator --lint-only -Wall -I$GEMINI_IP_ROOT/IP/common/sync_fifo/rtl/verilog -I$GEMINI_IP_ROOT/IP/common/lib/rtl $GEMINI_IP_ROOT/IP/common/sync_fifo/rtl/verilog/sync_fifo_axi.sv $GEMINI_IP_ROOT/IP/common/lib/rtl/axi4lite_slave_adapter.sv

# AHB Wrapper
verilator --lint-only -Wall -I$GEMINI_IP_ROOT/IP/common/sync_fifo/rtl/verilog -I$GEMINI_IP_ROOT/IP/common/lib/rtl $GEMINI_IP_ROOT/IP/common/sync_fifo/rtl/verilog/sync_fifo_ahb.sv $GEMINI_IP_ROOT/IP/common/lib/rtl/ahb_slave_adapter.sv

echo "Linting VHDL..."
ghdl -s --std=08 "$GEMINI_IP_ROOT/IP/common/lib/rtl/apb_slave_adapter.vhd"
ghdl -s --std=08 "$GEMINI_IP_ROOT/IP/common/lib/rtl/axi4lite_slave_adapter.vhd"
ghdl -s --std=08 "$GEMINI_IP_ROOT/IP/common/lib/rtl/wb_slave_adapter.vhd"
ghdl -s --std=08 "$GEMINI_IP_ROOT/IP/common/sync_fifo/rtl/vhdl/sync_fifo.vhd"
ghdl -s --std=08 "$GEMINI_IP_ROOT/IP/common/sync_fifo/rtl/vhdl/sync_fifo_apb.vhd"
ghdl -s --std=08 "$GEMINI_IP_ROOT/IP/common/sync_fifo/rtl/vhdl/sync_fifo_axi.vhd"
ghdl -s --std=08 "$GEMINI_IP_ROOT/IP/common/sync_fifo/rtl/vhdl/sync_fifo_wb.vhd"
# AXI Wrapper
ghdl -a --std=08 $GEMINI_IP_ROOT/IP/common/lib/rtl/axi4lite_slave_adapter.vhd $GEMINI_IP_ROOT/IP/common/sync_fifo/rtl/vhdl/sync_fifo.vhd $GEMINI_IP_ROOT/IP/common/sync_fifo/rtl/vhdl/sync_fifo_axi.vhd

# AHB Wrapper
ghdl -a --std=08 $GEMINI_IP_ROOT/IP/common/lib/rtl/ahb_slave_adapter.vhd $GEMINI_IP_ROOT/IP/common/sync_fifo/rtl/vhdl/sync_fifo.vhd $GEMINI_IP_ROOT/IP/common/sync_fifo/rtl/vhdl/sync_fifo_ahb.vhd
