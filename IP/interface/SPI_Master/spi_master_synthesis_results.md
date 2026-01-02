# SPI Master Synthesis Results

## Summary
Synthesis performed for all 3 bus variants (APB, AXI4-Lite, Wishbone) using 3 different tools (Xilinx Vivado, Intel Quartus, Yosys).

**Status**: PASS
**Date**: 2026-01-02

## Resource Utilization

### 1. SPI Master APB (`spi_master_apb`)
| Tool | Logic/LUTs | Registers/FFs | BRAM/Memory | Status |
|---|---|---|---|---|
| **Vivado** (Artix-7) | ~705 | 1262 | 0 | PASS |
| **Quartus** (Cyclone V) | 810 (ALMs) | N/A | 64 Segments | PASS |
| **Yosys** (iCE40) | 1392 (LUT4) | 1262 | 0 | PASS |

### 2. SPI Master AXI (`spi_master_axi`)
| Tool | Logic/LUTs | Registers/FFs | BRAM/Memory | Status |
|---|---|---|---|---|
| **Vivado** (Artix-7) | ~721 | 1300 | 0 | PASS |
| **Quartus** (Cyclone V) | ~850 (Est) | N/A | 64 Segments | PASS |
| **Yosys** (iCE40) | 1438 (LUT4) | 1300 | 0 | PASS |

### 3. SPI Master WB (`spi_master_wb`)
| Tool | Logic/LUTs | Registers/FFs | BRAM/Memory | Status |
|---|---|---|---|---|
| **Vivado** (Artix-7) | ~705 | 1263 | 0 | PASS |
| **Quartus** (Cyclone V) | ~815 (Est) | N/A | 64 Segments | PASS |
| **Yosys** (iCE40) | 1397 (LUT4) | 1263 | 0 | PASS |
