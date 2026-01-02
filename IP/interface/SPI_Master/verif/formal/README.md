# SPI Master Formal Verification

This directory contains formal verification setup for the SPI Master IP using SymbiYosys.

## Files

### Core Verification
- `spi_master_props.sv`: SystemVerilog Assertions (SVA) for SPI Master core
- `spi_master_binds.sv`: Bind module for core properties
- `spi_master_core.sby`: SymbiYosys configuration for core

### Bus Interface Verification
- `apb_props.sv`: APB protocol compliance properties
- `axi_props.sv`: AXI4-Lite protocol compliance properties
- `wb_props.sv`: Wishbone protocol compliance properties
- `bus_binds.sv`: Bind modules for all bus interfaces
- `spi_master_apb.sby`: SymbiYosys configuration for APB wrapper
- `spi_master_axi.sby`: SymbiYosys configuration for AXI wrapper
- `spi_master_wb.sby`: SymbiYosys configuration for Wishbone wrapper

### Build System
- `Makefile`: Automation for running formal verification
- `README.md`: This file

## Properties Verified

### SPI Master Core
- **FIFO Safety**: No TX push when full, no RX pop when empty
- **FSM Correctness**: Valid state transitions, reset behavior, busy signal accuracy
- **Interrupt Behavior**: Done interrupt pulses for exactly one cycle

### Bus Protocol Compliance

#### APB (AMBA APB)
- SETUP/ACCESS phase sequencing
- `penable` requires `psel`
- `pready` assertion during ACCESS phase
- No spurious errors

#### AXI4-Lite (AMBA AXI)
- Valid signal stability (must hold until handshake)
- Write response follows write data
- Read response follows read address
- Channel handshake compliance

#### Wishbone
- `stb_i` requires `cyc_i`
- Response signals only during valid cycles
- `ack_o` and `err_o` mutual exclusivity
- Eventual response guarantee

## Running Formal Verification

### Prerequisites
Install SymbiYosys and its dependencies:
```bash
# Install oss-cad-suite (includes SymbiYosys, Yosys, Z3)
# Or install individually:
pip install sby
```

### Execute Formal Proof
```bash
# Option 1: Use the runner script (recommended)
./run_formal.sh

# Option 2: Use make
make formal

# Option 3: Run individual components
make formal_core  # Core only
make formal_apb   # APB wrapper
make formal_axi   # AXI wrapper
make formal_wb    # Wishbone wrapper
```

### View Results
Results will be in `spi_master_core/` directory:
- `PASS`: All assertions proved
- `FAIL`: Counterexample found (check `engine_*/trace.vcd`)

## Integration with Regression

To include formal verification in the regression suite, ensure SymbiYosys is installed and add to `sim/run_regression.sh`.
