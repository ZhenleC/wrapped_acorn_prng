import cocotb
from cocotb.triggers import Timer


@cocotb.test()
async def test_acorn_prng(dut):
    """Try accessing the design."""
    
        
    
    for cycle in range(1):
        
        dut.reset.value = 1
        dut.clk.value = 0
        await Timer(1, units="ns")
        dut.clk.value = 1
        await Timer(1, units="ns")        
        
    for cycle in range(1):
    	
    	dut.load.value = 1
    	dut.reset.value = 0
    	dut.select.value = 0
    	dut.clk.value = 0
    	await Timer(1, units="ns")
    	dut.clk.value = 1
    	await Timer(1, units="ns")
    	assert dut.seed.value == 2049, "Loaded0"

    for cycle in range(100):
        
        dut.load.value = 0
        dut.reset.value = 0
        dut.clk.value = 0
        await Timer(1, units="ns")
        dut.clk.value = 1
        await Timer(1, units="ns")
        dut._log.info("Output is %s", dut.out.value)     
        
        if (cycle ==  20):
        	assert dut.out.value == 2049, "correct_10"
        
        if (cycle ==  35):
        	assert dut.out.value == 16, "correct_11"    
        	
        	    
    for cycle in range(1):
        
        dut.reset.value = 1
        dut.clk.value = 0
        await Timer(1, units="ns")
        dut.clk.value = 1
        await Timer(1, units="ns")        
        
    for cycle in range(1):
    	
    	dut.load.value = 1
    	dut.reset.value = 0
    	dut.select.value = 3
    	dut.clk.value = 0
    	await Timer(1, units="ns")
    	dut.clk.value = 1
    	await Timer(1, units="ns")
    	
    	assert dut.seed.value == 4095, "Loaded3"
    	

    for cycle in range(100):
        
        dut.load.value = 0
        dut.reset.value = 0
        dut.clk.value = 0
        await Timer(1, units="ns")
        dut.clk.value = 1
        await Timer(1, units="ns")
        dut._log.info("Output is %s", dut.out.value)   
        
        if (cycle ==  20):
        	assert dut.out.value == 4095, "correct_10"
        
        if (cycle ==  35):
        	assert dut.out.value == 4080, "correct_11"            
        	
  	
          
