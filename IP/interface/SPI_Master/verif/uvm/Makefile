export GEMINI_IP_ROOT ?= $(shell pwd)/../../../../..

# Directories
UVM_DIR = $(GEMINI_IP_ROOT)/IP/interface/SPI_Master/verif/uvm
COMMON_UVM_DIR = $(GEMINI_IP_ROOT)/IP/common/lib/verif/uvm
RTL_DIR = $(GEMINI_IP_ROOT)/IP/interface/SPI_Master/rtl/verilog
COMMON_RTL_DIR = $(GEMINI_IP_ROOT)/IP/common/lib/rtl
FIFO_RTL_DIR = $(GEMINI_IP_ROOT)/IP/common/sync_fifo/rtl/verilog

# Tools
XVLOG = xvlog
XELAB = xelab
XSIM  = xsim
TEST ?= spi_master_base_test

# Flags
XVLOG_FLAGS = -sv -L uvm \
	--include $(UVM_DIR)/agents/spi_agent \
	--include $(UVM_DIR)/env \
	--include $(COMMON_UVM_DIR)/agents/apb_agent \
	--include $(UVM_DIR)/tests

XELAB_FLAGS = -L uvm -timescale 1ns/1ps -debug typical

# Targets
all: clean comp elab run

comp:
	# Compile Interfaces (Order matters?)
	$(XVLOG) $(XVLOG_FLAGS) $(UVM_DIR)/agents/spi_agent/spi_if.sv
	$(XVLOG) $(XVLOG_FLAGS) $(COMMON_UVM_DIR)/agents/apb_agent/apb_if.sv
	$(XVLOG) $(XVLOG_FLAGS) $(UVM_DIR)/tb/dma_if.sv
	
	# Compile Packages
	$(XVLOG) $(XVLOG_FLAGS) $(UVM_DIR)/agents/spi_agent/spi_agent_pkg.sv
	$(XVLOG) $(XVLOG_FLAGS) $(COMMON_UVM_DIR)/agents/apb_agent/apb_agent_pkg.sv
	
	# Compile Env & Tests
	$(XVLOG) $(XVLOG_FLAGS) $(UVM_DIR)/env/spi_master_env_pkg.sv 
	$(XVLOG) $(XVLOG_FLAGS) $(UVM_DIR)/tests/spi_master_test_pkg.sv

	# Compile RTL
	$(XVLOG) $(XVLOG_FLAGS) $(FIFO_RTL_DIR)/sync_fifo.sv
	$(XVLOG) $(XVLOG_FLAGS) $(COMMON_RTL_DIR)/apb_slave_adapter.sv
	$(XVLOG) $(XVLOG_FLAGS) $(RTL_DIR)/spi_master_registers.sv
	$(XVLOG) $(XVLOG_FLAGS) $(RTL_DIR)/spi_master_core.sv
	$(XVLOG) $(XVLOG_FLAGS) $(RTL_DIR)/spi_master_apb.sv
	
	# Compile TB
	$(XVLOG) $(XVLOG_FLAGS) $(UVM_DIR)/tb/tb_top.sv

elab:
	$(XELAB) $(XELAB_FLAGS) --cc_type sbct --cc_db spi_master_cc --cc_dir ./cov_db tb_top -s top_sim

run:
	$(XSIM) top_sim -testplusarg "UVM_TESTNAME=$(TEST)" -R

clean:
	rm -rf xsim.dir *.log *.pb *.jou *.wdb .Xil
