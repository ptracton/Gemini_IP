# Makefile for SPI Master Formal Verification

.PHONY: all formal formal_core formal_apb formal_axi formal_wb clean

all: formal

formal: formal_core formal_apb formal_axi formal_wb

formal_core:
	@echo "Running formal verification for SPI Master Core..."
	sby -f spi_master_core.sby

formal_apb:
	@echo "Running formal verification for APB wrapper..."
	sby -f spi_master_apb.sby

formal_axi:
	@echo "Running formal verification for AXI wrapper..."
	sby -f spi_master_axi.sby

formal_wb:
	@echo "Running formal verification for Wishbone wrapper..."
	sby -f spi_master_wb.sby

clean:
	rm -rf spi_master_core/ spi_master_apb/ spi_master_axi/ spi_master_wb/

help:
	@echo "SPI Master Formal Verification Makefile"
	@echo ""
	@echo "Targets:"
	@echo "  formal       - Run all formal verification (default)"
	@echo "  formal_core  - Verify SPI Master core only"
	@echo "  formal_apb   - Verify APB wrapper"
	@echo "  formal_axi   - Verify AXI wrapper"
	@echo "  formal_wb    - Verify Wishbone wrapper"
	@echo "  clean        - Remove verification artifacts"
	@echo "  help         - Show this help message"
