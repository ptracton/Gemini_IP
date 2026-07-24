#!/usr/bin/env python3
import os
import subprocess
import datetime
import sys

def check_env_var():
    if "GEMINI_IP_ROOT" not in os.environ:
        print("Error: GEMINI_IP_ROOT is not set.")
        print("Please source 'setup.sh' in the project root.")
        sys.exit(1)
    return os.environ["GEMINI_IP_ROOT"]

def run_test(test_name, script_path, working_dir):
    print(f"Running {test_name}...")
    start_time = datetime.datetime.now()
    try:
        # Run the script from the project root or its specific location
        # Adjusting to run from project root context if needed, but script expects CWD usually
        result = subprocess.run(
            [script_path],
            cwd=working_dir,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            universal_newlines=True,
            shell=True 
        )
        end_time = datetime.datetime.now()
        duration = end_time - start_time
        
        status = "PASS" if result.returncode == 0 else "FAIL"
        return {
            "name": test_name,
            "status": status,
            "duration": str(duration),
            "output": result.stdout + result.stderr
        }
    except Exception as e:
        return {
            "name": test_name,
            "status": "ERROR",
            "duration": "0:00:00",
            "output": str(e)
        }

def generate_report(results, report_path):
    with open(report_path, "w") as f:
        f.write(f"# SPI Slave Regression Results\n\n")
        f.write(f"**Date:** {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        f.write("| Test Name | Status | Duration |\n")
        f.write("| :--- | :--- | :--- |\n")
        
        pass_count = 0
        for r in results:
            status_icon = "✅" if r["status"] == "PASS" else "❌"
            f.write(f"| {r['name']} | {status_icon} {r['status']} | {r['duration']} |\n")
            if r["status"] == "PASS":
                pass_count += 1
        
        f.write(f"\n**Summary:** {pass_count}/{len(results)} Tests Passed\n\n")
        
        f.write("## Detailed Output\n\n")
        for r in results:
             if r["status"] != "PASS":
                f.write(f"### {r['name']} Output\n")
                f.write("```\n")
                # Limit output size to prevent massive logs in markdown
                f.write(r['output'][-2000:] if len(r['output']) > 2000 else r['output'])
                f.write("\n```\n\n")

def main():
    gemini_root = check_env_var()
    ip_root = os.path.join(gemini_root, "IP", "interface", "SPI_Slave")
    tools_dir = os.path.join(ip_root, "tools")
    sim_dir = os.path.join(ip_root, "sim")
    
    # Define tests to run
    # Format: (Test Name, Command String, Working Directory)
    tests = [
        # SystemVerilog (Icarus)
        ("SV Core", "iverilog -g2012 -DSIMULATION -o out/core.vvp rtl/verilog/spi_async_fifo.sv rtl/verilog/spi_slave_core.sv tb/tb_spi_slave_core.sv && vvp -l out/core.log out/core.vvp", ip_root),
        ("SV Wishbone", "iverilog -g2012 -DSIMULATION -o out/wb.vvp -I rtl/verilog rtl/verilog/spi_async_fifo.sv rtl/verilog/spi_slave_core.sv rtl/verilog/spi_slave_wb.sv tb/tb_spi_slave_wb.sv && vvp -l out/wb.log out/wb.vvp", ip_root),
        ("SV AXI4-Lite", "iverilog -g2012 -DSIMULATION -o out/axi.vvp -I rtl/verilog rtl/verilog/spi_async_fifo.sv rtl/verilog/spi_slave_core.sv rtl/verilog/spi_slave_axi.sv tb/tb_spi_slave_axi.sv && vvp -l out/axi.log out/axi.vvp", ip_root),
        ("SV AHB", "iverilog -g2012 -DSIMULATION -o out/ahb.vvp -I rtl/verilog rtl/verilog/spi_async_fifo.sv rtl/verilog/spi_slave_core.sv rtl/verilog/spi_slave_ahb.sv tb/tb_spi_slave_ahb.sv && vvp -l out/ahb.log out/ahb.vvp", ip_root),
        
        # VHDL (GHDL)
        ("VHDL Core", "ghdl -a --std=08 --workdir=sim/ghdl/work rtl/vhdl/spi_async_fifo.vhd rtl/vhdl/spi_slave_core.vhd tb/tb_spi_slave_core.vhd && ghdl -e --std=08 --workdir=sim/ghdl/work tb_spi_slave_core && ghdl -r --std=08 --workdir=sim/ghdl/work tb_spi_slave_core --stop-time=100us", ip_root),
        ("VHDL Wishbone", "ghdl -a --std=08 --workdir=sim/ghdl/work rtl/vhdl/spi_async_fifo.vhd rtl/vhdl/spi_slave_core.vhd rtl/vhdl/spi_slave_wb.vhd tb/tb_spi_slave_wb.vhd && ghdl -e --std=08 --workdir=sim/ghdl/work tb_spi_slave_wb && ghdl -r --std=08 --workdir=sim/ghdl/work tb_spi_slave_wb --stop-time=100us", ip_root),
        ("VHDL AXI4-Lite", "ghdl -a --std=08 --workdir=sim/ghdl/work rtl/vhdl/spi_async_fifo.vhd rtl/vhdl/spi_slave_core.vhd rtl/vhdl/spi_slave_axi.vhd tb/tb_spi_slave_axi.vhd && ghdl -e --std=08 --workdir=sim/ghdl/work tb_spi_slave_axi && ghdl -r --std=08 --workdir=sim/ghdl/work tb_spi_slave_axi --stop-time=100us", ip_root),
        ("VHDL AHB", "ghdl -a --std=08 --workdir=sim/ghdl/work rtl/vhdl/spi_async_fifo.vhd rtl/vhdl/spi_slave_core.vhd rtl/vhdl/spi_slave_ahb.vhd tb/tb_spi_slave_ahb.vhd && ghdl -e --std=08 --workdir=sim/ghdl/work tb_spi_slave_ahb && ghdl -r --std=08 --workdir=sim/ghdl/work tb_spi_slave_ahb --stop-time=100us", ip_root),
    ]
    
    results = []
    
    os.makedirs(os.path.join(ip_root, "out"), exist_ok=True)
    os.makedirs(os.path.join(ip_root, "sim/ghdl/work"), exist_ok=True)

    for name, cmd, work_dir in tests:
        results.append(run_test(name, cmd, work_dir))

    report_file = os.path.join(ip_root, "spi_slave_regression_results.md")
    generate_report(results, report_file)
    print(f"\nRegression complete. Report generated at: {report_file}")

if __name__ == "__main__":
    main()
