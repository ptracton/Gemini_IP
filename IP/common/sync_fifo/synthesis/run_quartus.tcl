# synthesis/run_quartus.tcl
# Quartus Synthesis Script for Sync FIFO

package require ::quartus::project
package require ::quartus::flow

if { $argc != 3 } {
    puts "Usage: quartus_sh -t run_quartus.tcl <top_module> <language> <output_dir>"
    exit 1
}

set top_module [lindex $argv 0]
set language   [lindex $argv 1]
set output_dir [lindex $argv 2]

if {![info exists ::env(GEMINI_IP_ROOT)]} {
    puts "Error: GEMINI_IP_ROOT environment variable not set."
    exit 1
}
set ip_root $::env(GEMINI_IP_ROOT)/IP/common/sync_fifo

set project_name "${top_module}_${language}"

# Create Project
if {[project_exists $project_name]} {
    project_open -revision $project_name $project_name
} else {
    project_new -revision $project_name $project_name
}

set_global_assignment -name FAMILY "Cyclone IV E"
set_global_assignment -name DEVICE "EP4CE115F29C7"
set_global_assignment -name TOP_LEVEL_ENTITY $top_module
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY $output_dir

# Add Sources based on Language
if { $language == "verilog" || $language == "sv" } {
    set_global_assignment -name SYSTEMVERILOG_FILE "$ip_root/rtl/verilog/sync_fifo.sv"
} elseif { $language == "vhdl" } {
    set_global_assignment -name VHDL_FILE "$ip_root/rtl/vhdl/sync_fifo.vhd" -hdl_version VHDL_2008
} else {
    puts "Error: Unsupported language $language"
    exit 1
}

# Synthesis
execute_flow -compile

project_close
