
# Vivado Synthesis Script for Gemini_IP General Timer

if { $argc != 2 } {
    puts "Usage: vivado -mode batch -source run_vivado.tcl -tclargs <TOP_MODULE> <PART>"
    exit 1
}

set TOP_MODULE [lindex $argv 0]
set PART [lindex $argv 1]
set RTL_DIR "../rtl/verilog"
set OUTPUT_DIR "results/$TOP_MODULE"

file mkdir $OUTPUT_DIR

puts "========================================================"
puts " Starting Synthesis for $TOP_MODULE"
puts " Part: $PART"
puts " RTL Dir: $RTL_DIR"
puts " Output Dir: $OUTPUT_DIR"
puts "========================================================"

# Read Source Files
read_verilog -sv "$RTL_DIR/timer_regs.sv"
read_verilog -sv "$RTL_DIR/timer_core.sv"
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
