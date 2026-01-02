import cocotb
from cocotb.triggers import Timer, RisingEdge, FallingEdge, ReadOnly
from cocotb.clock import Clock
import random

async def reset_dut(rst_n, duration_ns):
    rst_n.value = 0
    await Timer(duration_ns, units="ns")
    rst_n.value = 1

@cocotb.test()
async def test_spi_master_basic(dut):
    """Test basic SPI transfer in all modes"""
    
    # Start clock
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
    
    # Initial values
    dut.tx_valid.value = 0
    dut.enable.value = 0
    dut.cpol.value = 0
    dut.cpha.value = 0
    dut.clk_div.value = 4
    
    # Reset
    await reset_dut(dut.rst_n, 50)
    await RisingEdge(dut.clk)
    
    # Test all 4 modes
    for mode in range(4):
        cpol = (mode >> 1) & 1
        cpha = mode & 1
        
        dut._log.info(f"Testing Mode {mode}: CPOL={cpol}, CPHA={cpha}")
        
        dut.cpol.value = cpol
        dut.cpha.value = cpha
        dut.enable.value = 1
        
        # Random data
        test_data = random.randint(0, 255)
        miso_data = ~test_data & 0xFF
        
        # MISO loopback task
        async def loopback():
            await Timer(1, units="ns")
            while True:
                dut.miso.value = not dut.mosi.value
                await cocotb.triggers.Edge(dut.mosi)
        
        loop_task = cocotb.start_soon(loopback())
        
        # Start transfer
        await RisingEdge(dut.clk)
        dut.tx_data.value = test_data
        dut.tx_valid.value = 1
        
        await RisingEdge(dut.tx_ready)
        await RisingEdge(dut.clk)
        dut.tx_valid.value = 0
        
        # Wait for completion
        await RisingEdge(dut.rx_valid)
        
        # Check result
        received = dut.rx_data.value.integer
        dut._log.info(f"Sent: {hex(test_data)}, Received: {hex(received)}")
        assert received == miso_data, f"Data mismatch in mode {mode}!"
        
        loop_task.kill()
        dut.enable.value = 0
        await Timer(100, units="ns")

@cocotb.test()
async def test_spi_master_random(dut):
    """Randomized SPI transfers"""
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
    
    dut.tx_valid.value = 0
    dut.enable.value = 0
    dut.clk_div.value = 2
    
    await reset_dut(dut.rst_n, 50)
    
    for i in range(20):
        mode = random.randint(0, 3)
        cpol = (mode >> 1) & 1
        cpha = mode & 1
        div = random.randint(1, 10)
        
        dut.cpol.value = cpol
        dut.cpha.value = cpha
        dut.clk_div.value = div
        dut.enable.value = 1
        
        test_data = random.randint(0, 255)
        miso_data = ~test_data & 0xFF
        
        async def loopback():
            await Timer(1, units="ns")
            while True:
                dut.miso.value = not dut.mosi.value
                await cocotb.triggers.Edge(dut.mosi)
        
        loop_task = cocotb.start_soon(loopback())
        
        await RisingEdge(dut.clk)
        while not dut.tx_ready.value:
            await RisingEdge(dut.clk)
            
        dut.tx_data.value = test_data
        dut.tx_valid.value = 1
        await RisingEdge(dut.clk)
        dut.tx_valid.value = 0
        
        await RisingEdge(dut.rx_valid)
        received = dut.rx_data.value.integer
        assert received == miso_data
        
        loop_task.kill()
        await Timer(random.randint(10, 200), units="ns")
