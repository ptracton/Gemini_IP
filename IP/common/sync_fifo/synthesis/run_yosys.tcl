# synthesis/run_yosys.tcl
# Yosys Synthesis Script for Sync FIFO

yosys -import

if {![info exists ::env(GEMINI_IP_ROOT)]} {
    puts "Error: GEMINI_IP_ROOT environment variable not set."
    exit 1
}

# Yosys scripts run with -c don't have argv easily available in some versions.
# We'll use environment variables for robustness.
set top_module $::env(TOP_MODULE)
# set output_dir $::env(OUTPUT_DIR)

set ip_root $::env(GEMINI_IP_ROOT)/IP/common/sync_fifo
set lib_root $::env(GEMINI_IP_ROOT)/IP/common/lib/rtl

# Read Sources
read_verilog -sv "$ip_root/rtl/verilog/sync_fifo.sv"
if { $top_module != "sync_fifo" } {
    set adapter_type [regsub "sync_fifo_" $top_module ""]
    if { $adapter_type == "axi" } { set adapter_type "axi4lite" }
    read_verilog -sv "$lib_root/${adapter_type}_slave_adapter.sv"
    read_verilog -sv "$ip_root/rtl/verilog/${top_module}.sv"
}

hierarchy -check -top $top_module

# Synthesis
synth_xilinx -top $top_module

# Reports
stat
