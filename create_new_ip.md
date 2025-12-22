---
description: Steps to create and verify a new IP block following the Gemini_IP gold-standard template.
---

# Create New IP Workflow

Follow these steps to ensure every new IP block meets the project's quality and verification standards.

## 1. Directory Structure Setup
Create the following hierarchy for the new IP (e.g., `IP/category/NEW_IP`):
```text
NEW_IP/
├── rtl/
│   ├── verilog/      # SystemVerilog implementation
│   └── vhdl/         # VHDL-2008 implementation
├── tb/               # Native SystemVerilog/VHDL testbenches
├── sim/
│   ├── iverilog/     # Icarus Verilog runner
│   ├── ghdl/         # GHDL runner
│   ├── modelsim/     # ModelSim runner (Batch/GUI)
│   └── xilinx/       # Xilinx xsim runner
├── verif/
│   ├── cocotb/       # Cocotb (Python) testbench
│   ├── formal/       # SymbiYosys (SVA) configuration
│   └── uvm/          # UVM (SystemVerilog) environment
├── tools/            # Regression and Linting scripts
├── synthesis/        # Vivado and Yosys synthesis scripts
└── README.md         # Documentation (Architecture & Register Map)
```

## 2. RTL Implementation
- [ ] Implement core logic in **SystemVerilog**.
- [ ] Implement functionally identical logic in **VHDL-2008**.
- [ ] Implement Bus Wrappers (AXI4-Lite, APB4, Wishbone) using the layered approach.

## 3. Initial Native Verification
- [ ] Create standalone testbenches in `tb/`.
- [ ] Verify using **Icarus Verilog** and **GHDL**.
- [ ] Verify using **Xilinx xsim** and **ModelSim (Batch)**.
- [ ] Create **ModelSim GUI** wave scripts (`.do`) with grouped signals, hex radix, and cyan clocks.

## 4. Advanced Verification & Analysis
- [ ] **Linting**: Run `run_lint.sh` (Verilator for SV, GHDL for VHDL).
- [ ] **Cocotb**: Implement multi-language cross-verification.
- [ ] **Formal**: Add **SVA** properties and run **SymbiYosys**.
- [ ] **UVM**: Build a full UVM environment for coverage-driven and Constrained Random Verification.

## 5. Synthesis Validation
- [ ] Perform **Vivado** synthesis to check Artix-7 utilization and timing.
- [ ] Perform **Vivado** synthesis to check Artix-7 utilization and timing.
- [ ] Perform **Open-Source (Yosys)** synthesis for cross-tool verification.
- [ ] Perform **Quartus** synthesis to verify Intel FPGA compatibility (Cyclone IV/V).

## 6. Regression & Documentation
- [ ] Integrate all jobs into a local `run_regression.py` tool.
- [ ] Document the IP using the GPIO `README.md` as a template (include Mermaid diagrams).
- [ ] Final check: All 30+ jobs must pass before the IP is considered **Verified**.
