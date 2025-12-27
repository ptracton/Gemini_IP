
# Yosys Synthesis Script for Gemini_IP Bus Matrix

yosys -import

if { $argc != 2 } {
    puts "Usage: yosys -c run_yosys.tcl -- <TOP_MODULE> <OUTPUT_DIR>"
    exit 1
}

set TOP_MODULE [lindex $argv 0]
set OUTPUT_DIR [lindex $argv 1]
set SHARED_RTL_DIR "../../lib/rtl"
set RTL_DIR "../rtl/verilog"

puts "========================================================"
puts " Starting Yosys Synthesis for $TOP_MODULE"
puts " RTL Dir: $RTL_DIR"
puts " Shared RTL Dir: $SHARED_RTL_DIR"
puts " Output Dir: $OUTPUT_DIR"
puts "========================================================"

# Read Source Files
read_verilog -sv $RTL_DIR/bus_matrix_pkg.sv

if { [string match "bus_matrix_*" $TOP_MODULE] } {
    read_verilog -sv $RTL_DIR/bus_matrix_decoder.sv
    read_verilog -sv $RTL_DIR/bus_matrix_arbiter.sv
    read_verilog -sv $RTL_DIR/bus_matrix_register_slice.sv
}

read_verilog -sv $RTL_DIR/$TOP_MODULE.sv

# Read Shared Adapters
if { [string match "ahb_apb_bridge" $TOP_MODULE] } {
     # Bridge specific logic
}

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
