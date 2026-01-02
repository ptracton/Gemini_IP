# run_quartus.tcl
# Intel Quartus Synthesis Script for UART

if { $argc < 2 } {
    puts "Error: Target design and output directory not specified."
    exit 1
}

set target_design [lindex $argv 0]
set output_dir    [lindex $argv 1]
set ip_root       $env(GEMINI_IP_ROOT)

project_new -overwrite ${target_design}

set_global_assignment -name FAMILY "Cyclone V"
set_global_assignment -name DEVICE 5CGXFC7C7F23C8

# Source files
if { [string match "*_vhd" $target_design] } {
    set base_design [string map {"_vhd" ""} $target_design]
    set_global_assignment -name VHDL_INPUT_VERSION VHDL_2008
    set_global_assignment -name VHDL_FILE $ip_root/IP/interface/UART/rtl/vhdl/uart_core.vhd
    set_global_assignment -name VHDL_FILE $ip_root/IP/interface/UART/rtl/vhdl/${base_design}.vhd
    set top_module $base_design
    if { [string match "uart_axi" $base_design] } {
        set_global_assignment -name VHDL_FILE $ip_root/IP/common/lib/rtl/axi4lite_slave_adapter.vhd
    } elseif { [string match "uart_apb" $base_design] } {
        set_global_assignment -name VHDL_FILE $ip_root/IP/common/lib/rtl/apb_slave_adapter.vhd
    } elseif { [string match "uart_wb" $base_design] } {
        set_global_assignment -name VHDL_FILE $ip_root/IP/common/lib/rtl/wb_slave_adapter.vhd
    }
} else {
    set_global_assignment -name SYSTEMVERILOG_FILE $ip_root/IP/common/sync_fifo/rtl/verilog/sync_fifo.sv
    set_global_assignment -name SYSTEMVERILOG_FILE $ip_root/IP/interface/UART/rtl/verilog/uart_core.sv
    set_global_assignment -name SYSTEMVERILOG_FILE $ip_root/IP/interface/UART/rtl/verilog/${target_design}.sv
    set top_module $target_design
    if { [string match "uart_axi" $target_design] } {
        set_global_assignment -name SYSTEMVERILOG_FILE $ip_root/IP/common/lib/rtl/axi4lite_slave_adapter.sv
    } elseif { [string match "uart_apb" $target_design] } {
        set_global_assignment -name SYSTEMVERILOG_FILE $ip_root/IP/common/lib/rtl/apb_slave_adapter.sv
    } elseif { [string match "uart_wb" $target_design] } {
        set_global_assignment -name SYSTEMVERILOG_FILE $ip_root/IP/common/lib/rtl/wb_slave_adapter.sv
    }
}

set_global_assignment -name TOP_LEVEL_ENTITY $top_module

load_package flow
execute_module -tool map

# Extract utilization
set report_file [open "${output_dir}/${target_design}_utilization.rpt" w]
# Simplistic extraction logic could go here
close $report_file

project_close
exit
