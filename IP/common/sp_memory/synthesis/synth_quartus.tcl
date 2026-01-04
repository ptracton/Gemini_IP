# Quartus Synthesis Script for sp_memory IP
# Usage: quartus_sh -t synth_quartus.tcl <BUS_TYPE> <WIDTH> <DEPTH> <LANG> <TECHNOLOGY>

set BUS_TYPE [lindex $argv 0]
set WIDTH [lindex $argv 1]
set DEPTH [lindex $argv 2]
set LANG [lindex $argv 3]
set TECHNOLOGY [lindex $argv 4]

project_new sp_memory_synth -overwrite
load_package flow


set_global_assignment -name FAMILY "Cyclone IV E"
set_global_assignment -name DEVICE auto
set SCRIPT_DIR [file dirname [info script]]
set RTL_DIR [file normalize [file join $SCRIPT_DIR ".." "rtl"]]

# set_global_assignment -name TOP_LEVEL_ENTITY ""

# Determine Top Module and Files
set TOP_MODULE ""
if { $BUS_TYPE == "native" } {
    set TOP_MODULE "sp_memory"
} elseif { $BUS_TYPE == "axi" } {
    set TOP_MODULE "sp_memory_axi"
} elseif { $BUS_TYPE == "apb" } {
    set TOP_MODULE "sp_memory_apb"
} elseif { $BUS_TYPE == "ahb" } {
    set TOP_MODULE "sp_memory_ahb"
} elseif { $BUS_TYPE == "wb" } {
    set TOP_MODULE "sp_memory_wb"
}

set_global_assignment -name TOP_LEVEL_ENTITY $TOP_MODULE

if { $LANG == "verilog" || $LANG == "sv" } {
    set_global_assignment -name SYSTEMVERILOG_FILE $RTL_DIR/verilog/sp_memory.sv
    if { $TOP_MODULE != "sp_memory" } {
        set_global_assignment -name SYSTEMVERILOG_FILE $RTL_DIR/verilog/${TOP_MODULE}.sv
    }

} elseif { $LANG == "vhdl" } {
    set_global_assignment -name VHDL_FILE $RTL_DIR/vhdl/sp_memory.vhd
    set_global_assignment -name VHDL_INPUT_VERSION VHDL_2008
    if { $TOP_MODULE != "sp_memory" } {
        set_global_assignment -name VHDL_FILE $RTL_DIR/vhdl/${TOP_MODULE}.vhd
    }
}

# Parameters
set_parameter -name WIDTH $WIDTH
set_parameter -name DEPTH $DEPTH
set_parameter -name TECHNOLOGY $TECHNOLOGY

# Synthesis
execute_module -tool map
# execute_module -tool fit # Optional, map is enough for synthesis check

project_close
