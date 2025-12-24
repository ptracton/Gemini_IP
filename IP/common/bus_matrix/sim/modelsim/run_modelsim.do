
# ------------------------------------------------------------------------------
# File: run_modelsim.do
# Description: ModelSim compilation and simulation script for Bus Matrix
# ------------------------------------------------------------------------------

# Set paths
# Use environment variable set by setup.sh
set GEMINI_IP_ROOT $env(GEMINI_IP_ROOT)
set IP_DIR "$GEMINI_IP_ROOT/IP"
set RTL_DIR "$IP_DIR/common/bus_matrix/rtl/verilog"
set TB_DIR "$IP_DIR/common/bus_matrix/tb"
set SHARED_VERIF_DIR "$IP_DIR/common/lib/verif"

# Create library
if {[file exists work]} {
    vdel -lib work -all
}
vlib work

# Compile RTL and Testbench
# Note: +incdir+ is used to find included BFM tasks
vlog -sv +incdir+$SHARED_VERIF_DIR \
    $RTL_DIR/bus_matrix_pkg.sv \
    $RTL_DIR/bus_matrix_arbiter.sv \
    $RTL_DIR/bus_matrix_decoder.sv \
    $RTL_DIR/bus_matrix_register_slice.sv \
    $RTL_DIR/bus_matrix_wb.sv \
    $RTL_DIR/bus_matrix_ahb.sv \
    $RTL_DIR/bus_matrix_axi.sv \
    $TB_DIR/bus_matrix_tb.sv

# Simulation
vsim -voptargs="+acc" work.bus_matrix_tb

# Run
run -all

# Check for success message in transcript happens in the shell script wrap or manually
quit
