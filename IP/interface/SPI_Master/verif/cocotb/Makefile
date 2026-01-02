#-------------------------------------------------------------------------------
# File: Makefile
# Description: Cocotb simulation Makefile for SPI Master IP.
#
# Usage:
#   make BUS_TYPE=CORE SIM=verilator
#   make BUS_TYPE=APB
#   make BUS_TYPE=AXI
#   make BUS_TYPE=WB
#
#-------------------------------------------------------------------------------

SIM ?= verilator
TOPLEVEL_LANG ?= verilog
BUS_TYPE ?= CORE
FIFO_DEPTH ?= 16

ifndef GEMINI_IP_ROOT
$(error GEMINI_IP_ROOT is not set. Please source setup.sh)
endif

IP_ROOT = $(GEMINI_IP_ROOT)/IP/interface/SPI_Master
SHARED_RTL_DIR = $(GEMINI_IP_ROOT)/IP/common/lib/rtl
SYNC_FIFO_DIR = $(GEMINI_IP_ROOT)/IP/common/sync_fifo/rtl/verilog

# Source Compilation
ifeq ($(TOPLEVEL_LANG),verilog)
    # Common sources
    COMMON_SOURCES = $(SYNC_FIFO_DIR)/sync_fifo.sv \
                     $(IP_ROOT)/rtl/verilog/spi_master_core.sv

    ifeq ($(BUS_TYPE),CORE)
        VERILOG_SOURCES = $(COMMON_SOURCES)
        TOPLEVEL = spi_master_core
        MODULE = test_core
    else ifeq ($(BUS_TYPE),APB)
        VERILOG_SOURCES = $(COMMON_SOURCES) \
                          $(SHARED_RTL_DIR)/apb_slave_adapter.sv \
                          $(IP_ROOT)/rtl/verilog/spi_master_registers.sv \
                          $(IP_ROOT)/rtl/verilog/spi_master_apb.sv
        TOPLEVEL = spi_master_apb
        MODULE = test_apb
    else ifeq ($(BUS_TYPE),AXI)
        VERILOG_SOURCES = $(COMMON_SOURCES) \
                          $(SHARED_RTL_DIR)/axi4lite_slave_adapter.sv \
                          $(IP_ROOT)/rtl/verilog/spi_master_registers.sv \
                          $(IP_ROOT)/rtl/verilog/spi_master_axi.sv
        TOPLEVEL = spi_master_axi
        MODULE = test_axi
    else ifeq ($(BUS_TYPE),WB)
        VERILOG_SOURCES = $(COMMON_SOURCES) \
                          $(SHARED_RTL_DIR)/wb_slave_adapter.sv \
                          $(IP_ROOT)/rtl/verilog/spi_master_registers.sv \
                          $(IP_ROOT)/rtl/verilog/spi_master_wb.sv
        TOPLEVEL = spi_master_wb
        MODULE = test_wb
    endif
endif

# Parameters
ifeq ($(TOPLEVEL_LANG),verilog)
    COMPILE_ARGS += -GFIFO_DEPTH=$(FIFO_DEPTH)
    # Add include path for adapters/headers if needed
    COMPILE_ARGS += +incdir+$(SHARED_RTL_DIR)
endif

SIM_BUILD = sim_build_$(BUS_TYPE)

include $(shell cocotb-config --makefiles)/Makefile.sim
