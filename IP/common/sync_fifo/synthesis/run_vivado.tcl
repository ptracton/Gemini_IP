# synthesis/run_vivado.tcl
# Vivado Synthesis Script for Sync FIFO

if { $argc != 3 } {
    puts "Usage: vivado -mode batch -source run_vivado.tcl -tclargs <top_module> <part> <output_dir>"
    exit 1
}

set top_module [lindex $argv 0]
set part [lindex $argv 1]
set output_dir [lindex $argv 2]

file mkdir $output_dir

# Check environment
if {![info exists ::env(GEMINI_IP_ROOT)]} {
    puts "Error: GEMINI_IP_ROOT environment variable not set."
    exit 1
}
set ip_root $::env(GEMINI_IP_ROOT)/IP/common/sync_fifo

# Set up project (in memory)
create_project -in_memory -part $part

# Add Sources
read_verilog -sv "$ip_root/rtl/verilog/sync_fifo.sv"
read_vhdl -vhdl2008 "$ip_root/rtl/vhdl/sync_fifo.vhd"

# Synthesis
synth_design -top $top_module -part $part

# Reports
report_utilization -file $output_dir/${top_module}_utilization.rpt
report_timing_summary -file $output_dir/${top_module}_timing.rpt

# Checkpoints
write_checkpoint -force $output_dir/${top_module}.dcp
