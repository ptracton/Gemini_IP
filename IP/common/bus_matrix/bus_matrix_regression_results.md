# Bus Matrix Verification Results

Generated on: 2025-12-24 13:55:27

## Status Metrics
| Metric | Status | Notes |
| :--- | :--- | :--- |
| **Regression Tests** | ✅ **Passed** | 100% Pass across Xilinx, ModelSim, GHDL |
| **Code Coverage** | **Pending** | Planning for coverage collection |
| **Formal Proofs** | ✅ **Passed** | SymbiYosys (BMC + Prove) across AXI, AHB, WB |
| **Linting** | ✅ **Passed** | Clean for core matrix logic |

## Summary
**Overall Status: PASSED**
**Passed: 7 / 7**

| Variant | Simulator/Tool | Status | Notes |
| :--- | :--- | :--- | :--- |
| **SystemVerilog (Sim)** | Xilinx Vivado (XSIM) | **PASS** | Verified Arbitration, Pipeline, Default Slave, Security |
| **SystemVerilog (Sim)** | ModelSim (Intel FPGA Ed) | **PASS** | Verified full regression with shared BFMs |
| **VHDL (Sim)** | GHDL (0.37+) | **PASS** | Verified Wishbone & AHB wrappers + Security Logic |
| **VHDL (Sim)** | ModelSim (Intel FPGA Ed) | **PASS** | Verified full regression with shared BFMs |
| **Formal AXI** | SymbiYosys (z3) | **PASS** | Verified protocol and mutual exclusion |
| **Formal AHB** | SymbiYosys (z3) | **PASS** | Verified protocol and mutual exclusion |
| **Formal WB** | SymbiYosys (z3) | **PASS** | Verified protocol and mutual exclusion |

## Detailed Logs
See individual log files in `tools/` directory for details.
