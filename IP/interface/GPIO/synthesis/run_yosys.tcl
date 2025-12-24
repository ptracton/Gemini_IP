
# Yosys Synthesis Script for Gemini_IP GPIO

yosys -import

if { $argc != 1 } {
    puts "Usage: yosys -c run_yosys.tcl -- <TOP_MODULE>"
    exit 1
}

set TOP_MODULE [lindex $argv 0]
set RTL_DIR "../rtl/verilog"
set SHARED_RTL_DIR "../../../common/lib/rtl"
set OUTPUT_DIR "results/$TOP_MODULE"

# Create output dir is handled by shell script usually, but ensure here just in case?
# Tcl file mkdir works in JimTcl? Yosys Tcl is standard.
# But run_synth.sh creates the dir.

puts "========================================================"
puts " Starting Yosys Synthesis for $TOP_MODULE"
puts " RTL Dir: $RTL_DIR"
puts " Shared RTL Dir: $SHARED_RTL_DIR"
puts " Output Dir: $OUTPUT_DIR"
puts "========================================================"

# Read Source Files
read_verilog -sv $RTL_DIR/gpio_bit.sv
read_verilog -sv $RTL_DIR/gpio_wrapper.sv
read_verilog -sv $RTL_DIR/gpio_regs.sv

# Select Adapter based on TOP_MODULE
if { [string match "*axi*" $TOP_MODULE] } {
    read_verilog -sv "$SHARED_RTL_DIR/axi4lite_slave_adapter.sv"
} elseif { [string match "*apb*" $TOP_MODULE] } {
    read_verilog -sv "$SHARED_RTL_DIR/apb_slave_adapter.sv"
} elseif { [string match "*wb*" $TOP_MODULE] } {
    read_verilog -sv "$SHARED_RTL_DIR/wb_slave_adapter.sv"
}

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
