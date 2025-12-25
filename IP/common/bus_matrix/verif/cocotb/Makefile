#-------------------------------------------------------------------------------
# File: Makefile
# Description: Cocotb Makefile for Bus Matrix IP.
#-------------------------------------------------------------------------------

SIM ?= verilator
TOPLEVEL_LANG ?= verilog

# Default to AXI
BUS_TYPE ?= AXI

ifeq ($(BUS_TYPE),AXI)
    DUT = bus_matrix_axi
    VERILOG_SOURCES += $(GEMINI_IP_ROOT)/IP/common/bus_matrix/rtl/verilog/bus_matrix_axi.sv
else ifeq ($(BUS_TYPE),AHB)
    DUT = bus_matrix_ahb
    VERILOG_SOURCES += $(GEMINI_IP_ROOT)/IP/common/bus_matrix/rtl/verilog/bus_matrix_ahb.sv
else ifeq ($(BUS_TYPE),WB)
    DUT = bus_matrix_wb
    VERILOG_SOURCES += $(GEMINI_IP_ROOT)/IP/common/bus_matrix/rtl/verilog/bus_matrix_wb.sv
endif

# Common Sources
VERILOG_SOURCES += $(GEMINI_IP_ROOT)/IP/common/bus_matrix/rtl/verilog/bus_matrix_pkg.sv
VERILOG_SOURCES += $(GEMINI_IP_ROOT)/IP/common/bus_matrix/rtl/verilog/bus_matrix_decoder.sv
VERILOG_SOURCES += $(GEMINI_IP_ROOT)/IP/common/bus_matrix/rtl/verilog/bus_matrix_arbiter.sv

TOPLEVEL = $(DUT)
MODULE = test_bus_matrix

# Parameters
EXTRA_ARGS += -GN_MASTERS=2 -GM_SLAVES=2
PLUSARGS += +BUS_TYPE=$(BUS_TYPE)

include $(shell cocotb-config --makefiles)/Makefile.sim
