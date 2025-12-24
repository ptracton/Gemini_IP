
# Environment Setup
# Assumes script is run from sim/modelsim/
set GT_DIR "../.."
set RTL_DIR "$GT_DIR/rtl/vhdl"
set TB_DIR "$GT_DIR/tb"

# Create library if it doesn't exist
if {[file exists work] == 0} {
    vlib work
}

# Compile RTL (VHDL 2008)
vcom -2008 -work work $RTL_DIR/bus_matrix_regs.vhd
vcom -2008 -work work $RTL_DIR/bus_matrix_core.vhd
vcom -2008 -work work $RTL_DIR/bus_matrix_apb.vhd
vcom -2008 -work work $RTL_DIR/bus_matrix_axi.vhd
vcom -2008 -work work $RTL_DIR/bus_matrix_wb.vhd

# Compile Testbenches
vcom -2008 -work work $TB_DIR/tb_bus_matrix_core.vhd
vcom -2008 -work work $TB_DIR/tb_bus_matrix_apb.vhd
vcom -2008 -work work $TB_DIR/tb_bus_matrix_axi.vhd
vcom -2008 -work work $TB_DIR/tb_bus_matrix_wb.vhd

# Helper to format waves
proc format_waves {dut_path} {
    # Set default radix to hex
    radix -hex

    # Add TB signals
    if {[catch {
        set tb_sigs [find signals *]
        foreach sig $tb_sigs {
            # Use file tail to match signal name regardless of path
            if {[lsearch {clk pclk aclk wb_clk_i} [file tail $sig]] != -1} {
                add wave -noupdate -group TB -radix hex -color cyan $sig
            } else {
                add wave -noupdate -group TB -radix hex $sig
            }
        }
    } err]} {
        puts "Error adding TB signals: $err"
    }
    
    # Add DUT signals
    if {[catch {
        set dut_sigs [find signals $dut_path/*]
        foreach sig $dut_sigs {
            if {[lsearch {clk pclk aclk wb_clk_i} [file tail $sig]] != -1} {
                add wave -noupdate -group DUT -radix hex -color cyan $sig
            } else {
                add wave -noupdate -group DUT -radix hex $sig
            }
        }
    } err]} {
        puts "Error adding DUT signals: $err"
    }
    
    configure wave -signalnamewidth 1
    wave zoom full
}

# Simulation Procedures
proc sim_core {} {
    catch {quit -sim}
    vsim -voptargs="+acc" work.tb_bus_matrix_core
    format_waves "/tb_bus_matrix_core/dut"
    run 100 us
}

proc sim_apb {} {
    catch {quit -sim}
    vsim -voptargs="+acc" work.tb_bus_matrix_apb
    format_waves "/tb_bus_matrix_apb/dut"
    run 100 us
}

proc sim_axi {} {
    catch {quit -sim}
    vsim -voptargs="+acc" work.tb_bus_matrix_axi
    format_waves "/tb_bus_matrix_axi/dut"
    run 100 us
}

proc sim_wb {} {
    catch {quit -sim}
    vsim -voptargs="+acc" work.tb_bus_matrix_wb
    format_waves "/tb_bus_matrix_wb/dut"
    run 100 us
}

puts "----------------------------------------------------------------"
puts "VHDL Compilation Complete."
puts "Ready to simulate."
puts "Type 'sim_core', 'sim_apb', 'sim_axi', or 'sim_wb' to run tests."
puts "----------------------------------------------------------------"

if { [info exists 1] } {
    set test_name "$1"
    puts "Argument provided: $test_name"
    
    if { $test_name == "core" } {
        sim_core
    } elseif { $test_name == "apb" } {
        sim_apb
    } elseif { $test_name == "axi" } {
        sim_axi
    } elseif { $test_name == "wb" } {
        sim_wb
    } else {
        puts "Error: Unknown test '$test_name'. Available: core, apb, axi, wb"
    }
}
