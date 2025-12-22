
# waves_axi.do
# ModelSim wave script for AXI GPIO simulation

onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider -height 32 "Testbench"
add wave -noupdate -group "Testbench" -radix hex /tb_gpio_axi/clk
add wave -noupdate -group "Testbench" -radix hex /tb_gpio_axi/rst_n
add wave -noupdate -group "Testbench" -radix hex /tb_gpio_axi/io
add wave -noupdate -group "Testbench" -radix hex /tb_gpio_axi/intr

add wave -noupdate -divider -height 32 "AXI Interface"
add wave -noupdate -group "AXI Interface" -radix hex /tb_gpio_axi/dut/s_axi_aclk
add wave -noupdate -group "AXI Interface" -radix hex /tb_gpio_axi/dut/s_axi_aresetn
add wave -noupdate -group "AXI Interface" -radix hex /tb_gpio_axi/dut/s_axi_awaddr
add wave -noupdate -group "AXI Interface" -radix hex /tb_gpio_axi/dut/s_axi_awvalid
add wave -noupdate -group "AXI Interface" -radix hex /tb_gpio_axi/dut/s_axi_awready
add wave -noupdate -group "AXI Interface" -radix hex /tb_gpio_axi/dut/s_axi_wdata
add wave -noupdate -group "AXI Interface" -radix hex /tb_gpio_axi/dut/s_axi_wstrb
add wave -noupdate -group "AXI Interface" -radix hex /tb_gpio_axi/dut/s_axi_wvalid
add wave -noupdate -group "AXI Interface" -radix hex /tb_gpio_axi/dut/s_axi_wready
add wave -noupdate -group "AXI Interface" -radix hex /tb_gpio_axi/dut/s_axi_bresp
add wave -noupdate -group "AXI Interface" -radix hex /tb_gpio_axi/dut/s_axi_bvalid
add wave -noupdate -group "AXI Interface" -radix hex /tb_gpio_axi/dut/s_axi_bready
add wave -noupdate -group "AXI Interface" -radix hex /tb_gpio_axi/dut/s_axi_araddr
add wave -noupdate -group "AXI Interface" -radix hex /tb_gpio_axi/dut/s_axi_arvalid
add wave -noupdate -group "AXI Interface" -radix hex /tb_gpio_axi/dut/s_axi_arready
add wave -noupdate -group "AXI Interface" -radix hex /tb_gpio_axi/dut/s_axi_rdata
add wave -noupdate -group "AXI Interface" -radix hex /tb_gpio_axi/dut/s_axi_rresp
add wave -noupdate -group "AXI Interface" -radix hex /tb_gpio_axi/dut/s_axi_rvalid
add wave -noupdate -group "AXI Interface" -radix hex /tb_gpio_axi/dut/s_axi_rready

add wave -noupdate -divider -height 32 "Register Block"
add wave -noupdate -group "Register Block" -radix hex /tb_gpio_axi/dut/u_gpio_regs/reg_data_o
add wave -noupdate -group "Register Block" -radix hex /tb_gpio_axi/dut/u_gpio_regs/reg_dir
add wave -noupdate -group "Register Block" -radix hex /tb_gpio_axi/dut/u_gpio_regs/gpio_i
add wave -noupdate -group "Register Block" -radix hex /tb_gpio_axi/dut/u_gpio_regs/intr
add wave -noupdate -group "Register Block" -radix hex /tb_gpio_axi/dut/u_gpio_regs/s_reg_int_en
add wave -noupdate -group "Register Block" -radix hex /tb_gpio_axi/dut/u_gpio_regs/s_reg_int_sts

add wave -noupdate -divider -height 32 "GPIO Wrapper"
add wave -noupdate -group "GPIO Wrapper" -radix hex /tb_gpio_axi/dut/u_gpio_wrapper/oe
add wave -noupdate -group "GPIO Wrapper" -radix hex /tb_gpio_axi/dut/u_gpio_wrapper/o
add wave -noupdate -group "GPIO Wrapper" -radix hex /tb_gpio_axi/dut/u_gpio_wrapper/i

add wave -noupdate -divider -height 32 "GPIO Bits (Bit 0)"
add wave -noupdate -group "GPIO Bit 0" -radix hex /tb_gpio_axi/dut/u_gpio_wrapper/gen_gpio_bits(0)/u_gpio_bit/clk
add wave -noupdate -group "GPIO Bit 0" -radix hex /tb_gpio_axi/dut/u_gpio_wrapper/gen_gpio_bits(0)/u_gpio_bit/reset_n
add wave -noupdate -group "GPIO Bit 0" -radix hex /tb_gpio_axi/dut/u_gpio_wrapper/gen_gpio_bits(0)/u_gpio_bit/o
add wave -noupdate -group "GPIO Bit 0" -radix hex /tb_gpio_axi/dut/u_gpio_wrapper/gen_gpio_bits(0)/u_gpio_bit/oe
add wave -noupdate -group "GPIO Bit 0" -radix hex /tb_gpio_axi/dut/u_gpio_wrapper/gen_gpio_bits(0)/u_gpio_bit/i
add wave -noupdate -group "GPIO Bit 0" -radix hex /tb_gpio_axi/dut/u_gpio_wrapper/gen_gpio_bits(0)/u_gpio_bit/open_drain
add wave -noupdate -group "GPIO Bit 0" -radix hex /tb_gpio_axi/dut/u_gpio_wrapper/gen_gpio_bits(0)/u_gpio_bit/pull_up_en
add wave -noupdate -group "GPIO Bit 0" -radix hex /tb_gpio_axi/dut/u_gpio_wrapper/gen_gpio_bits(0)/u_gpio_bit/pull_down_en
add wave -noupdate -group "GPIO Bit 0" -radix hex /tb_gpio_axi/dut/u_gpio_wrapper/gen_gpio_bits(0)/u_gpio_bit/pad

# Format Clocks
property wave -color "Cyan" /tb_gpio_axi/clk
property wave -color "Cyan" /tb_gpio_axi/dut/s_axi_aclk
property wave -color "Cyan" /tb_gpio_axi/dut/u_gpio_wrapper/gen_gpio_bits(0)/u_gpio_bit/clk

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
