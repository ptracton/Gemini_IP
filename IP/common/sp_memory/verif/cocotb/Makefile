# Makefile for Cocotb simulation of sp_memory

ifndef GEMINI_IP_ROOT
$(error GEMINI_IP_ROOT environment variable not set)
endif

# Default Simulator based on Language
TOPLEVEL_LANG ?= verilog

ifeq ($(TOPLEVEL_LANG),verilog)
    SIM ?= verilator
else ifeq ($(TOPLEVEL_LANG),vhdl)
    SIM ?= ghdl
endif



# Default parameters
WIDTH ?= 32
DEPTH ?= 1024
TECHNOLOGY ?= GENERIC
BUS_TYPE ?= core

# Source Selection based on Language and Bus Type
ifeq ($(TOPLEVEL_LANG),verilog)
    SIM ?= verilator
    
    ifeq ($(SIM),icarus)
        COMPILE_ARGS += -P$(TOPLEVEL).WIDTH=$(WIDTH)
        COMPILE_ARGS += -P$(TOPLEVEL).DEPTH=$(DEPTH)
        COMPILE_ARGS += -P$(TOPLEVEL).TECHNOLOGY=\"$(TECHNOLOGY)\"
    else ifeq ($(SIM),verilator)
        EXTRA_ARGS += -GWIDTH=$(WIDTH)
        EXTRA_ARGS += -GDEPTH=$(DEPTH)
        EXTRA_ARGS += -GTECHNOLOGY=\"$(TECHNOLOGY)\"
        EXTRA_ARGS += --Wno-fatal
    endif
    
    ifeq ($(BUS_TYPE),core)
        VERILOG_SOURCES += $(GEMINI_IP_ROOT)/IP/common/sp_memory/rtl/verilog/sp_memory.sv
        TOPLEVEL = sp_memory
    else ifeq ($(BUS_TYPE),axi)
        VERILOG_SOURCES += $(GEMINI_IP_ROOT)/IP/common/sp_memory/rtl/verilog/sp_memory.sv
        VERILOG_SOURCES += $(GEMINI_IP_ROOT)/IP/common/sp_memory/rtl/verilog/sp_memory_axi.sv
        TOPLEVEL = sp_memory_axi
    else ifeq ($(BUS_TYPE),apb)
        VERILOG_SOURCES += $(GEMINI_IP_ROOT)/IP/common/sp_memory/rtl/verilog/sp_memory.sv
        VERILOG_SOURCES += $(GEMINI_IP_ROOT)/IP/common/sp_memory/rtl/verilog/sp_memory_apb.sv
        TOPLEVEL = sp_memory_apb
    else ifeq ($(BUS_TYPE),wb)
        VERILOG_SOURCES += $(GEMINI_IP_ROOT)/IP/common/sp_memory/rtl/verilog/sp_memory.sv
        VERILOG_SOURCES += $(GEMINI_IP_ROOT)/IP/common/sp_memory/rtl/verilog/sp_memory_wb.sv
        TOPLEVEL = sp_memory_wb
    else ifeq ($(BUS_TYPE),ahb)
        VERILOG_SOURCES += $(GEMINI_IP_ROOT)/IP/common/sp_memory/rtl/verilog/sp_memory.sv
        VERILOG_SOURCES += $(GEMINI_IP_ROOT)/IP/common/sp_memory/rtl/verilog/sp_memory_ahb.sv
        TOPLEVEL = sp_memory_ahb
    endif

else ifeq ($(TOPLEVEL_LANG),vhdl)
    SIM = ghdl
    SIM_ARGS += -gWIDTH=$(WIDTH)
    SIM_ARGS += -gDEPTH=$(DEPTH)
    SIM_ARGS += -gTECHNOLOGY=$(TECHNOLOGY)
    
    ifeq ($(BUS_TYPE),core)
        VHDL_SOURCES += $(GEMINI_IP_ROOT)/IP/common/sp_memory/rtl/vhdl/sp_memory.vhd
        TOPLEVEL = sp_memory
    else ifeq ($(BUS_TYPE),axi)
        VHDL_SOURCES += $(GEMINI_IP_ROOT)/IP/common/sp_memory/rtl/vhdl/sp_memory.vhd
        VHDL_SOURCES += $(GEMINI_IP_ROOT)/IP/common/sp_memory/rtl/vhdl/sp_memory_axi.vhd
        TOPLEVEL = sp_memory_axi
    else ifeq ($(BUS_TYPE),apb)
        VHDL_SOURCES += $(GEMINI_IP_ROOT)/IP/common/sp_memory/rtl/vhdl/sp_memory.vhd
        VHDL_SOURCES += $(GEMINI_IP_ROOT)/IP/common/sp_memory/rtl/vhdl/sp_memory_apb.vhd
        TOPLEVEL = sp_memory_apb
    else ifeq ($(BUS_TYPE),wb)
        VHDL_SOURCES += $(GEMINI_IP_ROOT)/IP/common/sp_memory/rtl/vhdl/sp_memory.vhd
        VHDL_SOURCES += $(GEMINI_IP_ROOT)/IP/common/sp_memory/rtl/vhdl/sp_memory_wb.vhd
        TOPLEVEL = sp_memory_wb
    else ifeq ($(BUS_TYPE),ahb)
        VHDL_SOURCES += $(GEMINI_IP_ROOT)/IP/common/sp_memory/rtl/vhdl/sp_memory.vhd
        VHDL_SOURCES += $(GEMINI_IP_ROOT)/IP/common/sp_memory/rtl/vhdl/sp_memory_ahb.vhd
        TOPLEVEL = sp_memory_ahb
    endif
endif



ifeq ($(BUS_TYPE),core)
    COCOTB_TEST_MODULES = test_sp_memory
else
    COCOTB_TEST_MODULES = test_sp_memory_bus
endif

include $(shell cocotb-config --makefiles)/Makefile.sim
