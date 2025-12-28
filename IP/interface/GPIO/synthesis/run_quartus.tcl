
# run_quartus.tcl
# Quartus Synthesis Script for Gemini_IP GPIO

package require ::quartus::project
package require ::quartus::flow

if { ![info exists ::env(GEMINI_IP_ROOT)] } {
    puts "Error: GEMINI_IP_ROOT is not set. Please source setup.sh"
    exit 1
}

set GEMINI_IP_ROOT $::env(GEMINI_IP_ROOT)
set TOP_MODULE [lindex $argv 0]
set FAMILY "Cyclone IV GX"
set PART "EP4CGX15BF14C6"
set RTL_DIR "$GEMINI_IP_ROOT/IP/interface/GPIO/rtl/verilog"
set SHARED_RTL_DIR "$GEMINI_IP_ROOT/IP/common/lib/rtl"
set OUTPUT_DIR "results/${TOP_MODULE}_quartus"

# Create project
if {[project_exists $TOP_MODULE]} {
    project_open -revision $TOP_MODULE $TOP_MODULE
} else {
    project_new -revision $TOP_MODULE $TOP_MODULE
}

# Settings
set_global_assignment -name FAMILY $FAMILY
set_global_assignment -name DEVICE $PART
set_global_assignment -name TOP_LEVEL_ENTITY $TOP_MODULE
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY $OUTPUT_DIR

# Add Source Files
set_global_assignment -name SYSTEMVERILOG_FILE "$RTL_DIR/gpio_bit.sv"
set_global_assignment -name SYSTEMVERILOG_FILE "$RTL_DIR/gpio_wrapper.sv"
set_global_assignment -name SYSTEMVERILOG_FILE "$RTL_DIR/gpio_regs.sv"

# Select Adapter based on TOP_MODULE
if { [string match "*axi*" $TOP_MODULE] } {
    set_global_assignment -name SYSTEMVERILOG_FILE "$SHARED_RTL_DIR/axi4lite_slave_adapter.sv"
} elseif { [string match "*apb*" $TOP_MODULE] } {
    set_global_assignment -name SYSTEMVERILOG_FILE "$SHARED_RTL_DIR/apb_slave_adapter.sv"
} elseif { [string match "*wb*" $TOP_MODULE] } {
    set_global_assignment -name SYSTEMVERILOG_FILE "$SHARED_RTL_DIR/wb_slave_adapter.sv"
}

set_global_assignment -name SYSTEMVERILOG_FILE "$RTL_DIR/$TOP_MODULE.sv"

# Analysis & Synthesis
export_assignments
execute_module -tool map

# Report
puts "========================================================"
puts " Quartus Synthesis Complete for $TOP_MODULE"
puts " Artifacts in $OUTPUT_DIR"
puts "========================================================"

project_close
