
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer, ReadOnly
import random

async def reset_dut(dut):
    """Reset the DUT"""
    dut.rst_n.value = 0
    await Timer(20, unit="ns")
    dut.rst_n.value = 1
    dut.cs.value = 0
    dut.we.value = 0
    await RisingEdge(dut.clk)

@cocotb.test()
async def test_simple_rw(dut):
    """
    Basic Read/Write Test
    Verifies that we can write random data to random addresses and read it back.
    """
    clock = Clock(dut.clk, 10, unit="ns")
    cocotb.start_soon(clock.start())
    
    await reset_dut(dut)
    
    width = int(dut.WIDTH.value)
    depth = int(dut.DEPTH.value)
    
    dut._log.info(f"Test Configuration: WIDTH={width}, DEPTH={depth}")

    for i in range(20):
        # Generate random address and data
        addr = random.randint(0, depth-1)
        data = random.randint(0, (1 << width) - 1)
        
        # Write Cycle
        dut.cs.value = 1
        dut.we.value = 1
        dut.addr.value = addr
        dut.wdata.value = data
        dut.wstrb.value = (1 << (width // 8)) - 1 # Enable all bytes
        
        await RisingEdge(dut.clk)
        
        # Idle/Read Cycle Setup
        dut.cs.value = 0
        dut.we.value = 0
        # Wait a cycle - checking read-after-write separation
        await RisingEdge(dut.clk)
        
        # Read Cycle
        dut.cs.value = 1
        dut.we.value = 0
        dut.addr.value = addr
        
        await RisingEdge(dut.clk)
        # Latency Cycle: BRAM Output Registered at edge
        # We need to wait for the data to be valid at outputs
        dut.cs.value = 0 # Deassert CS
        await RisingEdge(dut.clk) 
        
        # Sample Data
        await ReadOnly()
        read_val = int(dut.rdata.value)
        
        if read_val != data:
            raise  cocotb.result.TestFailure(
                f"Mismatch at Address 0x{addr:x}\n"
                f"  Expected: 0x{data:x}\n"
                f"  Got:      0x{read_val:x}"
            )
        
        await RisingEdge(dut.clk) # Advance to next cycle to exit ReadOnly phase
            
    dut._log.info("Basic Read/Write Test Passed")

@cocotb.test()
async def test_byte_enables_and_wide(dut):
    """
    Byte Enable and Wide Access Test
    Verifies partial writes using byte enables.
    Crucial for wide memory support.
    """
    clock = Clock(dut.clk, 10, unit="ns")
    cocotb.start_soon(clock.start())
    await reset_dut(dut)
    
    width = int(dut.WIDTH.value)
    depth = int(dut.DEPTH.value)
    num_bytes = width // 8
    
    dut._log.info(f"Testing Byte Enables. Width={width} (Bytes={num_bytes})")
    
    # 1. Initialize a word with known pattern
    addr = 0
    init_data = 0
    for b in range(num_bytes):
        init_data |= (0xAA << (b*8)) # 0xAA for all bytes
        
    dut.cs.value = 1
    dut.we.value = 1
    dut.addr.value = addr
    dut.wdata.value = init_data
    dut.wstrb.value = (1 << num_bytes) - 1 # All enabled
    await RisingEdge(dut.clk)
    
    # 2. Modify specific bytes
    # Write 0xBB to even bytes only
    mod_data = 0
    mod_strb = 0
    expected_data = init_data
    
    for b in range(num_bytes):
        if b % 2 == 0:
            mod_data |= (0xBB << (b*8))
            mod_strb |= (1 << b)
            # Update expected
            mask = ~(0xFF << (b*8))
            expected_data = (expected_data & mask) | (0xBB << (b*8))
            
    dut.cs.value = 1
    dut.we.value = 1
    dut.addr.value = addr
    dut.wdata.value = mod_data
    dut.wstrb.value = mod_strb
    await RisingEdge(dut.clk)
    
    dut.cs.value = 0
    dut.we.value = 0
    await RisingEdge(dut.clk)
    
    # 3. Read back
    dut.cs.value = 1
    dut.addr.value = addr
    await RisingEdge(dut.clk)
    dut.cs.value = 0
    await RisingEdge(dut.clk)
    
    await ReadOnly()
    read_val = int(dut.rdata.value)
    
    if read_val != expected_data:
        # Helper for wide hex printing
        raise cocotb.result.TestFailure(
            f"Byte Enable Mismatch!\n"
            f"  Expected: 0x{expected_data:x}\n"
            f"  Got:      0x{read_val:x}\n"
            f"  Strobe:   0x{mod_strb:x}"
        )
        
    dut._log.info("Byte Enable Test Passed")

