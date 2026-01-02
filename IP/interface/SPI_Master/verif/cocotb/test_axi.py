import cocotb
from cocotb.triggers import Timer, RisingEdge
from cocotb.clock import Clock
import os
import sys

# Add path for bus_drivers
gemini_root = os.environ.get("GEMINI_IP_ROOT")
if gemini_root:
    sys.path.append(os.path.join(gemini_root, "IP/common/lib/verif/cocotb"))
else:
    sys.path.append(os.path.join(os.path.dirname(__file__), "../../../common/lib/verif/cocotb"))

from bus_drivers import AXI4Lite_Interface

# Register Offsets
ADDR_DATA = 0x00
ADDR_SR   = 0x04
ADDR_CR   = 0x08
ADDR_CS   = 0x0C
ADDR_CR1  = 0x18

@cocotb.test()
async def test_axi_basic(dut):
    """Test AXI Interface using AXI4Lite_Interface Driver"""
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())

    # Initialize Driver
    # Prefix "" matches "aclk", "awaddr"
    axi = AXI4Lite_Interface(dut, prefix="")
    
    await axi.reset()
    
    dut.dma_tx_ack.value = 0
    dut.dma_rx_ack.value = 0
    dut.spi_miso.value = 0

    # Configure CR: Enable=1, Div=4
    await axi.write(ADDR_CR, 0x0401)
    
    # Configure CR1: Loopback=1, 8-bit
    await axi.write(ADDR_CR1, 0x0208)
    
    # Send Data
    test_val = 0x55
    await axi.write(ADDR_DATA, test_val)
    
    dut._log.info(f"Wrote {hex(test_val)} to TX FIFO via AXI")
    
    # Poll Status
    timeout = 1000
    rx_ready = False
    for _ in range(timeout):
        sr = await axi.read(ADDR_SR)
        if (sr & 0x02) == 0:
            rx_ready = True
            break
        await Timer(10, units="ns")
        
    assert rx_ready, "Timeout waiting for RX Data"
    
    # Read Data
    rx_val = await axi.read(ADDR_DATA)
    dut._log.info(f"Read {hex(rx_val)} from RX FIFO via AXI")
    
    assert rx_val == test_val

