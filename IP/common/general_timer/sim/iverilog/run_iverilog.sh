# run_iverilog.sh

if [ -z "$GEMINI_IP_ROOT" ]; then
    echo "Error: GEMINI_IP_ROOT is not set."
    echo "Please source the project setup script:"
    echo "  source <path_to_gemini_ip>/setup.sh"
    exit 1
fi

IP_DIR="$GEMINI_IP_ROOT/IP"
COMMON_RTL_DIR="$IP_DIR/common/lib/rtl"
COMMON_VERIF_DIR="$IP_DIR/common/lib/verif"
TIMER_RTL_DIR="$IP_DIR/common/general_timer/rtl/verilog"
TIMER_TB_DIR="$IP_DIR/common/general_timer/tb"

# Ensure we are in the script directory
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$SCRIPT_DIR"

# Cleanup
rm -rf work
mkdir -p work

# Compile
iverilog -g2012 -I$COMMON_VERIF_DIR \
    -o work/timer_core.vvp \
    -s tb_timer_core \
    $TIMER_RTL_DIR/timer_core.sv \
    $TIMER_TB_DIR/tb_timer_core.sv

# Run
cd work
vvp timer_core.vvp || exit 1
cd ..

# Compile & Run APB
echo "--- Compiling APB Test ---"
iverilog -g2012 -I$COMMON_VERIF_DIR \
    -o work/timer_apb.vvp \
    -s tb_timer_apb \
    $COMMON_RTL_DIR/apb_slave_adapter.sv \
    $TIMER_RTL_DIR/timer_core.sv \
    $TIMER_RTL_DIR/timer_regs.sv \
    $TIMER_RTL_DIR/timer_apb.sv \
    $TIMER_TB_DIR/tb_timer_apb.sv

cd work
vvp timer_apb.vvp || exit 1
cd ..

# Compile & Run AXI
echo "--- Compiling AXI Test ---"
iverilog -g2012 -I$COMMON_VERIF_DIR \
    -o work/timer_axi.vvp \
    -s tb_timer_axi \
    $COMMON_RTL_DIR/axi4lite_slave_adapter.sv \
    $TIMER_RTL_DIR/timer_core.sv \
    $TIMER_RTL_DIR/timer_regs.sv \
    $TIMER_RTL_DIR/timer_axi.sv \
    $TIMER_TB_DIR/tb_timer_axi.sv

cd work
vvp timer_axi.vvp || exit 1
cd ..

# Compile & Run Wishbone
echo "--- Compiling Wishbone Test ---"
iverilog -g2012 -I$COMMON_VERIF_DIR \
    -o work/timer_wb.vvp \
    -s tb_timer_wb \
    $COMMON_RTL_DIR/wb_slave_adapter.sv \
    $TIMER_RTL_DIR/timer_core.sv \
    $TIMER_RTL_DIR/timer_regs.sv \
    $TIMER_RTL_DIR/timer_wb.sv \
    $TIMER_TB_DIR/tb_timer_wb.sv

cd work
vvp timer_wb.vvp || exit 1
cd ..
