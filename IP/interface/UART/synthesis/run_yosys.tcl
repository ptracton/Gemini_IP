# run_yosys.tcl
# Yosys Synthesis Script for UART

set target_design $::env(TOP_MODULE)
set output_dir    $::env(OUTPUT_DIR)
set ip_root       $::env(GEMINI_IP_ROOT)

if { [string match "*_vhd" $target_design] } {
    # VHDL synthesis with GHDL plugin
    set base_design [string map {"_vhd" ""} $target_design]
    set vhdl_files "$ip_root/IP/interface/UART/rtl/vhdl/uart_core.vhd"
    if { [string match "uart_axi" $base_design] } {
        append vhdl_files " $ip_root/IP/common/lib/rtl/axi4lite_slave_adapter.vhd"
    } elseif { [string match "uart_apb" $base_design] } {
        append vhdl_files " $ip_root/IP/common/lib/rtl/apb_slave_adapter.vhd"
    } elseif { [string match "uart_wb" $base_design] } {
        append vhdl_files " $ip_root/IP/common/lib/rtl/wb_slave_adapter.vhd"
    }
    append vhdl_files " $ip_root/IP/interface/UART/rtl/vhdl/${base_design}.vhd"
    
    yosys ghdl --std=08 {*}$vhdl_files -e ${base_design}
} else {
    yosys read_verilog -sv $ip_root/IP/common/sync_fifo/rtl/verilog/sync_fifo.sv
    yosys read_verilog -sv $ip_root/IP/interface/UART/rtl/verilog/uart_core.sv
    if { [string match "uart_axi" $target_design] } {
        yosys read_verilog -sv $ip_root/IP/common/lib/rtl/axi4lite_slave_adapter.sv
    } elseif { [string match "uart_apb" $target_design] } {
        yosys read_verilog -sv $ip_root/IP/common/lib/rtl/apb_slave_adapter.sv
    } elseif { [string match "uart_wb" $target_design] } {
        yosys read_verilog -sv $ip_root/IP/common/lib/rtl/wb_slave_adapter.sv
    }
    yosys read_verilog -sv $ip_root/IP/interface/UART/rtl/verilog/${target_design}.sv
    yosys hierarchy -top ${target_design}
}

yosys proc
yosys opt
yosys fsm
yosys opt
yosys synth_ice40
yosys write_verilog ${output_dir}/${target_design}_netlist.v
yosys stat
