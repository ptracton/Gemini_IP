# Single Port Memory (sp_memory) IP

## Overview
The `sp_memory` is a highly configurable Single Port Random Access Memory IP. It supports generic inference as well as vendor-specific optimizations for Xilinx (BRAM) and Altera (MRAM).

### Key Features
- **Configurable Width/Depth**: Supports full byte-enable logic for any data width.
- **Reliability**: Integrated **Parity** and **SECDED ECC** (for 32-bit data) with real-time error reporting.
- **Functional Safety**: Built-In Self-Test (**BIST**) with a checkerboard pattern.
- **Power Management**: **Sleep mode** for low-power standby.
- **Advanced Bus Support**: Upgraded **AXI4 Full** (burst support), APB4, Wishbone B4, and AHB-Lite.
- **Address Protection**: All bus wrappers include address range checking with standard error responses (DECERR, PSLVERR, etc.).

## Directory Structure
- `rtl/`: SystemVerilog and VHDL core sources and bus wrappers.
- `tb/`: Native SystemVerilog and VHDL testbenches.
- `verif/cocotb/`: Advanced Python-based verification environment.
- `tools/`: Regression and cleanup scripts.
- `sim/`: Tool-specific simulation flows (Iverilog, GHDL, Xilinx Vivado).

## Parameters
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| WIDTH | Integer | 32 | Data width in bits (multiple of 8). |
| DEPTH | Integer | 1024 | Memory depth in words. |
| PIPELINE | Integer | 0 | Optional output stage (0=Combinational, 1=Registered). |
| PARITY | Integer | 0 | Enable parity (1 bit per byte). |
| ECC | Integer | 0 | Enable SECDED ECC (for 32-bit width). |
| TECHNOLOGY | String | "GENERIC" | Target: "GENERIC", "XILINX", "ALTERA". |
| INIT_FILE | String | "" | Optional .mem or .hex file for initialization. |

## Verification
### Multi-Simulator Support
The IP is verified across three major simulators:
1. **Iverilog**: For Native SV core and bus wrappers.
2. **GHDL**: For Native VHDL core and bus wrappers (VHDL-2008).
3. **Xilinx Vivado**: For technology-specific inference and mixed-language validation.

### Regression Suite
- **Run**: `python3 tools/run_regression.py`
- **Coverage**: 21+ automated jobs covering core and bus variants.

## Verification Status
| Test Suite | Status |
| :--- | :--- |
| **Native SV/VHDL Core** | :white_check_mark: Passing |
| **AXI4 Full (SV/VHDL)** | :white_check_mark: Passing |
| **APB4 (SV/VHDL)** | :white_check_mark: Passing |
| **Wishbone B4 (SV/VHDL)** | :white_check_mark: Passing |
| **AHB-Lite (SV/VHDL)** | :white_check_mark: Passing |
| **BIST & Sleep Features** | :white_check_mark: Passing |
| **ECC & Parity Logic** | :white_check_mark: Passing |

## Known Issues
- None.
