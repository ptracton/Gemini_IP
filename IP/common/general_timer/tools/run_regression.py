#!/usr/bin/env python3
"""
run_regression.py

Description:
    Runs all configured simulations for the General Timer IP and reports results.

Simulations:
    - ModelSim (Verilog & VHDL)
    - Xilinx (Verilog & VHDL)
    - Icarus Verilog
    - GHDL

Usage:
    ./run_regression.py
"""

import os
import subprocess
import sys
import time
from datetime import datetime

# Configuration
# Paths are relative to this script's location
TOOLS_DIR = os.path.dirname(os.path.abspath(__file__))
IP_ROOT = os.path.dirname(TOOLS_DIR)
SIM_DIR = os.path.join(IP_ROOT, "sim")

# List of simulations to run
# (Name, Script Path)
SIMULATIONS = [
    ("ModelSim Verilog", os.path.join(SIM_DIR, "modelsim/run_modelsim.sh")),
    ("ModelSim VHDL",    os.path.join(SIM_DIR, "modelsim/run_modelsim_vhdl.sh")),
    ("Xilinx Verilog",   os.path.join(SIM_DIR, "xilinx/run_xsim.sh")),
    ("Xilinx VHDL",      os.path.join(SIM_DIR, "xilinx/run_xsim_vhdl.sh")),
    ("Icarus Verilog",   os.path.join(SIM_DIR, "iverilog/run_iverilog.sh")),
    ("GHDL (VHDL)",      os.path.join(SIM_DIR, "ghdl/run_ghdl.sh"))
]

def run_simulation(name, script_path):
    """Runs a single simulation script and returns result."""
    print(f"Running: {name}...")
    start_time = time.time()
    
    # Check if script exists
    if not os.path.exists(script_path):
        return "MISSING", 0.0

    # Ensure script is executable
    os.chmod(script_path, 0o755)

    try:
        # Run process
        # Capture output to separate log file in tools dir for debug
        log_file = os.path.join(TOOLS_DIR, f"regression_{name.replace(' ', '_').lower()}.log")
        with open(log_file, "w") as f:
            result = subprocess.run(
                [script_path],
                cwd=os.path.dirname(script_path), # Run in sim dir
                stdout=f,
                stderr=subprocess.STDOUT,
                check=False
            )
        
        duration = time.time() - start_time
        status = "PASS" if result.returncode == 0 else "FAIL"
        return status, duration

    except Exception as e:
        print(f"Exception running {name}: {e}")
        return "ERROR", 0.0

def main():
    print("==================================================")
    print(f"General Timer Regression Run: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print("==================================================")

    results = []
    
    for name, script_path in SIMULATIONS:
        status, duration = run_simulation(name, script_path)
        results.append((name, status, duration))

    # Print Summary
    print("\n==================================================")
    print("REGRESSION SUMMARY")
    print("==================================================")
    print(f"{'TEST NAME':<25} | {'STATUS':<10} | {'TIME (s)':<10}")
    print("-" * 50)
    
    overall_pass = True
    for name, status, duration in results:
        print(f"{name:<25} | {status:<10} | {duration:<10.2f}")
        if status != "PASS":
            overall_pass = False

    print("==================================================")
    if overall_pass:
        print("RESULT: ALL TESTS PASSED")
        sys.exit(0)
    else:
        print("RESULT: FAILURE DETECTED")
        sys.exit(1)

if __name__ == "__main__":
    main()
