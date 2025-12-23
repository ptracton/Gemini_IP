
# Set paths
# Launched from sim/modelsim/work
set GT_DIR "../../.."
set RTL_DIR "$GT_DIR/rtl/verilog"
set TB_DIR "$GT_DIR/tb"

# Create library
vlib work

# Compile RTL
vlog -sv $RTL_DIR/timer_regs.sv
vlog -sv $RTL_DIR/timer_core.sv
vlog -sv $RTL_DIR/timer_apb.sv
vlog -sv $RTL_DIR/timer_axi.sv
vlog -sv $RTL_DIR/timer_wb.sv

# Compile Testbenches
vlog -sv $TB_DIR/tb_timer_core.sv
vlog -sv $TB_DIR/tb_timer_apb.sv
vlog -sv $TB_DIR/tb_timer_axi.sv
vlog -sv $TB_DIR/tb_timer_wb.sv

puts "=================================================="
puts "COMPILATION COMPLETE"
puts "=================================================="

quit -f
