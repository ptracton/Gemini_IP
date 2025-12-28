# Sync FIFO Regression Results

- [x] Linting (Verilator/GHDL): PASS
- [x] Functional Simulation- **SV_Cocotb**: 100% PASS (5 jobs)
- **VHDL_Cocotb**: 100% PASS (5 jobs)
- **SV_Lint**: 100% PASS (5 jobs)
- **VHDL_Lint**: 100% PASS (5 jobs)
- **Synthesis (Vivado)**: 100% PASS (10 jobs: 5 modules x 2 langs)
- **Synthesis (Quartus)**: 100% PASS (10 jobs: 5 modules x 2 langs)
- **Synthesis (Yosys)**: 100% PASS (5 jobs: 5 modules SV only)
    - [x] AHB-Lite (SV/VHDL): PASS (100%)
    - [x] Wishbone (SV/VHDL): PASS (100%)

- **Wishbone (SV & VHDL)**: Verified successfully using robust handshake synchronization in testbench.
