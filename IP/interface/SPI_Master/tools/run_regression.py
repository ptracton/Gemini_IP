#!/usr/bin/env python3
import os
import subprocess
import sys
import argparse
from datetime import datetime

def run_command(cmd, cwd=None):
    print(f"Running: {' '.join(cmd)}")
    try:
        result = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True, check=True)
        return True, result.stdout
    except subprocess.CalledProcessError as e:
        return False, e.stdout + e.stderr

def main():
    parser = argparse.ArgumentParser(description='SPI Master IP Regression Suite')
    parser.add_argument('--clean', action='store_true', help='Clean before running')
    args = parser.parse_args()

    root_dir = os.environ.get('GEMINI_IP_ROOT')
    if not root_dir:
        print("Error: GEMINI_IP_ROOT not set")
        sys.exit(1)

    ip_dir = os.path.join(root_dir, 'IP/interface/SPI_Master')
    results_file = os.path.join(ip_dir, 'spi_master_regression_results.md')

    tests = [
        {"name": "Lint (SV/Verilator)", "cmd": ["./tools/run_lint.sh"], "cwd": ip_dir},
        {"name": "Native Sim (SV/Icarus)", "cmd": ["./sim/iverilog/run_iverilog.sh"], "cwd": ip_dir},
        {"name": "Native Sim (VHDL/GHDL)", "cmd": ["./sim/ghdl/run_ghdl.sh"], "cwd": ip_dir},
        {"name": "Formal Verification (SymbiYosys)", "cmd": ["./verif/formal/run_formal.sh"], "cwd": ip_dir},
        {"name": "Native Sim (SV/ModelSim)", "cmd": ["./sim/modelsim/run_modelsim.sh"], "cwd": ip_dir},
        {"name": "Native Sim (VHDL/ModelSim)", "cmd": ["./sim/modelsim/run_modelsim_vhdl.sh"], "cwd": ip_dir},
        {"name": "Native Sim (SV/Xilinx)", "cmd": ["./sim/xilinx/run_xsim.sh"], "cwd": ip_dir},
        {"name": "Native Sim (VHDL/Xilinx)", "cmd": ["./sim/xilinx/run_xsim_vhdl.sh"], "cwd": ip_dir},
    ]

    # Add Cocotb tests only if script exists
    cocotb_dir = os.path.join(ip_dir, "verif/cocotb")
    if os.path.exists(os.path.join(cocotb_dir, "run_cocotb.sh")):
        tests.append({"name": "Cocotb Verification", "cmd": ["./run_cocotb.sh"], "cwd": cocotb_dir})

    # Add UVM tests only if script exists
    uvm_dir = os.path.join(ip_dir, "verif/uvm")
    if os.path.exists(os.path.join(uvm_dir, "run_uvm.sh")):
        tests.append({"name": "UVM Verification", "cmd": ["./run_uvm.sh"], "cwd": uvm_dir})

    results = []
    print(f"Starting SPI Master IP Regression at {datetime.now()}")

    for test in tests:
        # Clean cocotb directory before running to prevent artifact collisions
        if "cocotb" in test['cwd']:
            run_command(["make", "clean"], cwd=test['cwd'])
            
        success, output = run_command(test['cmd'], cwd=test['cwd'])
        status = "PASS" if success else "FAIL"
        results.append({"name": test['name'], "status": status})
        print(f"Test {test['name']}: {status}")

    # Generate Markdown Report
    with open(results_file, 'w') as f:
        f.write("# SPI Master IP Regression Results\n\n")
        f.write(f"Date: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        f.write("| Test Name | Status |\n")
        f.write("|-----------|--------|\n")
        for res in results:
            f.write(f"| {res['name']} | {res['status']} |\n")
        f.write("\n## Detailed Results\n")
        passed = sum(1 for r in results if r['status'] == 'PASS')
        total = len(results)
        f.write(f"Passed: {passed}/{total}\n")

    print(f"Regression complete. Results written to {results_file}")
    sys.exit(0 if all(r['status'] == 'PASS' for r in results) else 1)

if __name__ == "__main__":
    main()
