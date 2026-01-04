# Vivado Synthesis Script for sp_memory IP
# Usage: vivado -mode batch -source synth_vivado.tcl -tclargs <BUS_TYPE> <WIDTH> <DEPTH> <LANG> <TECHNOLOGY>

if { $argc != 5 } {
    puts "Error: Incorrect number of arguments."
    puts "Usage: vivado -mode batch -source synth_vivado.tcl -tclargs <BUS_TYPE> <WIDTH> <DEPTH> <LANG> <TECHNOLOGY>"
    exit 1
}

set BUS_TYPE [lindex $argv 0]
set WIDTH [lindex $argv 1]
set DEPTH [lindex $argv 2]
set LANG [lindex $argv 3]
set TECHNOLOGY [lindex $argv 4]

set PART "xc7k70tfbg676-1"
set TOP_MODULE ""

# Determine Top Module and Files
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
} else {
    puts "Error: Unknown BUS_TYPE $BUS_TYPE"
    exit 1
}

create_project -in_memory -part $PART

# Read Sources
# Read Sources
if { $LANG == "verilog" || $LANG == "sv" } {
    read_verilog -sv ../../rtl/verilog/sp_memory.sv
    if { $TOP_MODULE != "sp_memory" } {
        read_verilog -sv ../../rtl/verilog/${TOP_MODULE}.sv
    }
} elseif { $LANG == "vhdl" } {
    read_vhdl -vhdl2008 ../../rtl/vhdl/sp_memory.vhd
    if { $TOP_MODULE != "sp_memory" } {
        read_vhdl -vhdl2008 ../../rtl/vhdl/${TOP_MODULE}.vhd
    }
} else {
    puts "Error: Unknown LANG $LANG"
    exit 1
}

# Synthesis
synth_design -top $TOP_MODULE -part $PART -mode out_of_context \
    -generic WIDTH=$WIDTH \
    -generic DEPTH=$DEPTH \
    -generic TECHNOLOGY=$TECHNOLOGY

# Reports
report_utilization -file util.rpt
report_ram_utilization -file ram_util.rpt

puts "Synthesis Complete."
exit 0
