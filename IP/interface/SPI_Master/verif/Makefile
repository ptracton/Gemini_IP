# Makefile for Cocotb SPI Master

SIM ?= icarus
TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES += $(GEMINI_IP_ROOT)/IP/interface/SPI_Master/rtl/verilog/spi_master_core.sv

TOPLEVEL = spi_master_core
MODULE = tb_spi_master

include $(shell cocotb-config --makefiles)/Makefile.sim
