
# ------------------------------------------------------------------------------
# File: run_modelsim_vhdl.do
# Description: ModelSim VHDL compilation and simulation script
# ------------------------------------------------------------------------------

# Set paths
set GEMINI_IP_ROOT $env(GEMINI_IP_ROOT)
set IP_DIR "$GEMINI_IP_ROOT/IP"
set RTL_DIR "$IP_DIR/common/bus_matrix/rtl/vhdl"
set TB_DIR "$IP_DIR/common/bus_matrix/tb"
set SHARED_VERIF_DIR "$IP_DIR/common/lib/verif"

# Create library
if {[file exists work]} {
    vdel -lib work -all
}
vlib work

# Compile Common BFMs (VHDL 2008)
vcom -2008 -work work $SHARED_VERIF_DIR/wb_bfm_pkg.vhd
vcom -2008 -work work $SHARED_VERIF_DIR/axi_bfm_pkg.vhd

# Compile RTL (VHDL 2008)
vcom -2008 -work work $RTL_DIR/bus_matrix_pkg.vhd
vcom -2008 -work work $RTL_DIR/bus_matrix_arbiter.vhd
vcom -2008 -work work $RTL_DIR/bus_matrix_decoder.vhd
vcom -2008 -work work $RTL_DIR/bus_matrix_register_slice.vhd
vcom -2008 -work work $RTL_DIR/bus_matrix_wb.vhd
vcom -2008 -work work $RTL_DIR/bus_matrix_ahb.vhd
vcom -2008 -work work $RTL_DIR/bus_matrix_axi.vhd

# Compile Testbench
vcom -2008 -work work $TB_DIR/bus_matrix_tb.vhd

# Simulation
vsim -voptargs="+acc" work.bus_matrix_tb

# Run
run -all

quit
