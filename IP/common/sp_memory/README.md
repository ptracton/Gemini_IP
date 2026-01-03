# Single Port Memory (sp_memory) IP

## Overview
The `sp_memory` is a highly configurable Single Port Random Access Memory IP. It supports generic inference as well as vendor-specific optimizations for Xilinx (BRAM) and Altera (MRAM) via the `TECHNOLOGY` parameter. Key features include full byte-enable support for any data width and a robust verification suite covering very wide bus implementations (e.g., 128-bit).

## Directory Structure
- `rtl/`: SystemVerilog and VHDL core sources and generic bus wrappers (AXI4-Lite, APB4, Wishbone B4, AHB-Lite).
- `tb/`: Native SystemVerilog testbench.
- `verif/cocotb/`: Advanced Python-based verification environment.
- `tools/`: Cleanup scripts.
- `synthesis/`: Synthesis wrappers.

## Parameters
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| WIDTH | Integer | 32 | Data width in bits. Must be a multiple of 8. |
| DEPTH | Integer | 1024 | Memory depth in words. |
| TECHNOLOGY | String | "GENERIC" | Synthesis target: "GENERIC", "XILINX", "ALTERA", "ASIC". |

## Interfaces
The IP includes wrappers for standard buses:
- **AXI4-Lite** (`sp_memory_axi.sv`)
- **APB4** (`sp_memory_apb.sv`)
- **Wishbone B4** (`sp_memory_wb.sv`)
- **AHB-Lite** (`sp_memory_ahb.sv`)

## Verification
### Native
- `tb_sp_memory.sv`: Verifies basic Read/Write and Byte Enables using Icarus Verilog.
- **Run**: `iverilog -g2012 ...`

### Cocotb Regression
- **Framework**: Cocotb 1.9+, Verilator (SV), GHDL (VHDL).
- **Coverage**:
  - Basic Read/Write
  - Byte Enable correctness (Partial writes)
  - Wide Access (e.g., 128-bit width verification)
- **Run**: `verif/cocotb/run_cocotb.sh`

## Verification Status
| Test Suite | Test Configuration | Status |
| :--- | :--- |
| **Native SV Core** | :white_check_mark: Passing |
| **Native SV AXI4-Lite** | :white_check_mark: Passing |
| **Native SV APB4** | :white_check_mark: Passing |
| **Native SV Wishbone** | :white_check_mark: Passing |
| **Native SV AHB-Lite** | :warning: Known Issue (Icarus Deadlock) |
| **SV Core (32-bit)** | :white_check_mark: Passing |
| **SV Core (128-bit)** | :white_check_mark: Passing |
| **VHDL Core (32-bit)** | :white_check_mark: Passing |
| **VHDL Core (128-bit)** | :white_check_mark: Passing |
| **SV AXI4-Lite** | :white_check_mark: Passing |
| **VHDL AXI4-Lite** | :white_check_mark: Passing |
| **SV APB4** | :white_check_mark: Passing |
| **VHDL APB4** | :white_check_mark: Passing |
| **SV Wishbone** | :white_check_mark: Passing |
| **VHDL Wishbone** | :white_check_mark: Passing |
| **SV AHB-Lite** | :white_check_mark: Passing |
| **VHDL AHB-Lite** | :white_check_mark: Passing |

## Known Issues
- None at this time.
