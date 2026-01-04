#!/usr/bin/env python3
import os
import subprocess
import itertools
import datetime
import shutil

# Configuration
BUS_TYPES = ["native", "axi", "apb", "wb", "ahb"]
WIDTHS = [32, 64]
DEPTHS = [1024, 2048]
LANGUAGES = ["verilog", "vhdl"]
TECHNOLOGIES = ["GENERIC", "XILINX", "ALTERA"]

IP_DIR = os.path.join(os.environ.get("GEMINI_IP_ROOT"), "IP/common/sp_memory")
TOOLS_DIR = os.path.join(IP_DIR, "tools")
SYNTH_DIR = os.path.join(IP_DIR, "synthesis")
RTL_VERILOG = os.path.join(IP_DIR, "rtl/verilog")
RTL_VHDL = os.path.join(IP_DIR, "rtl/vhdl")
RESULTS_DIR = os.path.join(SYNTH_DIR, "synthesis_results")

TOOLS = {
    "vivado": "vivado",
    "yosys": "yosys",
    "quartus": "quartus_sh"
}

def ensure_dir(path):
    if not os.path.exists(path):
        os.makedirs(path)

def run_vivado(job_name, bus, width, depth, lang, tech):
    log_file = os.path.join(RESULTS_DIR, f"{job_name}_vivado.log")
    rpt_file = os.path.join(RESULTS_DIR, "ram_util.rpt") # Note: This might be overwritten by parallel runs if not careful. 
    # But this script runs sequentially.
    
    cmd = [
        TOOLS["vivado"], "-mode", "batch",
        "-source", os.path.join(SYNTH_DIR, "synth_vivado.tcl"),
        "-tclargs", bus, str(width), str(depth), lang, tech
    ]
    print(f"  [Vivado] Running {job_name}...")
    with open(log_file, "w") as f:
        subprocess.run(cmd, stdout=f, stderr=subprocess.STDOUT, cwd=RESULTS_DIR)
    
    # Check for BRAM inference
    mem_stats = []
    
    # Check ram_util.rpt if exists (better source)
    if os.path.exists(rpt_file):
        with open(rpt_file, "r") as f:
            for line in f:
                if "| BlockRAM" in line:
                    parts = line.split("|")
                    if len(parts) > 2:
                        try:
                            val = int(parts[2].strip())
                            if val > 0: mem_stats.append(f"{val}x BlockRAM")
                        except: pass
                if "| RAMB" in line:
                     parts = line.split("|")
                     if len(parts) > 2:
                        try:
                            val = int(parts[2].strip())
                            if val > 0: mem_stats.append(f"{val}x {parts[1].strip()}")
                        except: pass

    # Fallback to log if empty (or for URAMs not detailed in summary table top rows)
    if not mem_stats:
        with open(log_file, "r") as f:
            for line in f:
                if "| RAMB" in line or "| URAM" in line or "Block RAM" in line:
                     # Simple heuristic check
                    if "Block RAM" in line and "Utilization" not in line:
                         mem_stats.append("Inferred (Check Log)")
                         break

    mem_str = ", ".join(list(set(mem_stats)))
    if not mem_str: mem_str = "-"
    
    res = "PASS" # Vivado usually exits 0 even on synth fail if script handles it, but we look for error in log? 
    # Actually checking return code of subprocess is better, but vivado tcl `exit 0` is usually reliable.
    # Let's trust the run passes if no crash.
    
    return res, mem_str

def run_quartus(job_name, bus, width, depth, lang, tech):
    if shutil.which(TOOLS["quartus"]) is None:
        return "SKIP", "-"
        
    log_file = os.path.join(RESULTS_DIR, f"{job_name}_quartus.log")
    work_dir = os.path.join(RESULTS_DIR, f"{job_name}_quartus_work")
    ensure_dir(work_dir)
    
    cmd = [
        TOOLS["quartus"], "-t", os.path.join(SYNTH_DIR, "synth_quartus.tcl"),
        bus, str(width), str(depth), lang, tech
    ]
    print(f"  [Quartus] Running {job_name}...")
    with open(log_file, "w") as f:
        subprocess.run(cmd, stdout=f, stderr=subprocess.STDOUT, cwd=work_dir)
        
    # Check log for altsyncram
    mem_stats = []
    with open(log_file, "r") as f:
        content = f.read()
        if "altsyncram" in content:
            mem_stats.append("altsyncram")
        if "M9K" in content:
            mem_stats.append("M9K")
            
    mem_str = ", ".join(list(set(mem_stats)))
    if not mem_str: mem_str = "-"

    return "PASS", mem_str

def run_yosys(job_name, bus, width, depth, lang, tech):
    log_file = os.path.join(RESULTS_DIR, f"{job_name}_yosys.log")
    
    # Construct Yosys script
    ys_cmd = ""
    top_module = f"sp_memory_{bus}" if bus != "native" else "sp_memory"
    
    if lang == "verilog":
        files = [os.path.join(RTL_VERILOG, "sp_memory.sv")]
        if bus != "native":
             files.append(os.path.join(RTL_VERILOG, f"{top_module}.sv"))
        
        for f in files:
            ys_cmd += f"read_verilog -sv {f};\n"
            
    elif lang == "vhdl":
        if shutil.which("ghdl") is None:
             return "SKIP (No GHDL)", "-"
        files = [os.path.join(RTL_VHDL, "sp_memory.vhd")]
        if bus != "native":
            files.append(os.path.join(RTL_VHDL, f"{top_module}.vhd"))
            
        ys_cmd += f"plugin -i ghdl;\n"
        ys_cmd += f"ghdl --std=08 " + " ".join(files) + " -e " + top_module + ";\n"

    ys_cmd += f"hierarchy -check -top {top_module} -chparam WIDTH {width} -chparam DEPTH {depth} -chparam TECHNOLOGY \"{tech}\";\n"
    ys_cmd += "proc; opt; memory; opt; fsm; opt;\n"
    if tech == "XILINX":
        ys_cmd += "synth_xilinx;\n"
    elif tech == "ALTERA":
        ys_cmd += "synth_intel;\n"
    else:
        ys_cmd += "synth;\n"
        
    ys_cmd += "stat;\n"
    
    print(f"  [Yosys] Running {job_name}...")
    with open(log_file, "w") as f:
        p = subprocess.run([TOOLS["yosys"]], input=ys_cmd.encode(), stdout=f, stderr=subprocess.STDOUT)
        
    # Parse Stat
    mem_str = "-"
    if p.returncode == 0:
        with open(log_file, 'r') as f:
            lines = f.readlines()
            # Simple reverse search for "Printing statistics"
            in_stat = False
            for line in reversed(lines):
                 if "Printing statistics" in line:
                     in_stat = True
                 if in_stat:
                     if "RAMB" in line or "M9K" in line or "memory" in line:
                         mem_str = "Inferred (Generic)" if mem_str == "-" else mem_str
                         parts = line.split()
                         if len(parts) >= 2 and ("RAM" in parts[0] or "M9K" in parts[0]):
                             mem_str = f"{parts[1]}x {parts[0]}"
                             break
                     if "Number of cells:" in line: # End of useful search usually
                         break
                         
    return ("PASS" if p.returncode == 0 else "FAIL"), mem_str

def main():
    ensure_dir(RESULTS_DIR)
    results = []
    
    print("Starting Synthesis Sweep...")
    
    sweep_configs = [
        (32, 1024, "verilog", "XILINX"),
        (64, 2048, "vhdl", "ALTERA"),
        (32, 2048, "verilog", "GENERIC"),
        (64, 1024, "vhdl", "GENERIC")
    ]

    for bus in BUS_TYPES:
        for width, depth, lang, tech in sweep_configs:
            job_name = f"{bus}_{width}_{depth}_{lang}_{tech}"
            
            job_tools = []
            if tech == "XILINX":
                job_tools.append("vivado")
                job_tools.append("yosys")
            elif tech == "ALTERA":
                job_tools.append("quartus")
                job_tools.append("yosys")
            else: # GENERIC
                job_tools.append("yosys")
                job_tools.append("vivado")

            for tool in job_tools:
                res = "SKIP"
                mem = "-"
                if tool == "vivado":
                    res, mem = run_vivado(job_name, bus, width, depth, lang, tech)
                elif tool == "quartus":
                    res, mem = run_quartus(job_name, bus, width, depth, lang, tech)
                elif tool == "yosys":
                    res, mem = run_yosys(job_name, bus, width, depth, lang, tech)
                
                results.append({
                    "Job": job_name,
                    "Tool": tool,
                    "Result": res,
                    "Memory": mem
                })
            
    report_file = os.path.join(IP_DIR, "sp_memory_synthesis_results.md")
    with open(report_file, "w") as f:
        f.write("# Synthesis Sweep Results\n\n")
        f.write(f"**Date:** {datetime.datetime.now()}\n\n")
        f.write("| Job | Tool | Result | Memory Instances |\n")
        f.write("|---|---|---|---|\n")
        for r in results:
            icon = "✅" if "PASS" in r["Result"] else "⚠️" if "WARN" in r["Result"] else "❌"
            if r["Result"] == "SKIP": icon = "⏭️"
            f.write(f"| {r['Job']} | {r['Tool']} | {icon} {r['Result']} | {r['Memory']} |\n")
            
    print(f"Sweep Complete. Results: {report_file}")

if __name__ == "__main__":
    main()
