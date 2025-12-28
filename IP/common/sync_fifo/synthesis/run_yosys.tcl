# synthesis/run_yosys.tcl
# Yosys Synthesis Script for Sync FIFO

yosys -import

if {![info exists ::env(GEMINI_IP_ROOT)]} {
    puts "Error: GEMINI_IP_ROOT environment variable not set."
    exit 1
}
set ip_root $::env(GEMINI_IP_ROOT)/IP/common/sync_fifo

# Read Sources
read_verilog -sv "$ip_root/rtl/verilog/sync_fifo.sv"
hierarchy -check -top sync_fifo

# Synthesis
synth_xilinx -top sync_fifo

# Reports
stat
