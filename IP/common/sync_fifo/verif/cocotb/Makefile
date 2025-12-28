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
# Common paths
IP_ROOT = $(GEMINI_IP_ROOT)/IP/common/sync_fifo
LIB_ROOT = $(GEMINI_IP_ROOT)/IP/common/lib/rtl

# Source Files
ifeq ($(BUS_TYPE),apb)
    ifeq ($(TOPLEVEL_LANG),verilog)
        VERILOG_SOURCES = $(LIB_ROOT)/apb_slave_adapter.sv \
                          $(IP_ROOT)/rtl/verilog/sync_fifo.sv \
                          $(IP_ROOT)/rtl/verilog/sync_fifo_apb.sv
        TOPLEVEL = sync_fifo_apb
        EXTRA_ARGS += --trace --trace-structs -Wno-fatal -I$(LIB_ROOT) -I$(IP_ROOT)/rtl/verilog
    else ifeq ($(TOPLEVEL_LANG),vhdl)
        VHDL_SOURCES = $(LIB_ROOT)/apb_slave_adapter.vhd \
                       $(IP_ROOT)/rtl/vhdl/sync_fifo.vhd \
                       $(IP_ROOT)/rtl/vhdl/sync_fifo_apb.vhd
        TOPLEVEL = sync_fifo_apb
        EXTRA_ARGS += --std=08
        SIM_ARGS += --vcd=dump.vcd
    endif
    MODULE = test_fifo_apb

else ifeq ($(BUS_TYPE),axi)
    ifeq ($(TOPLEVEL_LANG),verilog)
        VERILOG_SOURCES = $(LIB_ROOT)/axi4lite_slave_adapter.sv \
                          $(IP_ROOT)/rtl/verilog/sync_fifo.sv \
                          $(IP_ROOT)/rtl/verilog/sync_fifo_axi.sv
        TOPLEVEL = sync_fifo_axi
        EXTRA_ARGS += --trace --trace-structs -Wno-fatal -I$(LIB_ROOT) -I$(IP_ROOT)/rtl/verilog
    else ifeq ($(TOPLEVEL_LANG),vhdl)
        VHDL_SOURCES = $(LIB_ROOT)/axi4lite_slave_adapter.vhd \
                       $(IP_ROOT)/rtl/vhdl/sync_fifo.vhd \
                       $(IP_ROOT)/rtl/vhdl/sync_fifo_axi.vhd
        TOPLEVEL = sync_fifo_axi
        EXTRA_ARGS += --std=08
        SIM_ARGS += --vcd=dump.vcd
    endif
    MODULE = test_fifo_axi

else ifeq ($(BUS_TYPE),ahb)
    ifeq ($(TOPLEVEL_LANG),verilog)
        VERILOG_SOURCES = $(LIB_ROOT)/ahb_slave_adapter.sv \
                          $(IP_ROOT)/rtl/verilog/sync_fifo.sv \
                          $(IP_ROOT)/rtl/verilog/sync_fifo_ahb.sv
        TOPLEVEL = sync_fifo_ahb
        EXTRA_ARGS += --trace --trace-structs -Wno-fatal -I$(LIB_ROOT) -I$(IP_ROOT)/rtl/verilog
    else ifeq ($(TOPLEVEL_LANG),vhdl)
        VHDL_SOURCES = $(LIB_ROOT)/ahb_slave_adapter.vhd \
                       $(IP_ROOT)/rtl/vhdl/sync_fifo.vhd \
                       $(IP_ROOT)/rtl/vhdl/sync_fifo_ahb.vhd
        TOPLEVEL = sync_fifo_ahb
        EXTRA_ARGS += --std=08
        SIM_ARGS += --vcd=dump.vcd
    endif
    MODULE = test_fifo_ahb

else ifeq ($(BUS_TYPE),wb)
    ifeq ($(TOPLEVEL_LANG),verilog)
        VERILOG_SOURCES = $(LIB_ROOT)/wb_slave_adapter.sv \
                          $(IP_ROOT)/rtl/verilog/sync_fifo.sv \
                          $(IP_ROOT)/rtl/verilog/sync_fifo_wb.sv
        TOPLEVEL = sync_fifo_wb
        EXTRA_ARGS += --trace --trace-structs -Wno-fatal -I$(LIB_ROOT) -I$(IP_ROOT)/rtl/verilog
    else ifeq ($(TOPLEVEL_LANG),vhdl)
        VHDL_SOURCES = $(LIB_ROOT)/wb_slave_adapter.vhd \
                       $(IP_ROOT)/rtl/vhdl/sync_fifo.vhd \
                       $(IP_ROOT)/rtl/vhdl/sync_fifo_wb.vhd
        TOPLEVEL = sync_fifo_wb
        EXTRA_ARGS += --std=08
        SIM_ARGS += --vcd=dump.vcd
    endif
    MODULE = test_fifo_wb

else # Default to core
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
    MODULE = test_fifo
endif

include $(shell cocotb-config --makefiles)/Makefile.sim
