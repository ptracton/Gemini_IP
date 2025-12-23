#!/usr/bin/env python3
#-------------------------------------------------------------------------------
# File: run_regression.py
# Description: Centralized regression script for General Timer IP.
#
# How it operates:
# This script executes all available simulation flows (Cocotb, Xilinx, ModelSim, etc.)
# across various configurations and summarizes the results.
#
# Author: Gemini-3 AI
# License: MIT
#-------------------------------------------------------------------------------

import os
import subprocess
import sys
import time
from datetime import datetime
from dataclasses import dataclass
from typing import List

@dataclass
class TestJob:
    name: str
    cwd: str
    command: List[str]
    description: str

def run_job(job: TestJob) -> bool:
    print(f"[RUNNING] {job.name} - {job.description}")
    start_time = time.time()
    
    try:
        # Run command and capture output
        # Logs are saved in the same directory as the script
        log_dir = os.path.dirname(os.path.abspath(__file__))
        log_file = os.path.join(log_dir, f"regression_{job.name.lower()}.log")
        
        with open(log_file, "w") as f:
            result = subprocess.run(
                job.command,
                cwd=job.cwd,
                stdout=f,
                stderr=subprocess.STDOUT,
                text=True,
                check=False
            )
        
        duration = time.time() - start_time
        
        if result.returncode == 0:
            print(f"[PASSED ] {job.name} ({duration:.2f}s)")
            return True
        else:
            print(f"[FAILED ] {job.name} ({duration:.2f}s)")
            # Dump last 5 lines for context
            try:
                with open(log_file, "r") as f:
                    lines = f.readlines()
                    print("--- LAST 5 LINES OF LOG ---")
                    for line in lines[-5:]:
                        print(line.strip())
                    print("---------------------------")
            except:
                pass
            return False
            
    except Exception as e:
        print(f"[ERROR  ] {job.name}: {str(e)}")
        return False

def main():
    # Setup Paths
    tools_dir = os.path.dirname(os.path.abspath(__file__))
    ip_root = os.path.dirname(tools_dir)
    sim_dir = os.path.join(ip_root, "sim")
    verif_dir = os.path.join(ip_root, "verif")
    cocotb_dir = os.path.join(verif_dir, "cocotb")

    print("==================================================")
    print(f"General Timer Regression Run: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print("==================================================")
    
    # Remove existing report if it exists
    report_path = os.path.join(ip_root, "timer_regression_results.md")
    if os.path.exists(report_path):
        os.remove(report_path)

    jobs = []

    # 1. SystemVerilog Cocotb Tests
    for bus in ["AXI", "APB", "WB"]:
        jobs.append(TestJob(
            name=f"SV_Cocotb_{bus}",
            cwd=cocotb_dir,
            command=["make", "SIM=verilator", f"BUS_TYPE={bus}", "TOPLEVEL_LANG=verilog"],
            description=f"SystemVerilog {bus} Cocotb via Verilator"
        ))

    # 2. VHDL Cocotb Tests
    for bus in ["AXI", "APB", "WB"]:
        jobs.append(TestJob(
            name=f"VHDL_Cocotb_{bus}",
            cwd=cocotb_dir,
            command=["make", "SIM=ghdl", f"BUS_TYPE={bus}", "TOPLEVEL_LANG=vhdl"],
            description=f"VHDL {bus} Cocotb via GHDL"
        ))

    # 3. Native ModelSim Tests
    jobs.append(TestJob(
        name="ModelSim_SV",
        cwd=os.path.join(sim_dir, "modelsim"),
        command=["./run_modelsim.sh"],
        description="ModelSim SystemVerilog Native TB"
    ))
    jobs.append(TestJob(
        name="ModelSim_VHDL",
        cwd=os.path.join(sim_dir, "modelsim"),
        command=["./run_modelsim_vhdl.sh"],
        description="ModelSim VHDL Native TB"
    ))

    # 4. Native Xilinx Tests
    jobs.append(TestJob(
        name="Xilinx_SV",
        cwd=os.path.join(sim_dir, "xilinx"),
        command=["./run_xsim.sh"],
        description="Xilinx xsim SystemVerilog Native TB"
    ))
    jobs.append(TestJob(
        name="Xilinx_VHDL",
        cwd=os.path.join(sim_dir, "xilinx"),
        command=["./run_xsim_vhdl.sh"],
        description="Xilinx xsim VHDL Native TB"
    ))

    # 5. Icarus Verilog
    jobs.append(TestJob(
        name="Icarus_Verilog",
        cwd=os.path.join(sim_dir, "iverilog"),
        command=["./run_iverilog.sh"],
        description="Icarus Verilog Native TB"
    ))

    # 6. GHDL
    jobs.append(TestJob(
        name="GHDL_Native",
        cwd=os.path.join(sim_dir, "ghdl"),
        command=["./run_ghdl.sh"],
        description="GHDL VHDL Native TB"
    ))

    # 7. Linting
    jobs.append(TestJob(
        name="Linting",
        cwd=tools_dir,
        command=["./run_lint.sh"],
        description="Verilator & GHDL Linting"
    ))

    # 8. Formal Verification
    formal_dir = os.path.join(verif_dir, "formal")
    for bus in ["axi", "apb", "wb"]:
        jobs.append(TestJob(
            name=f"Formal_{bus.upper()}",
            cwd=formal_dir,
            command=["./run_formal.sh", bus],
            description=f"Formal Verification ({bus.upper()}) via SymbiYosys"
        ))

    # 9. UVM Verification
    uvm_dir = os.path.join(verif_dir, "uvm")
    for lang in ["verilog", "vhdl"]:
        for bus in ["axi", "apb", "wb"]:
            jobs.append(TestJob(
                name=f"UVM_{lang.upper()}_{bus.upper()}",
                cwd=uvm_dir,
                command=["./run_uvm.sh", bus, lang, "timer_reg_test"],
                description=f"UVM Verification ({lang.upper()} {bus.upper()}) via Xilinx xsim"
            ))

    # Execute Jobs
    results = []
    for job in jobs:
        passed = run_job(job)
        results.append((job, passed))

    # Print Summary
    print("\n==================================================")
    print("REGRESSION SUMMARY")
    print("==================================================")
    passed_count = sum(1 for _, p in results if p)
    total_count = len(results)
    
    print(f"{'TEST NAME':<25} | {'STATUS':<10} | {'DESCRIPTION'}")
    print("-" * 75)
    for job, passed in results:
        status = "PASS" if passed else "FAIL"
        print(f"{job.name:<25} | {status:<10} | {job.description}")
    
    print("-" * 75)
    print(f"TOTAL: {passed_count}/{total_count} PASSED")
    print("==================================================")

    # Generate Markdown Report
    report_path = os.path.join(ip_root, "timer_regression_results.md")
    with open(report_path, "w") as f:
        f.write("# General Timer Regression Results\n\n")
        f.write(f"Generated on: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        f.write(f"**Overall Status: {'PASSED' if passed_count == total_count else 'FAILED'}**\n")
        f.write(f"**Passed: {passed_count} / {total_count}**\n\n")
        f.write("| Test Name | Status | Description |\n")
        f.write("| :--- | :---: | :--- |\n")
        for job, passed in results:
            status = "✅ PASS" if passed else "❌ FAIL"
            f.write(f"| {job.name} | {status} | {job.description} |\n")

    if passed_count != total_count:
        sys.exit(1)
    else:
        sys.exit(0)

if __name__ == "__main__":
    main()
