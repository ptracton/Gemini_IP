
# run_quartus.tcl
# Quartus Synthesis Script for Bus Matrix IP

package require ::quartus::project
package require ::quartus::flow

set TOP_MODULE [lindex $argv 0]
set OUTPUT_DIR [lindex $argv 1]
set FAMILY "Cyclone IV GX"
set PART "EP4CGX15BF14C6"
set SHARED_RTL_DIR "../../lib/rtl"
set VERILOG_RTL_DIR "../rtl/verilog"
set VHDL_RTL_DIR "../rtl/vhdl"

# Determine if this is VHDL or SV based on file existence
if { [file exists "$VERILOG_RTL_DIR/$TOP_MODULE.sv"] } {
    set LANG "SV"
} elseif { [file exists "$VHDL_RTL_DIR/$TOP_MODULE.vhd"] } {
    set LANG "VHDL"
} else {
    puts "Error: Could not find source for $TOP_MODULE"
    exit 1
}

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
if { $LANG == "SV" } {
    set_global_assignment -name SYSTEMVERILOG_FILE "$VERILOG_RTL_DIR/bus_matrix_regs.sv"
    set_global_assignment -name SYSTEMVERILOG_FILE "$VERILOG_RTL_DIR/bus_matrix_core.sv"
    set_global_assignment -name SYSTEMVERILOG_FILE "$VERILOG_RTL_DIR/$TOP_MODULE.sv"
    
    # Read Shared Adapters
    if { [string match "*_axi" $TOP_MODULE] } {
        set_global_assignment -name SYSTEMVERILOG_FILE "$SHARED_RTL_DIR/axi4lite_slave_adapter.sv"
    } elseif { [string match "*_apb" $TOP_MODULE] } {
        set_global_assignment -name SYSTEMVERILOG_FILE "$SHARED_RTL_DIR/apb_slave_adapter.sv"
    } elseif { [string match "*_wb" $TOP_MODULE] } {
        set_global_assignment -name SYSTEMVERILOG_FILE "$SHARED_RTL_DIR/wb_slave_adapter.sv"
    }
} else {
    set_global_assignment -name VHDL_FILE "$VHDL_RTL_DIR/bus_matrix_regs.vhd"
    set_global_assignment -name VHDL_FILE "$VHDL_RTL_DIR/bus_matrix_core.vhd"
    set_global_assignment -name VHDL_FILE "$VHDL_RTL_DIR/$TOP_MODULE.vhd"
    
    # Read Shared Adapters
    if { [string match "*_axi" $TOP_MODULE] } {
        set_global_assignment -name VHDL_FILE "$SHARED_RTL_DIR/axi4lite_slave_adapter.vhd"
    } elseif { [string match "*_apb" $TOP_MODULE] } {
        set_global_assignment -name VHDL_FILE "$SHARED_RTL_DIR/apb_slave_adapter.vhd"
    } elseif { [string match "*_wb" $TOP_MODULE] } {
        set_global_assignment -name VHDL_FILE "$SHARED_RTL_DIR/wb_slave_adapter.vhd"
    }
}

# Analysis & Synthesis
export_assignments
execute_module -tool map

# Report
puts "========================================================"
puts " Quartus Synthesis Complete for $TOP_MODULE"
puts " Artifacts in $OUTPUT_DIR"
puts "========================================================"

project_close
