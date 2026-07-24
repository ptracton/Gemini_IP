# SPI Slave Regression Results

**Date:** 2026-01-04 18:46:59

| Test Name | Status | Duration |
| :--- | :--- | :--- |
| SV Core | ✅ PASS | 0:00:00.039848 |
| SV Wishbone | ✅ PASS | 0:00:00.042517 |
| SV AXI4-Lite | ✅ PASS | 0:00:00.046506 |
| SV AHB | ✅ PASS | 0:00:00.044223 |
| VHDL Core | ❌ FAIL | 0:00:00.657165 |
| VHDL Wishbone | ✅ PASS | 0:00:00.663045 |
| VHDL AXI4-Lite | ❌ FAIL | 0:00:00.699174 |
| VHDL AHB | ❌ FAIL | 0:00:00.645664 |

**Summary:** 5/8 Tests Passed

## Detailed Output

### VHDL Core Output
```
tb/tb_spi_slave_core.vhd:190:9:@200ns:(report note): Starting SPI Slave VHDL Testbench
tb/tb_spi_slave_core.vhd:205:13:@4460ns:(report note): FAIL: Read Data Mismatch. Got 00000000
tb/tb_spi_slave_core.vhd:206:13:@4460ns:(assertion failure): Test Failed
./tb_spi_slave_core:error: assertion failed
  instance: .tb_spi_slave_core(sim).P3
./tb_spi_slave_core:error: simulation failed

```

### VHDL AXI4-Lite Output
```
tb/tb_spi_slave_axi.vhd:123:9:@200ns:(report note): Starting SPI Slave AXI VHDL Testbench
tb/tb_spi_slave_axi.vhd:84:17:@475ns:(report note): AXI Slave: Read Addr=00000060 Data=00000000
tb/tb_spi_slave_axi.vhd:84:17:@1755ns:(report note): AXI Slave: Read Addr=12345678 Data=00000000
tb/tb_spi_slave_axi.vhd:84:17:@2815ns:(report note): AXI Slave: Read Addr=00000004 Data=00000000
tb/tb_spi_slave_axi.vhd:142:13:@4040ns:(report note): FAIL: AXI Read Mismatch. Got 00000000
tb/tb_spi_slave_axi.vhd:143:13:@4040ns:(assertion failure): Test Failed
./tb_spi_slave_axi:error: assertion failed
  instance: .tb_spi_slave_axi(sim).P3
./tb_spi_slave_axi:error: simulation failed

```

### VHDL AHB Output
```
../../src/ieee2008/numeric_std-body.vhdl:3036:7:@0ms:(assertion warning): NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
tb/tb_spi_slave_ahb.vhd:120:9:@200ns:(report note): Starting SPI Slave AHB VHDL Testbench
tb/tb_spi_slave_ahb.vhd:139:13:@4040ns:(report note): FAIL: AHB Read Mismatch. Got 00000000
tb/tb_spi_slave_ahb.vhd:140:13:@4040ns:(assertion failure): Test Failed
./tb_spi_slave_ahb:error: assertion failed
  instance: .tb_spi_slave_ahb(sim).P4
./tb_spi_slave_ahb:error: simulation failed

```

