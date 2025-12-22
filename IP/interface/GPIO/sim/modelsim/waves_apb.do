
# waves_apb.do
# ModelSim wave script for APB GPIO simulation

onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider -height 32 "Testbench"
add wave -noupdate -group "Testbench" -radix hex /tb_gpio_apb/clk
add wave -noupdate -group "Testbench" -radix hex /tb_gpio_apb/rst_n
add wave -noupdate -group "Testbench" -radix hex /tb_gpio_apb/io
add wave -noupdate -group "Testbench" -radix hex /tb_gpio_apb/intr

add wave -noupdate -divider -height 32 "APB Interface"
add wave -noupdate -group "APB Interface" -radix hex /tb_gpio_apb/dut/pclk
add wave -noupdate -group "APB Interface" -radix hex /tb_gpio_apb/dut/presetn
add wave -noupdate -group "APB Interface" -radix hex /tb_gpio_apb/dut/paddr
add wave -noupdate -group "APB Interface" -radix hex /tb_gpio_apb/dut/psel
add wave -noupdate -group "APB Interface" -radix hex /tb_gpio_apb/dut/penable
add wave -noupdate -group "APB Interface" -radix hex /tb_gpio_apb/dut/pwrite
add wave -noupdate -group "APB Interface" -radix hex /tb_gpio_apb/dut/pwdata
add wave -noupdate -group "APB Interface" -radix hex /tb_gpio_apb/dut/pstrb
add wave -noupdate -group "APB Interface" -radix hex /tb_gpio_apb/dut/pready
add wave -noupdate -group "APB Interface" -radix hex /tb_gpio_apb/dut/prdata
add wave -noupdate -group "APB Interface" -radix hex /tb_gpio_apb/dut/pslverr

add wave -noupdate -divider -height 32 "Register Block"
add wave -noupdate -group "Register Block" -radix hex /tb_gpio_apb/dut/u_gpio_regs/reg_data_o
add wave -noupdate -group "Register Block" -radix hex /tb_gpio_apb/dut/u_gpio_regs/reg_dir
add wave -noupdate -group "Register Block" -radix hex /tb_gpio_apb/dut/u_gpio_regs/gpio_i
add wave -noupdate -group "Register Block" -radix hex /tb_gpio_apb/dut/u_gpio_regs/intr
add wave -noupdate -group "Register Block" -radix hex /tb_gpio_apb/dut/u_gpio_regs/s_reg_int_en
add wave -noupdate -group "Register Block" -radix hex /tb_gpio_apb/dut/u_gpio_regs/s_reg_int_sts

add wave -noupdate -divider -height 32 "GPIO Wrapper"
add wave -noupdate -group "GPIO Wrapper" -radix hex /tb_gpio_apb/dut/u_gpio_wrapper/oe
add wave -noupdate -group "GPIO Wrapper" -radix hex /tb_gpio_apb/dut/u_gpio_wrapper/o
add wave -noupdate -group "GPIO Wrapper" -radix hex /tb_gpio_apb/dut/u_gpio_wrapper/i

add wave -noupdate -divider -height 32 "GPIO Bits (Bit 0)"
add wave -noupdate -group "GPIO Bit 0" -radix hex /tb_gpio_apb/dut/u_gpio_wrapper/gen_gpio_bits(0)/u_gpio_bit/clk
add wave -noupdate -group "GPIO Bit 0" -radix hex /tb_gpio_apb/dut/u_gpio_wrapper/gen_gpio_bits(0)/u_gpio_bit/reset_n
add wave -noupdate -group "GPIO Bit 0" -radix hex /tb_gpio_apb/dut/u_gpio_wrapper/gen_gpio_bits(0)/u_gpio_bit/o
add wave -noupdate -group "GPIO Bit 0" -radix hex /tb_gpio_apb/dut/u_gpio_wrapper/gen_gpio_bits(0)/u_gpio_bit/oe
add wave -noupdate -group "GPIO Bit 0" -radix hex /tb_gpio_apb/dut/u_gpio_wrapper/gen_gpio_bits(0)/u_gpio_bit/i
add wave -noupdate -group "GPIO Bit 0" -radix hex /tb_gpio_apb/dut/u_gpio_wrapper/gen_gpio_bits(0)/u_gpio_bit/open_drain
add wave -noupdate -group "GPIO Bit 0" -radix hex /tb_gpio_apb/dut/u_gpio_wrapper/gen_gpio_bits(0)/u_gpio_bit/pull_up_en
add wave -noupdate -group "GPIO Bit 0" -radix hex /tb_gpio_apb/dut/u_gpio_wrapper/gen_gpio_bits(0)/u_gpio_bit/pull_down_en
add wave -noupdate -group "GPIO Bit 0" -radix hex /tb_gpio_apb/dut/u_gpio_wrapper/gen_gpio_bits(0)/u_gpio_bit/pad

# Format Clocks
property wave -color "Cyan" /tb_gpio_apb/clk
property wave -color "Cyan" /tb_gpio_apb/dut/pclk
property wave -color "Cyan" /tb_gpio_apb/dut/u_gpio_wrapper/gen_gpio_bits(0)/u_gpio_bit/clk

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 250
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {100 ns}
