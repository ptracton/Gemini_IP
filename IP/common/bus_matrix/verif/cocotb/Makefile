#-------------------------------------------------------------------------------
# File: Makefile
# Description: Cocotb simulation Makefile for Bus Matrix IP.
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
        VERILOG_SOURCES = $(IP_ROOT)/../../common/lib/rtl/axi4lite_slave_adapter.sv \
                          $(IP_ROOT)/rtl/verilog/bus_matrix_axi.sv \
                          $(IP_ROOT)/rtl/verilog/bus_matrix_regs.sv \
                          $(IP_ROOT)/rtl/verilog/bus_matrix_core.sv
        TOPLEVEL = bus_matrix_axi
    else ifeq ($(BUS_TYPE),APB)
        VERILOG_SOURCES = $(IP_ROOT)/../../common/lib/rtl/apb_slave_adapter.sv \
                          $(IP_ROOT)/rtl/verilog/bus_matrix_apb.sv \
                          $(IP_ROOT)/rtl/verilog/bus_matrix_regs.sv \
                          $(IP_ROOT)/rtl/verilog/bus_matrix_core.sv
        TOPLEVEL = bus_matrix_apb
    else ifeq ($(BUS_TYPE),WB)
        VERILOG_SOURCES = $(IP_ROOT)/../../common/lib/rtl/wb_slave_adapter.sv \
                          $(IP_ROOT)/rtl/verilog/bus_matrix_wb.sv \
                          $(IP_ROOT)/rtl/verilog/bus_matrix_regs.sv \
                          $(IP_ROOT)/rtl/verilog/bus_matrix_core.sv
        TOPLEVEL = bus_matrix_wb
    endif
else
    # VHDL Path
    VHDL_SOURCES = $(IP_ROOT)/rtl/vhdl/bus_matrix_regs.vhd \
                   $(IP_ROOT)/rtl/vhdl/bus_matrix_core.vhd
    ifeq ($(BUS_TYPE),AXI)
        VHDL_SOURCES += $(IP_ROOT)/../lib/rtl/axi4lite_slave_adapter.vhd \
                        $(IP_ROOT)/rtl/vhdl/bus_matrix_axi.vhd
        TOPLEVEL = bus_matrix_axi
    else ifeq ($(BUS_TYPE),APB)
        VHDL_SOURCES += $(IP_ROOT)/../lib/rtl/apb_slave_adapter.vhd \
                        $(IP_ROOT)/rtl/vhdl/bus_matrix_apb.vhd
        TOPLEVEL = bus_matrix_apb
    else ifeq ($(BUS_TYPE),WB)
        VHDL_SOURCES += $(IP_ROOT)/../lib/rtl/wb_slave_adapter.vhd \
                        $(IP_ROOT)/rtl/vhdl/bus_matrix_wb.vhd
        TOPLEVEL = bus_matrix_wb
    endif
    
    ifeq ($(SIM),ghdl)
        EXTRA_ARGS += --std=08
    endif
endif

MODULE = test_bus_matrix

# Cocotb 2.x uses PLUSARGS for command line arguments
PLUSARGS += +BUS_TYPE=$(BUS_TYPE)

SIM_BUILD = sim_build_$(TOPLEVEL_LANG)_$(BUS_TYPE)
include $(shell cocotb-config --makefiles)/Makefile.sim
