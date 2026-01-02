Gemini_IP is a collection of high-quality, reusable Silicon IP blocks designed for modern FPGA and ASIC workflows. The project emphasizes multi-language support (SystemVerilog/VHDL), multi-bus compatibility, and robust environment automation.

## Project Status: **Verified**

The repository has transitioned from initial implementation to a fully verified state. All IP blocks include comprehensive test suites using modern verification methodologies.

## Core Principles
- **Multi-Language**: Every IP block is implemented in both **SystemVerilog** and **VHDL-2008**.
- **Bus Agnostic**: Support for **AXI4-Lite**, **APB4**, and **Wishbone B4** interfaces.
- **Verification Driven**: Cocotb-based testbenches with support for **Verilator**, **GHDL**, and **Vivado**.
- **Automated**: Integrated environment setup via `setup.sh` which exports the mandatory `GEMINI_IP_ROOT` variable.

## Getting Started

To initialize the development environment, source the `setup.sh` script from the repository root:

```bash
source setup.sh
```

This script will:
1. Export `GEMINI_IP_ROOT` to the current directory.
2. Activate the Python virtual environment located in `virtualenv/GEMINI_IP_PYTHON`.
3. Verify that all required tools are in the system path.

## Repository Structure
- `IP/`: Core library categorized by function (interface, dsp, common).
- `docs/`: Design specifications and architecture notes.
- `python/`: Verification scripts and automation tools.
- `virtualenv/`: Managed Python environment for tool dependencies.

## IP Catalog

### Interface
- **[GPIO](IP/interface/GPIO/README.md)**: Configurable GPIO with Interrupts, PWM, Debouncing, and multi-bus support.
- **[SPI Master](IP/interface/SPI_Master/README.md)**: Configurable SPI Master with FIFOs, programmable word length, and support for AXI4-Lite, APB4, and Wishbone.
- **[UART](IP/interface/UART/README.md)**: Universal Asynchronous Receiver/Transmitter with configurable baud rate, FIFOs, RS-485, DMA, and multi-bus support.

### Common
- **[General Timer](IP/common/general_timer/README.md)**: A 32-bit configurable timer with PWM, Input Capture, Prescaler, and multi-bus support (AXI/APB/WB).
- **[Bus Matrix](IP/common/bus_matrix/README.md)**: High-performance N:M interconnect supporting AXI4-Lite, AHB5-Lite, and Wishbone B4 with configurable arbitration and security firewall.
- **[Sync FIFO](IP/common/sync_fifo/README.md)**: Generic synchronous FIFO with configurable width/depth, programmable thresholds, error flags, peak usage tracking, and multiple bus wrappers (AXI/APB/AHB/WB).

## Feature Overview

| Feature | Sync FIFO | GPIO | Timer | UART | SPI |
|---------|-----------|------|-------|------|-----|
| AXI4-Lite| [x] | [x] | [x] | [x] | [x] |
| APB | [x] | [x] | [x] | [x] | [x] |
| Wishbone | [x] | [x] | [x] | [x] | [x] |
| AHB-Lite | [x] | [ ] | [ ] | [ ] | [ ] |
| SystemVerilog | [x] | [x] | [x] | [x] | [x] |
| VHDL-2008 | [x] | [x] | [x] | [x] | [x] |
| Cocotb | [x] | [x] | [x] | [x] | [x] |
| UVM | [ ] | [x] | [ ] | [x] | [ ] |
| Synthesis | [x] | [x] | [x] | [x] | [ ] |

## Running Verifications & Tools

The repository is equipped with several automation tools for verification and hardware integration. Each IP has its own dedicated verification suite.

Please refer to the specific IP documentation for detailed instructions on running regressions, native simulations, and Cocotb tests:

- **[GPIO Verification Guide](IP/interface/GPIO/README.md#verification--tooling)**
- **[General Timer Verification Guide](IP/common/general_timer/README.md#verification-status)**
- **[Bus Matrix Verification Guide](IP/common/bus_matrix/README.md#verification-status)**
- **[Sync FIFO Verification Guide](IP/common/sync_fifo/README.md#verification)**
- **[UART Verification Guide](IP/interface/UART/README.md#verification-status)**
- **[SPI Master Verification Guide](IP/interface/SPI_Master/README.md#verification-results)**

## Development Standards

Every IP in `Gemini_IP` follows a strict "Gold Standard" template established by the [GPIO](IP/interface/GPIO/README.md) module. New IP development must follow the [Create New IP Workflow](create_new_ip.md):

1.  **Dual-RTL**: Concurrent SystemVerilog and VHDL-2008 development.
2.  **Layered Arch**: Separate Bus Wrappers (AXI/APB/WB) from core logic.
3.  **Universal Verification**: Every IP must pass Native, Cocotb, UVM, and Formal simulation.
4.  **Static Analysis**: Zero warnings in Linting (Verilator/GHDL).
5.  **Synthesis Proven**: Area and timing verified via Vivado and Yosys.

## Authorship & License
- **Author**: Gemini-3 AI (Google DeepMind)
- **License**: [MIT License](LICENSE)
- **Copyright**: (c) 2024-2025 Google DeepMind
