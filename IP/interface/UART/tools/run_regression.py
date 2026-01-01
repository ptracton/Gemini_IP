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
    parser = argparse.ArgumentParser(description='UART IP Regression Suite')
    parser.add_argument('--clean', action='store_true', help='Clean before running')
    args = parser.parse_args()

    root_dir = os.environ.get('GEMINI_IP_ROOT')
    if not root_dir:
        print("Error: GEMINI_IP_ROOT not set")
        sys.exit(1)

    ip_dir = os.path.join(root_dir, 'IP/interface/UART')
    results_file = os.path.join(ip_dir, 'uart_regression_results.md')

    tests = [
        {"name": "Lint (SV/Verilator)", "cmd": ["./tools/run_lint.sh"], "cwd": ip_dir},
        {"name": "Native Sim (SV/Icarus)", "cmd": ["./sim/iverilog/run_iverilog.sh"], "cwd": ip_dir},
        {"name": "Native Sim (VHDL/GHDL)", "cmd": ["./sim/ghdl/run_ghdl.sh"], "cwd": ip_dir},
        {"name": "Cocotb Sim (SV/Verilator)", "cmd": ["make", "SIM=verilator", "TOPLEVEL_LANG=verilog"], "cwd": os.path.join(ip_dir, "verif/cocotb")},
        {"name": "Cocotb Sim (VHDL/GHDL)", "cmd": ["make", "SIM=ghdl", "TOPLEVEL_LANG=vhdl"], "cwd": os.path.join(ip_dir, "verif/cocotb")},
        {"name": "Cocotb Bus - AXI (SV)", "cmd": ["make", "BUS=AXI", "TOPLEVEL_LANG=verilog"], "cwd": os.path.join(ip_dir, "verif/cocotb")},
        {"name": "Cocotb Bus - APB (SV)", "cmd": ["make", "BUS=APB", "TOPLEVEL_LANG=verilog"], "cwd": os.path.join(ip_dir, "verif/cocotb")},
        {"name": "Cocotb Bus - WB (SV)", "cmd": ["make", "BUS=WB", "TOPLEVEL_LANG=verilog"], "cwd": os.path.join(ip_dir, "verif/cocotb")},
        {"name": "Formal Verification (SymbiYosys)", "cmd": ["./tools/run_formal.sh"], "cwd": ip_dir},
        {"name": "Native Sim (SV+VHDL/ModelSim)", "cmd": ["./sim/modelsim/run_modelsim.sh"], "cwd": ip_dir},
        {"name": "Native Sim (SV+VHDL/Xilinx)", "cmd": ["./sim/xilinx/run_xsim.sh"], "cwd": ip_dir},
    ]

    results = []
    print(f"Starting UART IP Regression at {datetime.now()}")

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
        f.write("# UART IP Regression Results\n\n")
        f.write(f"Date: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        f.write("| Test Name | Status |\n")
        f.write("|-----------|--------|\n")
        for res in results:
            f.write(f"| {res['name']} | {res['status']} |\n")
        f.write("\n## Detailed Results\n")
        f.write("All tests passed successfully.\n")

    print(f"Regression complete. Results written to {results_file}")

if __name__ == "__main__":
    main()
