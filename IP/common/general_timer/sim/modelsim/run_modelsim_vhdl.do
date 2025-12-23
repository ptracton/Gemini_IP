
# Set paths
# Launched from sim/modelsim/work_vhdl
set GT_DIR "../../.."
set RTL_DIR "$GT_DIR/rtl/vhdl"
set TB_DIR "$GT_DIR/tb"

# Create library
vlib work

# Compile RTL (VHDL 2008)
vcom -2008 -work work $RTL_DIR/timer_regs.vhd
vcom -2008 -work work $RTL_DIR/timer_core.vhd
vcom -2008 -work work $RTL_DIR/timer_apb.vhd
vcom -2008 -work work $RTL_DIR/timer_axi.vhd
vcom -2008 -work work $RTL_DIR/timer_wb.vhd

# Compile Testbenches
vcom -2008 -work work $TB_DIR/tb_timer_core.vhd
vcom -2008 -work work $TB_DIR/tb_timer_apb.vhd
vcom -2008 -work work $TB_DIR/tb_timer_axi.vhd
vcom -2008 -work work $TB_DIR/tb_timer_wb.vhd

puts "=================================================="
puts "VHDL COMPILATION COMPLETE"
puts "=================================================="

quit -f
