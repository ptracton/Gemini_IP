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
    # Format: (Test Name, Script Path relative to CWD or Absolute, Working Directory)
    tests = [
        ("Icarus Verilog System", os.path.join(sim_dir, "iverilog", "run_iverilog.sh"), gemini_root),
        ("GHDL VHDL System", os.path.join(sim_dir, "ghdl", "run_ghdl.sh"), gemini_root),
    ]
    
    results = []
    
    for name, script, work_dir in tests:
        if os.path.exists(script):
             results.append(run_test(name, script, work_dir))
        else:
            results.append({
                "name": name, 
                "status": "SKIPPED", 
                "duration": "0", 
                "output": f"Script not found: {script}"
            })

    report_file = os.path.join(ip_root, "spi_slave_regression_results.md")
    generate_report(results, report_file)
    print(f"\nRegression complete. Report generated at: {report_file}")

if __name__ == "__main__":
    main()
