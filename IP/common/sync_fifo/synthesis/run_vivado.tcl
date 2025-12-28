# synthesis/run_vivado.tcl
# Vivado Synthesis Script for Sync FIFO

if { $argc != 4 } {
    puts "Usage: vivado -mode batch -source run_vivado.tcl -tclargs <top_module> <language> <part> <output_dir>"
    exit 1
}

set top_module [lindex $argv 0]
set language   [lindex $argv 1]
set part       [lindex $argv 2]
set output_dir [lindex $argv 3]

file mkdir $output_dir

# Check environment
if {![info exists ::env(GEMINI_IP_ROOT)]} {
    puts "Error: GEMINI_IP_ROOT environment variable not set."
    exit 1
}
set ip_root $::env(GEMINI_IP_ROOT)/IP/common/sync_fifo
set lib_root $::env(GEMINI_IP_ROOT)/IP/common/lib/rtl

# Set up project (in memory)
create_project -in_memory -part $part

# Add Sources based on Language
if { $language == "verilog" || $language == "sv" } {
    read_verilog -sv "$ip_root/rtl/verilog/sync_fifo.sv"
    if { $top_module != "sync_fifo" } {
        set adapter_type [regsub "sync_fifo_" $top_module ""]
        if { $adapter_type == "axi" } { set adapter_type "axi4lite" }
        read_verilog -sv "$lib_root/${adapter_type}_slave_adapter.sv"
        read_verilog -sv "$ip_root/rtl/verilog/${top_module}.sv"
    }
} elseif { $language == "vhdl" } {
    read_vhdl -vhdl2008 "$ip_root/rtl/vhdl/sync_fifo.vhd"
    if { $top_module != "sync_fifo" } {
        set adapter_type [regsub "sync_fifo_" $top_module ""]
        if { $adapter_type == "axi" } { set adapter_type "axi4lite" }
        read_vhdl -vhdl2008 "$lib_root/${adapter_type}_slave_adapter.vhd"
        read_vhdl -vhdl2008 "$ip_root/rtl/vhdl/${top_module}.vhd"
    }
}

# Synthesis
synth_design -top $top_module -part $part

# Reports
report_utilization -file $output_dir/${top_module}_${language}_utilization.rpt
report_timing_summary -file $output_dir/${top_module}_${language}_timing.rpt

# Checkpoints
write_checkpoint -force $output_dir/${top_module}_${language}.dcp
