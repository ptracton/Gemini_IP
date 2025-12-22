Gemini_IP is a collection of high-quality, reusable Silicon IP blocks designed for modern FPGA and ASIC workflows. The project emphasizes multi-language support (SystemVerilog/VHDL), multi-bus compatibility, and robust environment automation.

## Project Status: **Verified**

The repository has transitioned from initial implementation to a fully verified state. All IP blocks include comprehensive test suites using modern verification methodologies.

## Core Principles
- **Multi-Language**: Every IP block is implemented in both **SystemVerilog** and **VHDL-2008**.
- **Bus Agnostic**: Support for **AXI4-Lite**, **APB4**, and **Wishbone B4** interfaces.
- **Verification Driven**: Cocotb-based testbenches with support for **Verilator**, **GHDL**, and **Vivado**.
- **Automated**: Integrated environment setup via `setup.sh`.

## Repository Structure
- `IP/`: Core library categorized by function (interface, dsp, common).
- `docs/`: Design specifications and architecture notes.
- `python/`: Verification scripts and automation tools.
- `virtualenv/`: Managed Python environment for tool dependencies.

## IP Catalog

### Interface
- **[GPIO](IP/interface/GPIO/README.md)**: Configurable GPIO with Interrupts, PWM, Debouncing, and multi-bus support.

## Feature Overview

| Feature | GPIO |
| :--- | :---: |
| **AXI4-Lite** | ✅ |
| **APB4** | ✅ |
| **Wishbone B4** | ✅ |
| **SystemVerilog** | ✅ |
| **VHDL-2008** | ✅ |
| **Regression Tool** | ✅ |

## Running Verifications & Tools

The repository is equipped with several automation tools for verification and hardware integration.

### Local Regression
To run the full IP quality suite (Verilator, GHDL, Xilinx, ModelSim):
```bash
python3 IP/interface/GPIO/tools/run_regression.py
```

### Native Simulations
Go to the respective IP simulation directories:
- **Xilinx**: `IP/interface/GPIO/sim/xilinx/run_xsim.sh`
- **ModelSim**: `IP/interface/GPIO/sim/modelsim/run_modelsim.sh`

### Cocotb Framework
For detailed interactive debugging:
```bash
cd IP/interface/GPIO/verif/cocotb && make
```

## Authorship & License
- **Author**: Gemini-3 AI (Google DeepMind)
- **License**: [MIT License](LICENSE)
- **Copyright**: (c) 2024-2025 Google DeepMind
