
# Vivado Synthesis Script for Gemini_IP GPIO

if { $argc != 2 } {
    puts "Usage: vivado -mode batch -source run_vivado.tcl -tclargs <TOP_MODULE> <PART>"
    exit 1
}

if { ![info exists ::env(GEMINI_IP_ROOT)] } {
    puts "Error: GEMINI_IP_ROOT is not set. Please source setup.sh"
    exit 1
}

set GEMINI_IP_ROOT $::env(GEMINI_IP_ROOT)
set TOP_MODULE [lindex $argv 0]
set PART [lindex $argv 1]
set RTL_DIR "$GEMINI_IP_ROOT/IP/interface/GPIO/rtl/verilog"
set SHARED_RTL_DIR "$GEMINI_IP_ROOT/IP/common/lib/rtl"
set OUTPUT_DIR "results/$TOP_MODULE"

file mkdir $OUTPUT_DIR

puts "========================================================"
puts " Starting Synthesis for $TOP_MODULE"
puts " Part: $PART"
puts " RTL Dir: $RTL_DIR"
puts " Shared RTL Dir: $SHARED_RTL_DIR"
puts " Output Dir: $OUTPUT_DIR"
puts "========================================================"

# Read Source Files
read_verilog -sv "$RTL_DIR/gpio_bit.sv"
read_verilog -sv "$RTL_DIR/gpio_wrapper.sv"
read_verilog -sv "$RTL_DIR/gpio_regs.sv"

# Select Adapter based on TOP_MODULE
if { [string match "*axi*" $TOP_MODULE] } {
    read_verilog -sv "$SHARED_RTL_DIR/axi4lite_slave_adapter.sv"
} elseif { [string match "*apb*" $TOP_MODULE] } {
    read_verilog -sv "$SHARED_RTL_DIR/apb_slave_adapter.sv"
} elseif { [string match "*wb*" $TOP_MODULE] } {
    read_verilog -sv "$SHARED_RTL_DIR/wb_slave_adapter.sv"
}

read_verilog -sv "$RTL_DIR/$TOP_MODULE.sv"

# Synthesize
synth_design -top $TOP_MODULE -part $PART

# Write Checkpoints
write_checkpoint -force "$OUTPUT_DIR/${TOP_MODULE}.dcp"

# Write Report
report_utilization -file "$OUTPUT_DIR/${TOP_MODULE}_utilization.rpt"
report_timing_summary -file "$OUTPUT_DIR/${TOP_MODULE}_timing.rpt"

# Write Netlist and SDF
write_verilog -mode timesim -sdf_anno true -force "$OUTPUT_DIR/${TOP_MODULE}_netlist.v"
write_sdf -mode timesim -force "$OUTPUT_DIR/${TOP_MODULE}.sdf"

puts "========================================================"
puts " Synthesis for $TOP_MODULE Complete"
puts " Artifacts in $OUTPUT_DIR"
puts "========================================================"

exit
