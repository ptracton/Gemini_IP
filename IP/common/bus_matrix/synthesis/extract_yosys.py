import os
import re

gemini_ip_root = os.environ.get("GEMINI_IP_ROOT", "")
results_dir = os.path.join(gemini_ip_root, "IP/common/bus_matrix/synthesis/results")
modules = ["bus_matrix_ahb_verilog", "bus_matrix_axi_verilog", "bus_matrix_wb_verilog", "ahb_apb_bridge_verilog"]

print("| Module | LUTs | Registers |")
print("| :--- | :--- | :--- |")

for mod in modules:
    log_path = os.path.join(results_dir, mod, "yosys.log")
    if os.path.exists(log_path):
        with open(log_path, "r") as f:
            content = f.read()
            # Find the last "design hierarchy" section
            hierarchy_sections = content.split("=== design hierarchy ===")
            if len(hierarchy_sections) > 1:
                last_section = hierarchy_sections[-1]
                
                # Extract counts
                luts = 0
                regs = 0
                
                # LUTs are typically LUT[1-6]
                lut_matches = re.findall(r"(\d+)\s+LUT[1-6]", last_section)
                luts = sum(int(x) for x in lut_matches)
                
                # Registers are Typically FDCE, FDRE, etc.
                reg_matches = re.findall(r"(\d+)\s+FD[C|R|P|S][E|P]", last_section)
                regs = sum(int(x) for x in reg_matches)
                
                print(f"| {mod.replace('_verilog', '')} | {luts} | {regs} |")
            else:
                print(f"| {mod} | N/A | N/A |")
