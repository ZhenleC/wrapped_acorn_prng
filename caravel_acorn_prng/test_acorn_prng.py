import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, RisingEdge, FallingEdge, ClockCycles, with_timeout


async def until_signal_has_value(clk, sig, value):
    while True:
        await RisingEdge(clk)
        if sig.value == value:
            return




@cocotb.test()
async def test_acorn_prng(dut):
    """Try accessing the design."""
    clock = Clock(dut.clk, 25, units="ns") # 40M
    cocotb.fork(clock.start())
    
    dut.RSTB <= 0
    dut.power1 <= 0;
    dut.power2 <= 0;
    dut.power3 <= 0;
    dut.power4 <= 0;

    await ClockCycles(dut.clk, 8)
    dut.power1 <= 1;
    await ClockCycles(dut.clk, 8)
    dut.power2 <= 1;
    await ClockCycles(dut.clk, 8)
    dut.power3 <= 1;
    await ClockCycles(dut.clk, 8)
    dut.power4 <= 1;

    await ClockCycles(dut.clk, 80)
    dut.RSTB <= 1    
    
    await RisingEdge(dut.uut.mprj.wrapped_acorn_prng.acorn_prng0.reset_out)
    await FallingEdge(dut.uut.mprj.wrapped_acorn_prng.acorn_prng0.reset_out)

            
        
    for cycle in range(1):
    	
    	dut.load.value = 1

    	dut.select.value = 0
    	dut.clk.value = 0
    	await Timer(1, units="ns")
    	dut.clk.value = 1
    	await Timer(1, units="ns")
   	

    for cycle in range(300):
        
        dut.load.value = 0
        dut.clk.value = 0
        await Timer(1, units="ns")
        dut.clk.value = 1
        await Timer(1, units="ns")      

             
        	
        	
        	      
          
