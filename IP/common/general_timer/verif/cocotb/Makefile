#-------------------------------------------------------------------------------
# File: Makefile
# Description: Cocotb simulation Makefile for General Timer IP.
#
# How it operates:
# This Makefile manages the compilation and execution of Cocotb tests.
# It supports Verilator (SV) and GHDL (VHDL) simulators. User can select
# BUS_TYPE (AXI/APB/WB) and TOPLEVEL_LANG (verilog/vhdl).
#
# Usage: make BUS_TYPE=AXI SIM=verilator
# For VHDL: make BUS_TYPE=AXI SIM=ghdl TOPLEVEL_LANG=vhdl
#
# Author: Gemini-3 AI
# License: MIT
#-------------------------------------------------------------------------------

SIM ?= verilator
TOPLEVEL_LANG ?= verilog
BUS_TYPE ?= AXI

PWD=$(shell pwd)
IP_ROOT=$(PWD)/../..

ifeq ($(TOPLEVEL_LANG),verilog)
    ifeq ($(BUS_TYPE),AXI)
        VERILOG_SOURCES = $(IP_ROOT)/rtl/verilog/timer_axi.sv \
                          $(IP_ROOT)/rtl/verilog/timer_regs.sv \
                          $(IP_ROOT)/rtl/verilog/timer_core.sv
        TOPLEVEL = timer_axi
    else ifeq ($(BUS_TYPE),APB)
        VERILOG_SOURCES = $(IP_ROOT)/rtl/verilog/timer_apb.sv \
                          $(IP_ROOT)/rtl/verilog/timer_regs.sv \
                          $(IP_ROOT)/rtl/verilog/timer_core.sv
        TOPLEVEL = timer_apb
    else ifeq ($(BUS_TYPE),WB)
        VERILOG_SOURCES = $(IP_ROOT)/rtl/verilog/timer_wb.sv \
                          $(IP_ROOT)/rtl/verilog/timer_regs.sv \
                          $(IP_ROOT)/rtl/verilog/timer_core.sv
        TOPLEVEL = timer_wb
    endif
else
    # VHDL Path
    VHDL_SOURCES = $(IP_ROOT)/rtl/vhdl/timer_regs.vhd \
                   $(IP_ROOT)/rtl/vhdl/timer_core.vhd
    ifeq ($(BUS_TYPE),AXI)
        VHDL_SOURCES += $(IP_ROOT)/rtl/vhdl/timer_axi.vhd
        TOPLEVEL = timer_axi
    else ifeq ($(BUS_TYPE),APB)
        VHDL_SOURCES += $(IP_ROOT)/rtl/vhdl/timer_apb.vhd
        TOPLEVEL = timer_apb
    else ifeq ($(BUS_TYPE),WB)
        VHDL_SOURCES += $(IP_ROOT)/rtl/vhdl/timer_wb.vhd
        TOPLEVEL = timer_wb
    endif
    
    ifeq ($(SIM),ghdl)
        EXTRA_ARGS += --std=08
    endif
endif

MODULE = test_timer

# Cocotb 2.x uses PLUSARGS for command line arguments
PLUSARGS += +BUS_TYPE=$(BUS_TYPE)

SIM_BUILD = sim_build_$(TOPLEVEL_LANG)_$(BUS_TYPE)
include $(shell cocotb-config --makefiles)/Makefile.sim
