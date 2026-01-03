#!/usr/bin/env python3
"""
Gemini_IP Top-Level Regression Runner
Executes individual IP regressions located in IP/*/tools/run_regression.py
"""

import os
import sys
import subprocess
import argparse
import time
from datetime import datetime

# Configuration
# ------------------------------------------------------------------------------
GEMINI_IP_ROOT = os.environ.get("GEMINI_IP_ROOT")
if not GEMINI_IP_ROOT:
    # Try to determine from script location if env var not set
    SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
    GEMINI_IP_ROOT = SCRIPT_DIR
    os.environ["GEMINI_IP_ROOT"] = GEMINI_IP_ROOT

IP_SEARCH_PATHS = [
    os.path.join(GEMINI_IP_ROOT, "IP", "interface"),
    os.path.join(GEMINI_IP_ROOT, "IP", "common")
]
REGRESSION_SCRIPT = os.path.join("tools", "run_regression.py")

class Colors:
    HEADER = '\033[95m'
    BLUE = '\033[94m'
    GREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'

# Discovery
# ------------------------------------------------------------------------------
def find_ips():
    """Finds all IPs containing the regression script."""
    ips = {}
    for base_path in IP_SEARCH_PATHS:
        if not os.path.exists(base_path):
            continue
        
        for item in os.listdir(base_path):
            ip_dir = os.path.join(base_path, item)
            script_path = os.path.join(ip_dir, REGRESSION_SCRIPT)
            
            if os.path.isdir(ip_dir) and os.path.isfile(script_path):
                ips[item] = ip_dir
    return ips

# Execution
# ------------------------------------------------------------------------------
def run_ip_regression(ip_name, ip_path):
    """Runs the regression script for a single IP."""
    print(f"{Colors.HEADER}================================================================{Colors.ENDC}")
    print(f"{Colors.BOLD}Running Regression for IP: {ip_name}{Colors.ENDC}")
    print(f"{Colors.HEADER}================================================================{Colors.ENDC}")
    
    script_abs_path = os.path.join(ip_path, REGRESSION_SCRIPT)
    
    # We must run from the IP root directory because the scripts assume relative paths
    start_time = time.time()
    try:
        # Using subprocess.run to execute the script and capture status
        # We allow stdout/stderr to flow through to the console so the user sees progress
        result = subprocess.run(
            [script_abs_path],
            cwd=ip_path,
            check=False
        )
        return_code = result.returncode
    except Exception as e:
        print(f"{Colors.FAIL}Error executing regression: {e}{Colors.ENDC}")
        return_code = -1
        
    duration = time.time() - start_time
    
    if return_code == 0:
        print(f"\n{Colors.GREEN}>> IP {ip_name} PASS ({duration:.2f}s){Colors.ENDC}\n")
        return True, duration
    else:
        print(f"\n{Colors.FAIL}>> IP {ip_name} FAIL (Exit Code: {return_code}) ({duration:.2f}s){Colors.ENDC}\n")
        return False, duration

# Main
# ------------------------------------------------------------------------------
def main():
    parser = argparse.ArgumentParser(description="Run regression suites for Gemini_IP blocks.")
    parser.add_argument("--ip", action="append", help="Name of the IP to run (e.g., GPIO). Can be specified multiple times.")
    parser.add_argument("--list", action="store_true", help="List available IPs and exit.")
    args = parser.parse_args()

    available_ips = find_ips()
    
    if args.list:
        print(f"{Colors.BOLD}Available IPs:{Colors.ENDC}")
        for name in sorted(available_ips.keys()):
            print(f"  - {name}")
        sys.exit(0)

    # Determine which IPs to run
    ips_to_run = []
    if args.ip:
        for requested_ip in args.ip:
            # Case-insensitive matching
            matches = [name for name in available_ips.keys() if name.lower() == requested_ip.lower()]
            if not matches:
                print(f"{Colors.WARNING}Warning: IP '{requested_ip}' not found. Skipping.{Colors.ENDC}")
            else:
                ips_to_run.extend(matches)
        # Deduplicate
        ips_to_run = sorted(list(set(ips_to_run)))
        if not ips_to_run:
            print(f"{Colors.FAIL}No valid IPs selected.{Colors.ENDC}")
            sys.exit(1)
    else:
        # Run all
        ips_to_run = sorted(available_ips.keys())

    print(f"Starting Project Regression at {datetime.now()}")
    print(f"Target IPs: {', '.join(ips_to_run)}\n")

    results = {}
    total_start = time.time()
    
    for ip_name in ips_to_run:
        passed, duration = run_ip_regression(ip_name, available_ips[ip_name])
        results[ip_name] = (passed, duration)

    total_duration = time.time() - total_start
    
    # Summary Report
    print(f"{Colors.HEADER}================================================================{Colors.ENDC}")
    print(f"{Colors.BOLD}FINAL REGRESSION SUMMARY{Colors.ENDC}")
    print(f"{Colors.HEADER}================================================================{Colors.ENDC}")
    
    all_passed = True
    print(f"{'IP Name':<20} | {'Status':<10} | {'Duration'}")
    print("-" * 45)
    
    for ip_name in sorted(results.keys()):
        passed, duration = results[ip_name]
        status_str = f"{Colors.GREEN}PASS{Colors.ENDC}" if passed else f"{Colors.FAIL}FAIL{Colors.ENDC}"
        print(f"{ip_name:<20} | {status_str:<19} | {duration:.2f}s")
        if not passed:
            all_passed = False

    print("-" * 45)
    print(f"Total Duration: {total_duration:.2f}s")
    
    if all_passed:
        print(f"\n{Colors.GREEN}OVERALL STATUS: PASS{Colors.ENDC}")
        sys.exit(0)
    else:
        print(f"\n{Colors.FAIL}OVERALL STATUS: FAIL{Colors.ENDC}")
        sys.exit(1)

if __name__ == "__main__":
    main()
