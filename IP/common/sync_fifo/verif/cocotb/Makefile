# Makefile for Sync FIFO Verification

# Defaults
SIM ?= verilator
TOPLEVEL_LANG ?= verilog
BUS_TYPE ?= core # Not used for FIFO but kept for consistency

# Environment Setup
ifndef GEMINI_IP_ROOT
$(error GEMINI_IP_ROOT is not set. Please source setup.sh)
endif

# Common paths
IP_ROOT = $(GEMINI_IP_ROOT)/IP/common/sync_fifo

# Source Files
ifeq ($(TOPLEVEL_LANG),verilog)
    VERILOG_SOURCES = $(IP_ROOT)/rtl/verilog/sync_fifo.sv
    TOPLEVEL = sync_fifo
    EXTRA_ARGS += --trace --trace-structs -Wno-fatal
else ifeq ($(TOPLEVEL_LANG),vhdl)
    VHDL_SOURCES = $(IP_ROOT)/rtl/vhdl/sync_fifo.vhd
    TOPLEVEL = sync_fifo
    EXTRA_ARGS += --std=08
    SIM_ARGS += --vcd=dump.vcd
endif

# Cocotb Setup
MODULE = test_fifo

include $(shell cocotb-config --makefiles)/Makefile.sim
