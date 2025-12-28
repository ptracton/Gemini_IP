# Synchronous FIFO

generic synchronous FIFO with configurable width and depth.

## Features
- **Configurable Width & Depth**
- **Synchronous Reset** (Active Low) & Flush
- **Full/Empty/Level Status**
- **SystemVerilog & VHDL-2008** implementations

## Interfaces

| Port | Direction | Width | Description |
|---|---|---|---|
| clk | Input | 1 | Clock |
| `DEPTH` | Integer | `16` | FIFO Depth (Number of words) |
| `FWFT_MODE` | Boolean/Bit | `0`/`false` | First-Word-Fall-Through Mode |
| `ALMOST_FULL_THRESH` | Integer | `DEPTH-1` | Threshold for almost_full flag |
| `ALMOST_EMPTY_THRESH` | Integer | `1` | Threshold for almost_empty flag |
| rst_n | Input | 1 | Active Low Reset |
| flush | Input | 1 | Synchronous Flush |
| push | Input | 1 | Write Enable |
| data_in | Input | WIDTH | Write Data |
| full | Output | 1 | Full Flag |
| pop | Input | 1 | Read Enable |
| data_out | Output | WIDTH | Read Data |
| `empty` | Output | `1` | FIFO Empty Flag |
| `almost_full` | Output | `1` | FIFO Almost Full Flag |
| `almost_empty` | Output | `1` | FIFO Almost Empty Flag |
| `overflow` | Output | `1` | FIFO Overflow Error (Sticky) |
| `underflow` | Output | `1` | FIFO Underflow Error (Sticky) |
| `level` | Output | `log2(DEPTH)+1` | Current FIFO Level |
| `max_level` | Output | `log2(DEPTH)+1` | Peak FIFO Level (Max usage) |

## Verification
Top-level verification is performed using **Cocotb**.
Native testbenches are provided for Icarus, GHDL, and Xilinx.

[View Regression Results](./sync_fifo_regression_results.md)

### Running Tests
```bash
# Cocotb (SV)
cd verif/cocotb
make

# Cocotb (VHDL)
make TOPLEVEL_LANG=vhdl SIM=ghdl

# Native Scripts
./sim/iverilog/run_iverilog.sh
./sim/ghdl/run_ghdl.sh
```

## Synthesis
Synthesis scripts are provided for Vivado, Quartus, and Yosys.
Run all:
```bash
./synthesis/run_synth.sh
```

## Synthesis Results
The following results were obtained for a 32-bit width, 16-deep configuration (512 bits) targeting a Xilinx Artix-7 (xc7a35t) and Intel Cyclone IV E (EP4CE115). 

### Xilinx Vivado (Artix-7)
| Module | Language | LUTs | Registers | BRAM |
|---|---|---|---|---|
| **sync_fifo** | SV | 200 | 564 | 0 |
| **sync_fifo** | VHDL | 64 | 52 | 0 |
| **sync_fifo_apb** | SV | 207 | 532 | 0 |
| **sync_fifo_apb** | VHDL | 83 | 20 | 0 |
| **sync_fifo_axi** | SV | 215 | 570 | 0 |
| **sync_fifo_axi** | VHDL | 82 | 59 | 0 |
| **sync_fifo_ahb** | SV | 207 | 538 | 0 |
| **sync_fifo_ahb** | VHDL | 91 | 26 | 0 |
| **sync_fifo_wb** | SV | 207 | 566 | 0 |
| **sync_fifo_wb** | VHDL | 84 | 54 | 0 |

### Intel Quartus (Cyclone IV E)
| Module | Language | Logic Elements | Registers | Memory Bits |
|---|---|---|---|---|
| **sync_fifo** | SV | 157 | 126 | 512 |
| **sync_fifo** | VHDL | 221 | 158 | 512 |
| **sync_fifo_apb** | SV | 203 | 128 | 512 |
| **sync_fifo_apb** | VHDL | 267 | 126 | 512 |
| **sync_fifo_axi** | SV | 203 | 131 | 512 |
| **sync_fifo_axi** | VHDL | 282 | 164 | 512 |
| **sync_fifo_ahb** | SV | 210 | 128 | 512 |
| **sync_fifo_ahb** | VHDL | 272 | 126 | 512 |
| **sync_fifo_wb** | SV | 193 | 128 | 512 |
| **sync_fifo_wb** | VHDL | 273 | 160 | 512 |

> [!NOTE]
> - **RAM Inference**: Quartus successfully infers M9K BRAM blocks (512 bits) for all versions. Vivado implements the 512-bit memory using Distributed RAM (LUTs/Registers), which is more efficient for small depths on Xilinx FPGAs.
> - **Optimization**: The disparities between SV and VHDL results in Vivado (especially the lower VHDL values) suggest that Vivado's VHDL synthesis engine performs more aggressive cross-boundary optimization or more efficient RAM extraction for the specific coding style used in the VHDL core.
