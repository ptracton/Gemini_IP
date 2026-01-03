# Bus Matrix Verification Results

Generated on: 2026-01-02 16:17:47

## Status Metrics
| Metric | Status | Notes |
| :--- | :--- | :--- |
| **Regression Tests** | ✅ **Passed** | 100% Pass across Xilinx, ModelSim, GHDL, Cocotb |
| **Code Coverage** | **Pending** | Planning for coverage collection |
| **Formal Proofs** | ✅ **Passed** | SymbiYosys (BMC + Prove) across AXI, AHB, WB |
| **Linting** | ✅ **Passed** | Clean for core matrix logic |

## Summary
**Overall Status: PASSED**
**Passed: 13 / 13**

| Variant | Simulator/Tool | Status | Notes |
| :--- | :--- | :--- | :--- |
| **Xilinx_SV** | Xilinx Vivado (XSIM) | **PASS** | SystemVerilog (Sim): Native TB |
| **ModelSim_SV** | ModelSim (Intel) | **PASS** | SystemVerilog (Sim): Native TB |
| **GHDL_VHDL** | GHDL (0.37+) | **PASS** | VHDL (Sim): Native TB |
| **ModelSim_VHDL** | ModelSim (Intel) | **PASS** | VHDL (Sim): Native TB |
| **Cocotb_AXI_Basic** | Verilator (Cocotb) | **PASS** | AXI Basic R/W |
| **Cocotb_AXI_Adv** | Verilator (Cocotb) | **PASS** | AXI Advanced (Conc/Arb/Sec) |
| **Cocotb_AHB_Basic** | Verilator (Cocotb) | **PASS** | AHB Basic R/W |
| **Cocotb_AHB_Adv** | Verilator (Cocotb) | **PASS** | AHB Advanced (Conc/Arb/Sec) |
| **Cocotb_WB_Basic** | Verilator (Cocotb) | **PASS** | WB Basic R/W |
| **Cocotb_WB_Adv** | Verilator (Cocotb) | **PASS** | WB Advanced (Conc/Arb/Sec) |
| **Formal_AXI** | SymbiYosys (z3) | **PASS** | Formal AXI: Protocol & Mutex |
| **Formal_AHB** | SymbiYosys (z3) | **PASS** | Formal AHB: Protocol & Mutex |
| **Formal_WB** | SymbiYosys (z3) | **PASS** | Formal WB: Protocol & Mutex |

## Detailed Logs
See individual log files in `tools/` directory for details.
