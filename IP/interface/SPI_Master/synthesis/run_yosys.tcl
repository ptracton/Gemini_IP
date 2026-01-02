# run_yosys.tcl
# Yosys Synthesis Script for SPI Master

set target_design $::env(TOP_MODULE)
set output_dir    $::env(OUTPUT_DIR)
set ip_root       $::env(GEMINI_IP_ROOT)

if { [string match "*_vhd" $target_design] } {
    # VHDL synthesis with GHDL plugin
    set base_design [string map {"_vhd" ""} $target_design]
    set vhdl_files "$ip_root/IP/interface/SPI_Master/rtl/vhdl/spi_master_core.vhd $ip_root/IP/interface/SPI_Master/rtl/vhdl/spi_master_registers.vhd"
    if { [string match "spi_master_axi" $base_design] } {
        append vhdl_files " $ip_root/IP/common/lib/rtl/axi4lite_slave_adapter.vhd"
    } elseif { [string match "spi_master_apb" $base_design] } {
        append vhdl_files " $ip_root/IP/common/lib/rtl/apb_slave_adapter.vhd"
    } elseif { [string match "spi_master_wb" $base_design] } {
        append vhdl_files " $ip_root/IP/common/lib/rtl/wb_slave_adapter.vhd"
    }
    append vhdl_files " $ip_root/IP/interface/SPI_Master/rtl/vhdl/${base_design}.vhd"
    
    yosys ghdl --std=08 {*}$vhdl_files -e ${base_design}
} else {
    yosys read_verilog -sv $ip_root/IP/common/sync_fifo/rtl/verilog/sync_fifo.sv
    yosys read_verilog -sv $ip_root/IP/interface/SPI_Master/rtl/verilog/spi_master_core.sv
    yosys read_verilog -sv $ip_root/IP/interface/SPI_Master/rtl/verilog/spi_master_registers.sv
    if { [string match "spi_master_axi" $target_design] } {
        yosys read_verilog -sv $ip_root/IP/common/lib/rtl/axi4lite_slave_adapter.sv
    } elseif { [string match "spi_master_apb" $target_design] } {
        yosys read_verilog -sv $ip_root/IP/common/lib/rtl/apb_slave_adapter.sv
    } elseif { [string match "spi_master_wb" $target_design] } {
        yosys read_verilog -sv $ip_root/IP/common/lib/rtl/wb_slave_adapter.sv
    }
    yosys read_verilog -sv $ip_root/IP/interface/SPI_Master/rtl/verilog/${target_design}.sv
    yosys hierarchy -top ${target_design}
}

yosys proc
yosys opt
yosys fsm
yosys opt
yosys synth_ice40
yosys write_verilog ${output_dir}/${target_design}_netlist.v
yosys stat
