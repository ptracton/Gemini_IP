
# run_quartus.tcl
# Quartus Synthesis Script for General Timer IP

package require ::quartus::project
package require ::quartus::flow

set TOP_MODULE [lindex $argv 0]
set FAMILY "Cyclone IV GX"
set PART "EP4CGX15BF14C6"
set RTL_DIR "../rtl/verilog"
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
set_global_assignment -name SYSTEMVERILOG_FILE "$RTL_DIR/timer_regs.sv"
set_global_assignment -name SYSTEMVERILOG_FILE "$RTL_DIR/timer_core.sv"
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
