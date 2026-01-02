# run_vivado.tcl
# Xilinx Vivado Synthesis Script for UART

if { $argc < 2 } {
    puts "Error: Target design and output directory not specified."
    exit 1
}

set target_design [lindex $argv 0]
set output_dir    [lindex $argv 1]
set ip_root       $env(GEMINI_IP_ROOT)

create_project -in_memory -part xc7a35tcpg236-1

# Source files
if { [string match "*_vhd" $target_design] } {
    set base_design [string map {"_vhd" ""} $target_design]
    read_vhdl -vhdl2008 $ip_root/IP/interface/UART/rtl/vhdl/uart_core.vhd
    read_vhdl -vhdl2008 $ip_root/IP/interface/UART/rtl/vhdl/${base_design}.vhd
    set top_module $base_design
    if { [string match "uart_axi" $base_design] } {
        read_vhdl -vhdl2008 $ip_root/IP/common/lib/rtl/axi4lite_slave_adapter.vhd
    } elseif { [string match "uart_apb" $base_design] } {
        read_vhdl -vhdl2008 $ip_root/IP/common/lib/rtl/apb_slave_adapter.vhd
    } elseif { [string match "uart_wb" $base_design] } {
        read_vhdl -vhdl2008 $ip_root/IP/common/lib/rtl/wb_slave_adapter.vhd
    }
} else {
    read_verilog -sv $ip_root/IP/common/sync_fifo/rtl/verilog/sync_fifo.sv
    read_verilog -sv $ip_root/IP/interface/UART/rtl/verilog/uart_core.sv
    read_verilog -sv $ip_root/IP/interface/UART/rtl/verilog/${target_design}.sv
    set top_module $target_design
    if { [string match "uart_axi" $target_design] } {
        read_verilog -sv $ip_root/IP/common/lib/rtl/axi4lite_slave_adapter.sv
    } elseif { [string match "uart_apb" $target_design] } {
        read_verilog -sv $ip_root/IP/common/lib/rtl/apb_slave_adapter.sv
    } elseif { [string match "uart_wb" $target_design] } {
        read_verilog -sv $ip_root/IP/common/lib/rtl/wb_slave_adapter.sv
    }
}

synth_design -top $top_module -part xc7a35tcpg236-1

report_utilization -file ${output_dir}/${target_design}_utilization.rpt
report_timing -file ${output_dir}/${target_design}_timing.rpt

exit
