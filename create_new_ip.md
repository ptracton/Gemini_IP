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
├── tools/            # Regression, Linting, and Cleanup scripts
├── synthesis/        # Vivado, Quartus, and Yosys synthesis scripts
├── README.md         # Documentation (Architecture & Register Map)
└── <IP_NAME>_regression_results.md # Automated regression results summary
```

## 2. RTL Implementation
- [ ] Implement core logic in **SystemVerilog**.
- [ ] Implement functionally identical logic in **VHDL-2008**.
- [ ] Implement Bus Wrappers (AXI4-Lite, APB4, Wishbone) using the layered approach.

## 3. Initial Native Verification
- [ ] Create standalone testbenches in `tb/`.
- [ ] Verify SystemVerilog using **Icarus Verilog** (`run_iverilog.sh`), **Xilinx xsim** (`run_xsim.sh`), and **ModelSim** (`run_modelsim.sh`). Ensure simulations write output to log files (e.g., `simulation.log`).
- [ ] Verify VHDL using **GHDL** (`run_ghdl.sh`), **Xilinx xsim** (`run_xsim_vhdl.sh`), and **ModelSim** (`run_modelsim_vhdl.sh`). Ensure simulations write output to log files (e.g., `simulation.log`).
- [ ] **Fail-Fast Policy**: Simulation testbenches MUST terminate immediately upon detecting a data mismatch or error (use `$fatal` in SV, `severity failure` in VHDL). DO NOT continue simulation after a failure.
- [ ] Create **ModelSim GUI** wave scripts (`.do`) with grouped signals, hex radix, and cyan clocks.

## 4. Advanced Verification & Analysis
- [ ] **Linting**: Run `run_lint.sh` (Verilator for SV, GHDL for VHDL).
- [ ] **CDC/Structural**: Run `run_cdc.sh` for clock domain crossing and linting.
- [ ] **Cocotb**: Implement multi-language cross-verification.
- [ ] **Formal**: Add **SVA** properties and run **SymbiYosys**.
- [ ] **Code Coverage**: Achieve >95% code coverage (Line, Branch, Condition, Toggle) using Xilinx or other coverage tools.
- [ ] **UVM**: Build a full UVM environment (Note: UVM may be excluded if it causes host-level stability issues).

## 5. Synthesis Validation
- [ ] Create `synthesis/run_synth.sh` to automate all synthesis jobs.
- [ ] Perform **Vivado** synthesis to check Artix-7 utilization and timing.
- [ ] Perform **Open-Source (Yosys)** synthesis for cross-tool verification.
- [ ] Perform **Quartus** synthesis to verify Intel FPGA compatibility (Cyclone IV/V).

## 6. Regression, Cleanup & Documentation
- [ ] **Pathing Standard**: All scripts MUST use the `$GEMINI_IP_ROOT` environment variable. Avoid hardcoded absolute paths or excessive relative pathing (`../../..`).
- [ ] **Regression**: Integrate all jobs into a local `run_regression.py` tool.
- [ ] **Results Summary**: Ensure `run_regression.py` generates `<IP_NAME>_regression_results.md` in the IP root with a summary of all test statuses.
- [ ] **Cleanup**: Implement `run_clean.sh` in `tools/` and verify that the Project Root `clean_project.sh` successfully removes all artifacts valid for this IP.
- [ ] **Standardized Naming**: Use `run_regression.py`, `run_lint.sh`, `run_cdc.sh`, `run_clean.sh`, and `run_synth.sh`.
- [ ] **Documentation**: Document the IP using the GPIO `README.md` as a template (include Mermaid diagrams).
- [ ] **Known Issues**: If a verification step fails due to tool limitations (e.g., UVM Code Coverage crash), explicitly document this in a "Known Issues" section in `README.md`.
- [ ] **Final Check**: All 13+ regression jobs must pass before the IP is considered **Verified** (exceptions allowed only for documented tool issues).
