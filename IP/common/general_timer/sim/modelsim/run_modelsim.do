
# Set paths
# Launched from sim/modelsim/work
set GT_DIR "../../.."
set RTL_DIR "$GT_DIR/rtl/verilog"
set TB_DIR "$GT_DIR/tb"

# Create library
vlib work

# Compile RTL
set SHARED_RTL_DIR "$GT_DIR/../../common/lib/rtl"
set SHARED_VERIF_DIR "$GT_DIR/../../common/lib/verif"
set VLOG_ARGS "-sv +incdir+$SHARED_VERIF_DIR"

vlog {*}$VLOG_ARGS $SHARED_RTL_DIR/axi4lite_slave_adapter.sv
vlog {*}$VLOG_ARGS $SHARED_RTL_DIR/apb_slave_adapter.sv
vlog {*}$VLOG_ARGS $SHARED_RTL_DIR/wb_slave_adapter.sv
vlog {*}$VLOG_ARGS $RTL_DIR/timer_regs.sv
vlog {*}$VLOG_ARGS $RTL_DIR/timer_core.sv
vlog {*}$VLOG_ARGS $RTL_DIR/timer_apb.sv
vlog {*}$VLOG_ARGS $RTL_DIR/timer_axi.sv
vlog {*}$VLOG_ARGS $RTL_DIR/timer_wb.sv

# Compile Testbenches
vlog {*}$VLOG_ARGS $TB_DIR/tb_timer_core.sv
vlog {*}$VLOG_ARGS $TB_DIR/tb_timer_apb.sv
vlog {*}$VLOG_ARGS $TB_DIR/tb_timer_axi.sv
vlog {*}$VLOG_ARGS $TB_DIR/tb_timer_wb.sv

puts "=================================================="
puts "COMPILATION COMPLETE"
puts "=================================================="

quit -f
