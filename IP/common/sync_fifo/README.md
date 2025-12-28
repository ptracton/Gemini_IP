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
| rst_n | Input | 1 | Active Low Reset |
| flush | Input | 1 | Synchronous Flush |
| push | Input | 1 | Write Enable |
| data_in | Input | WIDTH | Write Data |
| full | Output | 1 | Full Flag |
| pop | Input | 1 | Read Enable |
| data_out | Output | WIDTH | Read Data |
| empty | Output | 1 | Empty Flag |
| level | Output | log2(DEPTH)+1 | Current Item Count |

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
Utilization targeting Artix-7 (xc7a35t) for Vivado/Yosys and Cyclone IV E (EP4CE115) for Quartus:

| Tool | Logic Elements (LUTs) | Registers | Memory Bits |
|---|---|---|---|
| **Vivado** | 165 | 557 | 0 (Size < Threshold) |
| **Yosys** | ~245 | 557 | - |
| **Quartus (SV)** | 137 (LEs) | 119 | 512 |
| **Quartus (VHDL)** | 177 (LEs) | 151 | 512 |

> [!NOTE]
> Quartus successfully infers Block RAM/MLAB for both SystemVerilog and VHDL implementations (after removing asynchronous resets on the memory path). Vivado continues to use distributed RAM (registers) for this configuration likely because the 512-bit size is below the threshold for efficient Block RAM usage on Artix-7, even with the `ram_style="block"` attribute.
