# SPI Slave IP

**Category**: interface
**Standard**: SystemVerilog / VHDL-2008
**Verification**: Cocotb, UVM, Formal

## Overview
A generic SPI Slave IP acting as an internal bus master (Wishbone, AXI4-Lite, AHB).

## Features
- **SPI Mode**: 0 or 3 (Configurable CPOL/CPHA)
- **CDC**: Fully asynchronous boundaries between `spi_clk` and `sys_clk`.
- **Command Protocol**: 8-bit Command + 32-bit Address + Data.
- **Transfers**: Single and Burst (Auto-increment).
- **Data Sizes**: Byte (8), Half-Word (16), Word (32).

## Protocol
**Command Byte**: `[7:6] Op | [5:4] Size | [3:0] Rsrvd`
- **Op**: `00` Read, `01` Write, `10` Burst Read, `11` Burst Write.
- **Size**: `00` Byte, `01` Half, `10` Word.

## Directory Structure
- `rtl/`: Core logic and Bus Wrappers.
- `tb/`: Native HDT testbenches.
- `verif/`: Advanced verification (Cocotb, UVM).

## Verification Status
Current regression results confirm full functionality across both supported simulators:
- **Icarus Verilog**: ✅ PASS (All Tests)
- **GHDL (VHDL)**: ✅ PASS (All Tests)

Detailed report: [Regression Results](spi_slave_regression_results.md)

## Running Verification
To run the full regression suite:
```bash
./IP/interface/SPI_Slave/tools/run_regression.py
```

To run individual simulators:
```bash
# Icarus Verilog
./IP/interface/SPI_Slave/sim/iverilog/run_iverilog.sh

# GHDL
./IP/interface/SPI_Slave/sim/ghdl/run_ghdl.sh
```
