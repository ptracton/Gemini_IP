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
    # Fallback relative path
    sys.path.append(os.path.join(os.path.dirname(__file__), "../../../common/lib/verif/cocotb"))

from bus_drivers import APB_Interface

# Register Offsets
ADDR_DATA = 0x00
ADDR_SR   = 0x04
ADDR_CR   = 0x08
ADDR_CS   = 0x0C
ADDR_CR1  = 0x18

@cocotb.test()
async def test_apb_basic(dut):
    """Test APB Interface using APB_Interface Driver"""
    cocotb.start_soon(Clock(dut.pclk, 10, units="ns").start())

    # Initialize Driver
    # Prefix "p" matches standard APB naming (pclk, psel, paddr)
    apb = APB_Interface(dut, prefix="p", clk="clk", rst="resetn")
    
    # Reset
    await apb.reset()
    
    # Init other signals
    dut.dma_tx_ack.value = 0
    dut.dma_rx_ack.value = 0
    dut.spi_miso.value = 0

    # Configure CR: Enable=1, Div=4
    await apb.write(ADDR_CR, 0x0401)
    
    # Configure CR1: Loopback=1, 8-bit
    await apb.write(ADDR_CR1, 0x0208)

    
    # Send Data
    test_val = 0x55
    await apb.write(ADDR_DATA, test_val)
    
    dut._log.info(f"Wrote {hex(test_val)} to TX FIFO via APB")
    
    # Poll Status
    timeout = 1000
    rx_ready = False
    for _ in range(timeout):
        sr = await apb.read(ADDR_SR)
        if (sr & 0x02) == 0:
            rx_ready = True
            break
        await Timer(10, units="ns")
        
    assert rx_ready, "Timeout waiting for RX Data"
    
    # Read Data
    rx_val = await apb.read(ADDR_DATA)
    dut._log.info(f"Read {hex(rx_val)} from RX FIFO via APB")
    
    assert rx_val == test_val
