#!/usr/bin/env python3
# Sync FIFO Regression Script

import os
import subprocess
import datetime

class RegressionJob:
    def __init__(self, name, command):
        self.name = name
        self.command = command

def run_regression():
    if "GEMINI_IP_ROOT" not in os.environ:
        print("Error: GEMINI_IP_ROOT not set.")
        return

    root_dir = os.environ["GEMINI_IP_ROOT"]
    ip_dir = os.path.join(root_dir, "IP/common/sync_fifo")
    tools_dir = os.path.dirname(os.path.abspath(__file__))
    
    jobs = [
        RegressionJob("Lint", [os.path.join(tools_dir, "run_lint.sh")]),
        RegressionJob("Icarus", [os.path.join(ip_dir, "sim/iverilog/run_iverilog.sh")]),
        RegressionJob("GHDL", [os.path.join(ip_dir, "sim/ghdl/run_ghdl.sh")]),
        RegressionJob("SV_Cocotb", ["/bin/bash", "-c", "make -C " + os.path.join(ip_dir, "verif/cocotb") + " clean && make -C " + os.path.join(ip_dir, "verif/cocotb") + " SIM=verilator TOPLEVEL_LANG=verilog"]),
        RegressionJob("VHDL_Cocotb", ["/bin/bash", "-c", "make -C " + os.path.join(ip_dir, "verif/cocotb") + " clean && make -C " + os.path.join(ip_dir, "verif/cocotb") + " SIM=ghdl TOPLEVEL_LANG=vhdl"]),
        RegressionJob("SV_APB", ["/bin/bash", "-c", "make -C " + os.path.join(ip_dir, "verif/cocotb") + " clean && make -C " + os.path.join(ip_dir, "verif/cocotb") + " SIM=verilator TOPLEVEL_LANG=verilog BUS_TYPE=apb"]),
        RegressionJob("SV_AHB", ["/bin/bash", "-c", "make -C " + os.path.join(ip_dir, "verif/cocotb") + " clean && make -C " + os.path.join(ip_dir, "verif/cocotb") + " SIM=verilator TOPLEVEL_LANG=verilog BUS_TYPE=ahb"]),
        RegressionJob("VHDL_AHB", ["/bin/bash", "-c", "make -C " + os.path.join(ip_dir, "verif/cocotb") + " clean && make -C " + os.path.join(ip_dir, "verif/cocotb") + " SIM=ghdl TOPLEVEL_LANG=vhdl BUS_TYPE=ahb"]),
        RegressionJob("VHDL_APB", ["/bin/bash", "-c", "make -C " + os.path.join(ip_dir, "verif/cocotb") + " clean && make -C " + os.path.join(ip_dir, "verif/cocotb") + " SIM=ghdl TOPLEVEL_LANG=vhdl BUS_TYPE=apb"]),
        RegressionJob("SV_AXI", ["/bin/bash", "-c", "make -C " + os.path.join(ip_dir, "verif/cocotb") + " clean && make -C " + os.path.join(ip_dir, "verif/cocotb") + " SIM=verilator TOPLEVEL_LANG=verilog BUS_TYPE=axi"]),
        RegressionJob("VHDL_AXI", ["/bin/bash", "-c", "make -C " + os.path.join(ip_dir, "verif/cocotb") + " clean && make -C " + os.path.join(ip_dir, "verif/cocotb") + " SIM=ghdl TOPLEVEL_LANG=vhdl BUS_TYPE=axi"]),
        RegressionJob("SV_WB", ["/bin/bash", "-c", "make -C " + os.path.join(ip_dir, "verif/cocotb") + " clean && make -C " + os.path.join(ip_dir, "verif/cocotb") + " SIM=verilator TOPLEVEL_LANG=verilog BUS_TYPE=wb"]),
        RegressionJob("VHDL_WB", ["/bin/bash", "-c", "make -C " + os.path.join(ip_dir, "verif/cocotb") + " clean && make -C " + os.path.join(ip_dir, "verif/cocotb") + " SIM=ghdl TOPLEVEL_LANG=vhdl BUS_TYPE=wb"]),
    ]

    print(f"Regression Started: {datetime.datetime.now()}")
    
    results = []
    for job in jobs:
        print(f"[RUNNING] {job.name}")
        log_file = os.path.join(tools_dir, f"{job.name}.log")
        with open(log_file, "w") as f:
            t_start = datetime.datetime.now()
            ret = subprocess.run(job.command, stdout=f, stderr=subprocess.STDOUT)
            t_end = datetime.datetime.now()
            duration = (t_end - t_start).total_seconds()
            
            status = "PASS" if ret.returncode == 0 else "FAIL"
            print(f"[{status}] {job.name} ({duration:.2f}s)")
            results.append((job.name, status, duration))

    # Summary
    print("\nSummary:")
    pass_count = 0
    with open(os.path.join(ip_dir, "sync_fifo_regression_results.md"), "w") as f:
        f.write("# Sync FIFO Regression Results\n\n")
        f.write("| Test | Status | Duration |\n")
        f.write("|---|---|---|\n")
        for name, status, duration in results:
            print(f"{name}: {status}")
            f.write(f"| {name} | {status} | {duration:.2f}s |\n")
            if status == "PASS":
                pass_count += 1
    
    print(f"\nTotal: {pass_count}/{len(jobs)} PASSED")

if __name__ == "__main__":
    run_regression()
