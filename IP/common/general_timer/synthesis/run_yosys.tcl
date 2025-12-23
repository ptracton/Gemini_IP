
# Yosys Synthesis Script for Gemini_IP General Timer

yosys -import

if { $argc != 1 } {
    puts "Usage: yosys -c run_yosys.tcl -- <TOP_MODULE>"
    exit 1
}

set TOP_MODULE [lindex $argv 0]
set RTL_DIR "../rtl/verilog"
set OUTPUT_DIR "results/$TOP_MODULE"

puts "========================================================"
puts " Starting Yosys Synthesis for $TOP_MODULE"
puts " RTL Dir: $RTL_DIR"
puts " Output Dir: $OUTPUT_DIR"
puts "========================================================"

# Read Source Files
read_verilog -sv $RTL_DIR/timer_regs.sv
read_verilog -sv $RTL_DIR/timer_core.sv
read_verilog -sv $RTL_DIR/$TOP_MODULE.sv

# Check Hierarchy
hierarchy -top $TOP_MODULE

# Synthesize for Xilinx (Generic 7-series)
synth_xilinx -top $TOP_MODULE -family xc7

# Write Netlist
write_verilog -noattr $OUTPUT_DIR/${TOP_MODULE}_yosys_netlist.v

# Print Statistics
stat

puts "========================================================"
puts " Yosys Synthesis for $TOP_MODULE Complete"
puts "========================================================"
