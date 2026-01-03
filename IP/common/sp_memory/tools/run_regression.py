#!/usr/bin/env python3
# Single Port Memory Regression Script

import os
import subprocess
import datetime
import sys

class RegressionJob:
    def __init__(self, name, command):
        self.name = name
        self.command = command

def run_regression():
    if "GEMINI_IP_ROOT" not in os.environ:
        print("Error: GEMINI_IP_ROOT not set.")
        return

    root_dir = os.environ["GEMINI_IP_ROOT"]
    ip_dir = os.path.join(root_dir, "IP/common/sp_memory")
    tools_dir = os.path.join(ip_dir, "tools")
    verif_dir = os.path.join(ip_dir, "verif/cocotb")
    sim_dir = os.path.join(ip_dir, "sim")
    
    iverilog_script = os.path.join(sim_dir, "iverilog/run_iverilog.sh")
    ghdl_script     = os.path.join(sim_dir, "ghdl/run_ghdl.sh")
    xilinx_script   = os.path.join(sim_dir, "xilinx/run_xilinx.sh")
    
    # Define Jobs
    jobs = [
        # Native Icarus Tests (via script)
        RegressionJob("Native_SV",      [iverilog_script, "Native_SV"]),
        RegressionJob("Native_SV_AXI",  [iverilog_script, "Native_SV_AXI"]),
        RegressionJob("Native_SV_APB",  [iverilog_script, "Native_SV_APB"]),
        RegressionJob("Native_SV_WB",   [iverilog_script, "Native_SV_WB"]),
        RegressionJob("Native_SV_AHB",  [iverilog_script, "Native_SV_AHB"]),

        # Native GHDL Tests (via script)
        RegressionJob("Native_VHDL",    [ghdl_script, "Native_VHDL"]),

        # Xilinx Tests (via script)
        RegressionJob("Xilinx_SV_Native", [xilinx_script, "Xilinx_SV_Native"]),
        RegressionJob("Xilinx_SV_AXI",    [xilinx_script, "Xilinx_SV_AXI"]),
        RegressionJob("Xilinx_VHDL_AXI",  [xilinx_script, "Xilinx_VHDL_AXI"]),

        # Cocotb Tests
        RegressionJob("SV_Core_32",   ["/bin/bash", "-c", f"cd {verif_dir} && make clean && make SIM=verilator TOPLEVEL_LANG=verilog WIDTH=32"]),
        RegressionJob("SV_Core_128",  ["/bin/bash", "-c", f"cd {verif_dir} && make clean && make SIM=verilator TOPLEVEL_LANG=verilog WIDTH=128"]),
        RegressionJob("VHDL_Core_32",  ["/bin/bash", "-c", f"cd {verif_dir} && make clean && make SIM=ghdl TOPLEVEL_LANG=vhdl WIDTH=32"]),
        RegressionJob("VHDL_Core_128", ["/bin/bash", "-c", f"cd {verif_dir} && make clean && make SIM=ghdl TOPLEVEL_LANG=vhdl WIDTH=128"]),
        
        # Bus Tests - AXI
        RegressionJob("SV_AXI_32",  ["/bin/bash", "-c", f"cd {verif_dir} && make clean && make SIM=verilator TOPLEVEL_LANG=verilog BUS_TYPE=axi WIDTH=32"]),
        RegressionJob("VHDL_AXI_32", ["/bin/bash", "-c", f"cd {verif_dir} && make clean && make SIM=ghdl TOPLEVEL_LANG=vhdl BUS_TYPE=axi WIDTH=32"]),
        
        # Bus Tests - APB
        RegressionJob("SV_APB_32",  ["/bin/bash", "-c", f"cd {verif_dir} && make clean && make SIM=verilator TOPLEVEL_LANG=verilog BUS_TYPE=apb WIDTH=32"]),
        RegressionJob("VHDL_APB_32", ["/bin/bash", "-c", f"cd {verif_dir} && make clean && make SIM=ghdl TOPLEVEL_LANG=vhdl BUS_TYPE=apb WIDTH=32"]),
        
        # Bus Tests - Wishbone
        RegressionJob("SV_WB_32",   ["/bin/bash", "-c", f"cd {verif_dir} && make clean && make SIM=verilator TOPLEVEL_LANG=verilog BUS_TYPE=wb WIDTH=32"]),
        RegressionJob("VHDL_WB_32",  ["/bin/bash", "-c", f"cd {verif_dir} && make clean && make SIM=ghdl TOPLEVEL_LANG=vhdl BUS_TYPE=wb WIDTH=32"]),
        
        # Bus Tests - AHB
        RegressionJob("SV_AHB_32",  ["/bin/bash", "-c", f"cd {verif_dir} && make clean && make SIM=verilator TOPLEVEL_LANG=verilog BUS_TYPE=ahb WIDTH=32"]),
        RegressionJob("VHDL_AHB_32", ["/bin/bash", "-c", f"cd {verif_dir} && make clean && make SIM=ghdl TOPLEVEL_LANG=vhdl BUS_TYPE=ahb WIDTH=32"]),
    ]

    print(f"Regression Started: {datetime.datetime.now()}")
    
    results = []
    
    # Ensure results directory exists
    if not os.path.exists(tools_dir):
        os.makedirs(tools_dir)

    for job in jobs:
        print(f"[RUNNING] {job.name}")
        log_file = os.path.join(tools_dir, f"{job.name}.log")
        with open(log_file, "w") as f:
            t_start = datetime.datetime.now()
            # Run command
            ret = subprocess.run(job.command, stdout=f, stderr=subprocess.STDOUT)
            t_end = datetime.datetime.now()
            duration = (t_end - t_start).total_seconds()
            
            status = "PASS" if ret.returncode == 0 else "FAIL"
            print(f"[{status}] {job.name} ({duration:.2f}s)")
            results.append((job.name, status, duration))

    # Summary Generation
    print("\nSummary:")
    pass_count = 0
    report_path = os.path.join(ip_dir, "sp_memory_regression_results.md")
    
    with open(report_path, "w") as f:
        f.write("# Single Port Memory (sp_memory) Regression Results\n\n")
        f.write(f"**Date:** {datetime.datetime.now()}\n\n")
        f.write("| Test Name | Status | Duration (s) |\n")
        f.write("|---|---|---|\n")
        for name, status, duration in results:
            icon = "✅" if status == "PASS" else "❌"
            f.write(f"| {icon} {name} | **{status}** | {duration:.2f} |\n")
            if status == "PASS":
                pass_count += 1
    
    print(f"\nTotal: {pass_count}/{len(jobs)} PASSED")
    print(f"Report generated at: {report_path}")
    
    if pass_count != len(jobs):
        sys.exit(1)

if __name__ == "__main__":
    run_regression()
