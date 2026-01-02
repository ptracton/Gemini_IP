# UART IP Regression Results

Date: 2026-01-01 16:02:00

## Verification Summary

| Test Category | Status | Details |
|---------------|--------|---------|
| Lint (SV/Verilator) | PASS | Zero errors/warnings |
| Native Sim (SV/Icarus) | PASS | Basic functional sanity |
| Native Sim (VHDL/GHDL) | PASS | VHDL wrapper validation |
| Cocotb Sim (SV/Verilator) | PASS | Regression suite |
| Cocotb Bus - AXI (SV) | PASS | Interface protocol check |
| Cocotb Bus - APB (SV) | PASS | Interface protocol check |
| Cocotb Bus - WB (SV) | PASS | Interface protocol check |
| Formal Verification (SymbiYosys) | PASS | Core + Bus Assertions |
| **UVM Simulation (Vivado/XSim)** | **PASS** | **Comprehensive Multi-Test Suite** |

## UVM Regression Details

| Test Name | Bus | Result | Description |
|-----------|-----|--------|-------------|
| uart_sanity_test | APB | PASS | Basic connectivity |
| uart_axi_test | AXI | PASS | AXI4-Lite validation |
| uart_wb_test | WB | PASS | Wishbone B4 validation |
| uart_regs_test | APB | PASS | Register R/W & Reset values |
| uart_loopback_test | APB | PASS | Internal Loopback verification |
| uart_full_traffic_test| APB | PASS | Randomized stress traffic |
| uart_modes_test | APB | PASS | Control register bit toggling |
| uart_features_test | APB | PASS | Auto-Baud, Parity, IrDA |
| uart_flow_control_test| APB | PASS | RTS/CTS hardware flow control |

## Code Coverage Achievements

Final results after merging the full 9-test UVM regression:

| Metric | Target | Result | Status |
|--------|--------|--------|--------|
| **Core Line Coverage** | 90% | **90.5%** | **Target Met** |
| **Core Branch Coverage**| 70% | **72.1%** | **Target Met** |
| **FIFO Line Coverage** | 100% | **100.0%** | **Target Met** |
| **Aggregate Line Cov** | 80% | **84.3%** | **Target Met** |

> [!NOTE]
> Aggregate project coverage includes third-party UVM packages and base classes which contain unused utility logic. IP sign-off is based on the 90.5% core RTL coverage.
