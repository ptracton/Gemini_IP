import cocotb
from cocotb.triggers import RisingEdge, FallingEdge, Timer
from cocotb.clock import Clock
import random

# Import reusable bus drivers from common library
from bus_drivers import AXI4Lite_Interface, APB_Interface, Wishbone_Interface

class UART_Driver:
    def __init__(self, rxd, txd, baud_rate):
        self.rxd = rxd
        self.txd = txd
        self.bit_period = int(1e12 / baud_rate) # ps

    async def send_byte(self, data):
        self.rxd.value = 0 # Start
        await Timer(self.bit_period, units='ps')
        for i in range(8):
            self.rxd.value = (data >> i) & 1
            await Timer(self.bit_period, units='ps')
        self.rxd.value = 1 # Stop
        await Timer(self.bit_period, units='ps')

    async def receive_byte(self):
        await FallingEdge(self.txd)
        await Timer(self.bit_period // 2, units='ps')
        await Timer(self.bit_period, units='ps')
        data = 0
        for i in range(8):
            data |= (int(self.txd.value) << i)
            await Timer(self.bit_period, units='ps')
        return data

@cocotb.test()
async def test_bus_interface(dut):
    """Universal bus interface test."""
    bus_type = cocotb.plusargs.get("BUS", "AXI")
    
    if bus_type == "AXI":
        bus = AXI4Lite_Interface(dut)
        clk = dut.s_axi_aclk
    elif bus_type == "APB":
        bus = APB_Interface(dut)
        clk = dut.pclk
    elif bus_type == "WB":
        bus = Wishbone_Interface(dut)
        clk = dut.wb_clk_i
    else:
        raise ValueError(f"Unknown BUS type: {bus_type}")

    cocotb.start_soon(Clock(clk, 20, units="ns").start())
    
    # Initialize UART RXD to Idle
    dut.uart_rxd.value = 1
    
    await bus.reset()

    # 1. Config
    baud_div = 27
    await bus.write(0x0C, baud_div) # REG_BAUD
    await bus.write(0x08, 0x03)   # REG_CR (TX/RX Enable)

    # 2. UART Driver
    baud_rate = 50000000 / (16 * baud_div)
    uart = UART_Driver(dut.uart_rxd, dut.uart_txd, baud_rate)

    # 3. TX Test
    test_val = 0xA5
    rx_task = cocotb.start_soon(uart.receive_byte())
    await bus.write(0x00, test_val)
    received = await rx_task
    assert received == test_val, f"TX Mismatch: {received:02x} != {test_val:02x}"

    # 4. RX Test
    test_val = 0x5A
    dut._log.info(f"Sending 0x{test_val:02x} to RX...")
    await uart.send_byte(test_val)
    
    # Wait for RX Ready
    rx_ready = False
    for i in range(100):
        status = await bus.read(0x04)
        if status & 0x01:
            rx_ready = True
            dut._log.info(f"RX Ready detected at iter {i}, SR=0x{status:02x}")
            break
        await Timer(10, units="us")
    
    assert rx_ready, "Timeout waiting for RX Ready"
    
    received = await bus.read(0x00)
    dut._log.info(f"Read RX FIFO: 0x{received:02x}")
    assert received == test_val, f"RX Mismatch: {received:02x} != {test_val:02x}"

    dut._log.info(f"Bus {bus_type} Test Passed!")
