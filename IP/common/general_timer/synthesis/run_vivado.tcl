
# Vivado Synthesis Script for Gemini_IP General Timer

if { $argc != 3 } {
    puts "Usage: vivado -mode batch -source run_vivado.tcl -tclargs <TOP_MODULE> <PART> <OUTPUT_DIR>"
    exit 1
}

set TOP_MODULE [lindex $argv 0]
set PART [lindex $argv 1]
set OUTPUT_DIR [lindex $argv 2]
set SHARED_RTL_DIR "../../lib/rtl"
set VERILOG_RTL_DIR "../rtl/verilog"
set VHDL_RTL_DIR "../rtl/vhdl"

puts "========================================================"
puts " Starting Synthesis for $TOP_MODULE"
puts " Part: $PART"
puts " Verilog RTL Dir: $VERILOG_RTL_DIR"
puts " VHDL RTL Dir: $VHDL_RTL_DIR"
puts " Shared RTL Dir: $SHARED_RTL_DIR"
puts " Output Dir: $OUTPUT_DIR"
puts "========================================================"

# Determine if this is VHDL or SV based on file existence
if { [file exists "$VERILOG_RTL_DIR/$TOP_MODULE.sv"] } {
    puts "Detected SystemVerilog Design"
    read_verilog -sv "$VERILOG_RTL_DIR/timer_regs.sv"
    read_verilog -sv "$VERILOG_RTL_DIR/timer_core.sv"
    read_verilog -sv "$VERILOG_RTL_DIR/$TOP_MODULE.sv"
    
    # Read Shared Adapters
    if { [string match "*_axi" $TOP_MODULE] } {
        read_verilog -sv "$SHARED_RTL_DIR/axi4lite_slave_adapter.sv"
    } elseif { [string match "*_apb" $TOP_MODULE] } {
        read_verilog -sv "$SHARED_RTL_DIR/apb_slave_adapter.sv"
    } elseif { [string match "*_wb" $TOP_MODULE] } {
        read_verilog -sv "$SHARED_RTL_DIR/wb_slave_adapter.sv"
    }
} elseif { [file exists "$VHDL_RTL_DIR/$TOP_MODULE.vhd"] } {
    puts "Detected VHDL Design"
    read_vhdl -vhdl2008 "$VHDL_RTL_DIR/timer_regs.vhd"
    read_vhdl -vhdl2008 "$VHDL_RTL_DIR/timer_core.vhd"
    read_vhdl -vhdl2008 "$VHDL_RTL_DIR/$TOP_MODULE.vhd"
    
    # Read Shared Adapters
    if { [string match "*_axi" $TOP_MODULE] } {
        read_vhdl -vhdl2008 "$SHARED_RTL_DIR/axi4lite_slave_adapter.vhd"
    } elseif { [string match "*_apb" $TOP_MODULE] } {
        read_vhdl -vhdl2008 "$SHARED_RTL_DIR/apb_slave_adapter.vhd"
    } elseif { [string match "*_wb" $TOP_MODULE] } {
        read_vhdl -vhdl2008 "$SHARED_RTL_DIR/wb_slave_adapter.vhd"
    }
} else {
    puts "Error: Could not find source for $TOP_MODULE"
    exit 1
}

# Synthesize
synth_design -top $TOP_MODULE -part $PART

# Write Checkpoints
write_checkpoint -force "$OUTPUT_DIR/${TOP_MODULE}.dcp"

# Write Report
report_utilization -file "$OUTPUT_DIR/${TOP_MODULE}_utilization.rpt"
report_timing_summary -file "$OUTPUT_DIR/${TOP_MODULE}_timing.rpt"

# Write Netlist and SDF
write_verilog -mode timesim -sdf_anno true -force "$OUTPUT_DIR/${TOP_MODULE}_netlist.v"
write_sdf -mode timesim -force "$OUTPUT_DIR/${TOP_MODULE}.sdf"

puts "========================================================"
puts " Synthesis for $TOP_MODULE Complete"
puts " Artifacts in $OUTPUT_DIR"
puts "========================================================"

exit
