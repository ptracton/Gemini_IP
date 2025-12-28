# File: test_fifo.py
# Description: Cocotb testbench for Synchronous FIFO
# Author: Gemini-3 AI

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer, ReadOnly
import random

class FifoTester:
    def __init__(self, dut):
        self.dut = dut
        self.width = int(dut.WIDTH)
        self.depth = int(dut.DEPTH)
        self.ref_model = []

    async def reset(self):
        self.dut.rst_n.value = 0
        self.dut.flush.value = 0
        self.dut.push.value = 0
        self.dut.pop.value = 0
        self.dut.data_in.value = 0
        await Timer(20, units='ns')
        self.dut.rst_n.value = 1
        await RisingEdge(self.dut.clk)
        await RisingEdge(self.dut.clk) 

    async def push(self, data):
        if self.dut.full.value:
            return False
            
        self.dut.push.value = 1
        self.dut.data_in.value = data
        await RisingEdge(self.dut.clk)
        self.dut.push.value = 0
        self.ref_model.append(data)
        return True

    async def pop(self):
        if self.dut.empty.value:
            return None
            
        self.dut.pop.value = 1
        await RisingEdge(self.dut.clk) 
        self.dut.pop.value = 0
        
        # Data available next cycle (registered read)
        await ReadOnly()
        data = int(self.dut.data_out.value)
        await Timer(1, 'ns') # Exit ReadOnly
        
        expected = self.ref_model.pop(0)
        assert data == expected, f"Data Mismatch! Got {data}, Expected {expected}"
        return data

@cocotb.test()
async def test_fifo_random(dut):
    """Test FIFO with random push/pop operations"""
    tester = FifoTester(dut)
    
    # Clock Generation
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
    
    # Reset
    await tester.reset()
    
    dut._log.info(f"FIFO Configuration: WIDTH={tester.width}, DEPTH={tester.depth}")
    
    # Initial Sanity Check
    dut._log.info("Starting Sanity Check...")
    await tester.push(0xAA)
    dut._log.info(f"Pushed 0xAA. Level: {dut.level.value}")
    await ReadOnly()
    assert int(dut.level.value) == 1, f"Sanity Push Failed! Level={dut.level.value}"
    await Timer(1, 'ns')
    
    val = await tester.pop()
    dut._log.info(f"Popped {val}. Level: {dut.level.value}")
    assert val == 0xAA, f"Sanity Pop Failed! Got {val}"
    await ReadOnly()
    assert int(dut.level.value) == 0, f"Sanity Pop Level Failed! Level={dut.level.value}"
    await Timer(1, 'ns')
    dut._log.info("Sanity Check Passed!")

    # Random Operations
    for i in range(1000):
        action = random.choice(['push', 'pop', 'both'])
        
        if action == 'push':
            data = random.randint(0, (2**tester.width)-1)
            await tester.push(data)
        elif action == 'pop':
            await tester.pop()
        elif action == 'both':
            if not dut.full.value and not dut.empty.value:
                data = random.randint(0, (2**tester.width)-1)
                dut.push.value = 1
                dut.data_in.value = data
                dut.pop.value = 1
                
                await RisingEdge(dut.clk)
                dut.push.value = 0
                dut.pop.value = 0
                
                # Update Model
                tester.ref_model.append(data)
                
                # Check Data (Pop happened, so old data should be on data_out)
                # Note: RTL has latched output on pop
                await ReadOnly()
                read_data = int(dut.data_out.value)
                await Timer(1, 'ns')
                
                expected = tester.ref_model.pop(0)
                
                assert read_data == expected, f"Cycle {i}: Both Op Data Mismatch! Got {read_data}, Expected {expected}"
            else:
                if dut.full.value:
                    await tester.pop()
                else:
                    data = random.randint(0, (2**tester.width)-1)
                    await tester.push(data)
                    
        # Check flags
        await ReadOnly()
        hw_level = int(dut.level.value)
        sw_level = len(tester.ref_model)
        
        assert hw_level == sw_level, f"Cycle {i}: Level Mismatch! HW={hw_level}, SW={sw_level}"
        
        if sw_level == 0:
            assert dut.empty.value == 1, f"Cycle {i}: Empty Flag Mismatch! Should be empty."
        else:
             assert dut.empty.value == 0, f"Cycle {i}: Empty Flag Mismatch! Should NOT be empty."

        if sw_level == tester.depth:
            assert dut.full.value == 1, f"Cycle {i}: Full Flag Mismatch! Should be full."
        else:
            assert dut.full.value == 0, f"Cycle {i}: Full Flag Mismatch! Should NOT be full."
            
        await Timer(1, units='ns')

    dut._log.info("Test Complete!")
