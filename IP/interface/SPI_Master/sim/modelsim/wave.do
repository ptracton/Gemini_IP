onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {System}
add wave -noupdate -format Logic -hex -color {Cyan} /tb_spi_master_core/clk
add wave -noupdate -format Logic -hex /tb_spi_master_core/rst_n
add wave -noupdate -divider {SPI Bus}
add wave -noupdate -format Logic -hex -color {Cyan} /tb_spi_master_core/sclk
add wave -noupdate -format Logic -hex /tb_spi_master_core/mosi
add wave -noupdate -format Logic -hex /tb_spi_master_core/miso
add wave -noupdate -divider {Internal Interface}
add wave -noupdate -format Literal -hex /tb_spi_master_core/tx_data
add wave -noupdate -format Logic -hex /tb_spi_master_core/tx_valid
add wave -noupdate -format Logic -hex /tb_spi_master_core/tx_ready
add wave -noupdate -format Literal -hex /tb_spi_master_core/rx_data
add wave -noupdate -format Logic -hex /tb_spi_master_core/rx_valid
add wave -noupdate -divider {Config}
add wave -noupdate -format Logic -hex /tb_spi_master_core/cpol
add wave -noupdate -format Logic -hex /tb_spi_master_core/cpha
add wave -noupdate -format Literal -unsigned /tb_spi_master_core/clk_div
add wave -noupdate -format Logic -hex /tb_spi_master_core/enable
add wave -noupdate -divider {DUT Internal}
add wave -noupdate -format Literal -hex /tb_spi_master_core/dut/state
add wave -noupdate -format Literal -unsigned /tb_spi_master_core/dut/bit_cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 us}
