# Makefile for Cocotb UART verification
# Supports AXI (default), APB, and WB via BUS= parameter

SIM ?= verilator
TOPLEVEL_LANG ?= verilog
BUS ?= AXI
COVERAGE ?= 0

PWD = $(shell pwd)
UART_ROOT = $(PWD)/../..
LIB_ROOT = $(UART_ROOT)/../../common/lib/rtl
FIFO_RTL = $(UART_ROOT)/../../common/sync_fifo/rtl

ifeq ($(TOPLEVEL_LANG),verilog)
    VERILOG_SOURCES += $(FIFO_RTL)/verilog/sync_fifo.sv
    VERILOG_SOURCES += $(UART_ROOT)/rtl/verilog/uart_core.sv
    EXTRA_ARGS += -I$(FIFO_RTL)/verilog
    
    ifeq ($(BUS),AXI)
        VERILOG_SOURCES += $(UART_ROOT)/rtl/verilog/uart_axi.sv
        VERILOG_SOURCES += $(LIB_ROOT)/axi4lite_slave_adapter.sv
        TOPLEVEL = uart_axi
    else ifeq ($(BUS),APB)
        VERILOG_SOURCES += $(UART_ROOT)/rtl/verilog/uart_apb.sv
        VERILOG_SOURCES += $(LIB_ROOT)/apb_slave_adapter.sv
        TOPLEVEL = uart_apb
    else ifeq ($(BUS),WB)
        VERILOG_SOURCES += $(UART_ROOT)/rtl/verilog/uart_wb.sv
        VERILOG_SOURCES += $(LIB_ROOT)/wb_slave_adapter.sv
        TOPLEVEL = uart_wb
    endif

else ifeq ($(TOPLEVEL_LANG),vhdl)
    VHDL_SOURCES += $(FIFO_RTL)/vhdl/sync_fifo.vhd
    VHDL_SOURCES += $(UART_ROOT)/rtl/vhdl/uart_core.vhd
    
    ifeq ($(BUS),AXI)
        VHDL_SOURCES += $(UART_ROOT)/rtl/vhdl/uart_axi.vhd
        VHDL_SOURCES += $(LIB_ROOT)/axi4lite_slave_adapter.vhd
        TOPLEVEL = uart_axi
    else ifeq ($(BUS),APB)
        VHDL_SOURCES += $(UART_ROOT)/rtl/vhdl/uart_apb.vhd
        VHDL_SOURCES += $(LIB_ROOT)/apb_slave_adapter.vhd
        TOPLEVEL = uart_apb
    else ifeq ($(BUS),WB)
        VHDL_SOURCES += $(UART_ROOT)/rtl/vhdl/uart_wb.vhd
        VHDL_SOURCES += $(LIB_ROOT)/wb_slave_adapter.vhd
        TOPLEVEL = uart_wb
    endif
endif

MODULE = test_bus
COCOTB_HDL_TIMEUNIT = 1ns
COCOTB_HDL_TIMEPRECISION = 1ps

# Verilator specific flags
ifeq ($(SIM),verilator)
    EXTRA_ARGS += --trace --trace-structs -Wno-fatal --top-module $(TOPLEVEL)
    ifeq ($(COVERAGE),1)
        EXTRA_ARGS += --coverage
    endif
endif

# Add common library to PYTHONPATH for shared drivers
export PYTHONPATH := $(PYTHONPATH):$(UART_ROOT)/../../common/lib/verif/cocotb

# Add common library to PYTHONPATH for shared drivers
export PYTHONPATH := $(PYTHONPATH):$(UART_ROOT)/../../common/lib/verif/cocotb

$(info BUS=$(BUS))
$(info TOPLEVEL_LANG=$(TOPLEVEL_LANG))
$(info TOPLEVEL=$(TOPLEVEL))
$(info VERILOG_SOURCES=$(VERILOG_SOURCES))

PLUSARGS += +BUS=$(BUS)

include $(shell cocotb-config --makefiles)/Makefile.sim
