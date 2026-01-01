import cocotb
from cocotb.triggers import Timer, RisingEdge, FallingEdge
from cocotb.clock import Clock
import random

# AXI4-Lite Register Map
REG_DR    = 0x00
REG_SR    = 0x04
REG_CR    = 0x08
REG_BAUD  = 0x0C
REG_ISR   = 0x10
REG_IMR   = 0x14

class UART_Driver:
    """Helper class to drive/monitor UART physical pins."""
    def __init__(self, rxd, txd, baud_rate, clk_freq=50000000):
        self.rxd = rxd
        self.txd = txd
        self.bit_period = int(1e12 / baud_rate) # in ps
        self.clk_freq = clk_freq

    async def send_byte(self, data, parity=None, stop_bits=1):
        """Send a byte over UART RXD pin."""
        # Start bit
        self.rxd.value = 0
        await Timer(self.bit_period, units='ps')

        # Data bits (LSB first)
        p = 0
        for i in range(8):
            bit = (data >> i) & 1
            self.rxd.value = bit
            p ^= bit
            await Timer(self.bit_period, units='ps')

        # Parity bit
        if parity == 'even':
            self.rxd.value = p
            await Timer(self.bit_period, units='ps')
        elif parity == 'odd':
            self.rxd.value = 1-p
            await Timer(self.bit_period, units='ps')

        # Stop bits
        for _ in range(stop_bits):
            self.rxd.value = 1
            await Timer(self.bit_period, units='ps')

    async def receive_byte(self, parity=None, stop_bits=1):
        """Receive a byte from UART TXD pin."""
        # Wait for start bit
        await FallingEdge(self.txd)
        await Timer(self.bit_period // 2, units='ps') # Middle of start bit
        if self.txd.value != 0:
            return None # False start

        await Timer(self.bit_period, units='ps')

        # Data bits
        data = 0
        p = 0
        for i in range(8):
            bit = int(self.txd.value)
            data |= (bit << i)
            p ^= bit
            await Timer(self.bit_period, units='ps')

        # Parity check (optional)
        if parity:
            # We skip parity check for now to keep it simple
            await Timer(self.bit_period, units='ps')

        # Stop bits
        for _ in range(stop_bits):
            # Check stop bit? 
            await Timer(self.bit_period, units='ps')

        return data

async def axi_write(dut, addr, data):
    """Simple AXI4-Lite Write Task."""
    # AW Channel
    dut.s_axi_awaddr.value = addr
    dut.s_axi_awvalid.value = 1
    # W Channel
    dut.s_axi_wdata.value = data
    dut.s_axi_wstrb.value = 0xF
    dut.s_axi_wvalid.value = 1
    # B Channel
    dut.s_axi_bready.value = 1

    while not (dut.s_axi_awready.value and dut.s_axi_wready.value):
        await RisingEdge(dut.s_axi_aclk)
    
    await RisingEdge(dut.s_axi_aclk)
    dut.s_axi_awvalid.value = 0
    dut.s_axi_wvalid.value = 0
    
    while not dut.s_axi_bvalid.value:
        await RisingEdge(dut.s_axi_aclk)
    await RisingEdge(dut.s_axi_aclk)
    dut.s_axi_bready.value = 0

async def axi_read(dut, addr):
    """Simple AXI4-Lite Read Task."""
    # AR Channel
    dut.s_axi_araddr.value = addr
    dut.s_axi_arvalid.value = 1
    # R Channel
    dut.s_axi_rready.value = 1

    while not dut.s_axi_arready.value:
        await RisingEdge(dut.s_axi_aclk)
    
    await RisingEdge(dut.s_axi_aclk)
    dut.s_axi_arvalid.value = 0

    while not dut.s_axi_rvalid.value:
        await RisingEdge(dut.s_axi_aclk)
    
    data = dut.s_axi_rdata.value.integer
    await RisingEdge(dut.s_axi_aclk)
    dut.s_axi_rready.value = 0
    return data

@cocotb.test()
async def test_uart_loopback(dut):
    """Test Internal Loopback mode."""
    clock = Clock(dut.s_axi_aclk, 20, units="ns") # 50MHz
    cocotb.start_soon(clock.start())

    # Reset
    dut.s_axi_aresetn.value = 0
    await Timer(100, units="ns")
    dut.s_axi_aresetn.value = 1
    await Timer(100, units="ns")

    # Configure UART: 8N1, TX/RX En, Loopback En (bit 9)
    # CR: bit 0=TXEN, bit 1=RXEN, bit 9=LOOPBACK
    await axi_write(dut, REG_BAUD, 27)
    await axi_write(dut, REG_CR, (1 << 9) | 0x03)

    test_data = 0xBE
    await axi_write(dut, REG_DR, test_data)

    # Wait for RX Ready in SR (bit 0)
    status = 0
    for _ in range(500):
        status = await axi_read(dut, REG_SR)
        if status & 0x01:
            break
        await Timer(1, units="us")
    
    assert status & 0x01, "Loopback: RX Ready never asserted"
    received_data = await axi_read(dut, REG_DR)
    dut._log.info(f"Loopback Received: 0x{received_data:02x}")
    assert received_data == test_data, f"Loopback data mismatch: Expected 0x{test_data:02x}, got 0x{received_data:02x}"

@cocotb.test()
async def test_uart_flow_control(dut):
    """Test Hardware Flow Control (RTS/CTS)."""
    clock = Clock(dut.s_axi_aclk, 20, units="ns") # 50MHz
    cocotb.start_soon(clock.start())

    # Reset
    dut.s_axi_aresetn.value = 0
    dut.uart_cts_n.value = 1 # CTS deasserted
    await Timer(100, units="ns")
    dut.s_axi_aresetn.value = 1
    await Timer(100, units="ns")

    # Configure UART: 8N1, TX/RX En, Auto-CTS En (bit 12)
    # CR: bit 0=TXEN, bit 1=RXEN, bit 12=AUTO_CTS
    await axi_write(dut, REG_BAUD, 2 ) # Fast for Sim
    await axi_write(dut, REG_CR, (1 << 12) | 0x03)

    # 1. Start TX while CTS is high (inactive)
    await axi_write(dut, REG_DR, 0x55)
    await Timer(1, units="us")
    
    # Verify TXD is still idle (1)
    assert dut.uart_txd.value == 1, "TX should be blocked by CTS"

    # 2. Lower CTS
    dut.uart_cts_n.value = 0
    await Timer(1, units="us")
    
    # Wait for start bit (0)
    for _ in range(100):
        if dut.uart_txd.value == 0:
            break
        await Timer(100, units="ns")
    
    assert dut.uart_txd.value == 0, "TX should have started after CTS low"
    dut._log.info("Flow Control: TX started after CTS lowering")

@cocotb.test()
async def test_uart_fifo_thresholds(dut):
    """Test FIFO empty/full flags in SR."""
    clock = Clock(dut.s_axi_aclk, 20, units="ns") # 50MHz
    cocotb.start_soon(clock.start())

    # Reset
    dut.s_axi_aresetn.value = 0
    await Timer(100, units="ns")
    dut.s_axi_aresetn.value = 1
    await Timer(100, units="ns")

    # Configure UART: 8N1, TX En, RX En
    await axi_write(dut, REG_BAUD, 1000) # Very slow
    await axi_write(dut, REG_CR, 0x03)

    # Fill TX FIFO (Depth 16, but 1st is popped immediately by TX Engine)
    for i in range(17):
        await axi_write(dut, REG_DR, i)
    
    status = await axi_read(dut, REG_SR)
    # Bit 9 is TX Full -> 0x200
    assert status & 0x200, f"SR TX full bit should be set (SR=0x{status:08x})"
    dut._log.info("FIFO: TX Full verified")

@cocotb.test()
async def test_uart_simple(dut):
    """Test standard 8N1 UART transmission and reception."""
    clock = Clock(dut.s_axi_aclk, 20, units="ns") # 50MHz
    cocotb.start_soon(clock.start())

    # Reset
    dut.s_axi_aresetn.value = 0
    dut.uart_rxd.value = 1
    await Timer(100, units="ns")
    dut.s_axi_aresetn.value = 1
    await Timer(100, units="ns")

    # 50MHz / (16 * 115200) = 27.12 -> 27
    baud_div = 27
    baud_rate = 50000000 / (16 * baud_div)
    uart = UART_Driver(dut.uart_rxd, dut.uart_txd, baud_rate)

    # 1. Configure UART: 8N1, TX/RX En, Int En
    await axi_write(dut, REG_BAUD, baud_div)
    await axi_write(dut, REG_CR, 0x0F)
    await axi_write(dut, REG_IMR, 0x03) # Mask interrupts

    # 2. Test TX: Send from CPU to PC
    test_data_tx = 0x55
    # Start RX task BEFORE TX write to avoid missing start bit edge
    rx_task = cocotb.start_soon(uart.receive_byte())
    await axi_write(dut, REG_DR, test_data_tx)
    
    received_pc = await rx_task
    dut._log.info(f"PC Received: 0x{received_pc:02x}")
    assert received_pc == test_data_tx, f"TX Data mismatch: Expected 0x{test_data_tx:02x}, got 0x{received_pc:02x}"

    # 3. Test RX: Send from PC to CPU
    test_data_rx = 0xAA
    await uart.send_byte(test_data_rx)
    
    # Wait for status register RX Ready
    status = 0
    while not (status & 0x01):
        status = await axi_read(dut, REG_SR)
        await Timer(1, units="us")
    
    received_cpu = await axi_read(dut, REG_DR)
    dut._log.info(f"CPU Received: 0x{received_cpu:02x}")
    assert received_cpu == test_data_rx, f"RX Data mismatch: Expected 0x{test_data_rx:02x}, got 0x{received_cpu:02x}"

    # 4. Check Interrupts
    isr = await axi_read(dut, REG_ISR)
    dut._log.info(f"ISR: 0x{isr:08x}")
    assert dut.intr.value == 1, "Interrupt output should be asserted"

    await Timer(200, units="us")
