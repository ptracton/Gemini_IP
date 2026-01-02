import cocotb
from cocotb.triggers import Timer, RisingEdge, ReadOnly
from cocotb.clock import Clock
import random

async def reset_dut(dut, duration_ns=50):
    dut.rst_n.value = 0
    await Timer(duration_ns, units="ns")
    dut.rst_n.value = 1
    await RisingEdge(dut.clk)

async def write_fifo(dut, data):
    # Wait if full
    while dut.tx_full.value:
        await RisingEdge(dut.clk)
    
    dut.tx_data.value = data
    dut.tx_push.value = 1
    await RisingEdge(dut.clk)
    dut.tx_push.value = 0

async def read_fifo(dut):
    # Wait if empty
    while dut.rx_empty.value:
        await RisingEdge(dut.clk)
        
    # FWFT mode: Data available when empty=0.
    # But usually need to acknowledge POP to advance?
    # spi_master_core uses sync_fifo.
    # sync_fifo typically is standard: pop advances ptr. output valid if not empty.
    # So we can read data THEN pop? Or Pop then read?
    # If FWFT, data is on rx_data immediately.
    # Check sync_fifo implementation.
    # Assuming FWFT or Standard.
    
    # Capture data
    data = dut.rx_data.value.integer
    
    # Pop
    dut.rx_pop.value = 1
    await RisingEdge(dut.clk)
    dut.rx_pop.value = 0
    return data

@cocotb.test()
async def test_spi_core_basic(dut):
    """Test basic SPI transfer via FIFOs"""
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())

    # Init
    dut.rst_n.value = 1
    dut.enable.value = 0
    dut.tx_push.value = 0
    dut.rx_pop.value = 0
    dut.cpol.value = 0
    dut.cpha.value = 0
    dut.clk_div.value = 4
    dut.word_len.value = 8
    dut.lsb_first.value = 0
    dut.loopback.value = 1 # Internal Loopback

    await reset_dut(dut)

    dut.enable.value = 1
    
    # Send Byte
    test_val = 0xA5
    await write_fifo(dut, test_val)
    
    dut._log.info(f"Wrote {hex(test_val)} to TX FIFO")
    
    # Wait for RX
    rx_val = await read_fifo(dut)
    
    dut._log.info(f"Read {hex(rx_val)} from RX FIFO")
    
    assert rx_val == test_val, f"Mismatch: {hex(rx_val)} != {hex(test_val)}"
    
    await Timer(100, units="ns")

@cocotb.test()
async def test_spi_core_random(dut):
    """Randomized SPI transfers"""
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
    
    dut.enable.value = 0
    dut.loopback.value = 1
    await reset_dut(dut)

    dut.enable.value = 1
    dut.clk_div.value = 2
    
    for i in range(20):
        val = random.randint(0, 255)
        
        # Change settings randomly between transfers?
        # Core might not support dynamic change mid-transaction easily?
        # Better change before write.
        
        await write_fifo(dut, val)
        rx_val = await read_fifo(dut)
        
        if rx_val != val:
            raise Exception(f"Mismatch iter {i}: sent {hex(val)} got {hex(rx_val)}")
            
    dut._log.info("Random Test Passed")
