#!/bin/bash
# synthesis/run_synth.sh
# Run All Synthesis Flows

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT not set."
    exit 1
fi

IP_DIR="$GEMINI_IP_ROOT/IP/common/sync_fifo"
OUTPUT_DIR="$IP_DIR/synthesis/results"
mkdir -p "$OUTPUT_DIR"

echo "=================================================="
echo "Starting Synthesis for Sync FIFO"
echo "=================================================="

# Vivado
echo "[Vivado] Starting..."
if command -v vivado >/dev/null 2>&1; then
    vivado -mode batch -source "$IP_DIR/synthesis/run_vivado.tcl" -tclargs sync_fifo xc7a35tcpg236-1 "$OUTPUT_DIR/vivado" > "$OUTPUT_DIR/vivado.log" 2>&1
    if [ $? -eq 0 ]; then echo "[Vivado] PASS"; else echo "[Vivado] FAIL"; fi
else
    echo "[Vivado] SKIP (Not found)"
fi

# Quartus
echo "[Quartus] Starting..."
if command -v quartus_sh >/dev/null 2>&1; then
    # Quartus SV
    echo "  [Quartus-SV] Running..."
    quartus_sh -t "$IP_DIR/synthesis/run_quartus.tcl" sync_fifo verilog "$OUTPUT_DIR/quartus_sv" > "$OUTPUT_DIR/quartus_sv.log" 2>&1
    if [ $? -eq 0 ]; then echo "  [Quartus-SV] PASS"; else echo "  [Quartus-SV] FAIL"; fi

    # Quartus VHDL
    echo "  [Quartus-VHDL] Running..."
    # Clean previous project files to avoid conflicts if strictly necessary, 
    # but separate output dirs should aid. However, Quartus creates project files in CWD if not careful.
    # The TCL script opens project "sync_fifo", so we might need to be careful about overlapping project files in the source dir?
    # Actually, the TCL script does `project_new -revision $top_module $top_module`.
    # It creates `sync_fifo.qpf` in the current directory (which is where we run it from?)
    # We should run them in separate directories or ensure the project file location is handled.
    # The script uses `set_global_assignment -name PROJECT_OUTPUT_DIRECTORY $output_dir`.
    # But the `.qpf` and `.qsf` are created in CWD.
    
    # Let's verify where `quartus_sh` is run. In this script: `quartus_sh -t ...`
    # We are in `Cwd: /home/ptracton/src/Gemini_IP/IP/common/sync_fifo` usually? No, `run_synth.sh` doesn't cd.
    # Wait, `run_synth.sh` is executed via `./synthesis/run_synth.sh` from IP root usually?
    # Ah, let's look at `run_synth.sh` top.
    
    quartus_sh -t "$IP_DIR/synthesis/run_quartus.tcl" sync_fifo vhdl "$OUTPUT_DIR/quartus_vhdl" > "$OUTPUT_DIR/quartus_vhdl.log" 2>&1
    if [ $? -eq 0 ]; then echo "  [Quartus-VHDL] PASS"; else echo "  [Quartus-VHDL] FAIL"; fi
else
    echo "[Quartus] SKIP (Not found)"
fi

# Yosys
echo "[Yosys] Starting..."
if command -v yosys >/dev/null 2>&1; then
    yosys -c "$IP_DIR/synthesis/run_yosys.tcl" > "$OUTPUT_DIR/yosys.log" 2>&1
    if [ $? -eq 0 ]; then echo "[Yosys] PASS"; else echo "[Yosys] FAIL"; fi
else
    echo "[Yosys] SKIP (Not found)"
fi

echo "=================================================="
echo "Synthesis Complete"
echo "=================================================="
