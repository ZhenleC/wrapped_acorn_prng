# User config
set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) wrapped_acorn_prng

# add your source files here
set ::env(VERILOG_FILES) "$::env(DESIGN_DIR)/wrapper.v \
    $::env(DESIGN_DIR)/src/acorn_prng.v"

set ::env(ROUTING_CORES) 6
set ::env(RUN_KLAYOUT_XOR) 0
set ::env(RUN_KLAYOUT_DRC) 0

# don't put clock buffers on the outputs, need tristates to be the final cells
set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) 0

# define number of IO pads
set ::env(SYNTH_DEFINES) "MPRJ_IO_PADS=38"

# clock period is ns
set ::env(CLOCK_PERIOD) "10"
set ::env(CLOCK_PORT) "wb_clk_i"

# macro needs to work inside Caravel, so can't be core and can't use metal 5
set ::env(DESIGN_IS_CORE) 0
set ::env(RT_MAX_LAYER) {met4}

# define power straps so the macro works inside Caravel's PDN
set ::env(VDD_NETS) [list {vccd1}] 
set ::env(GND_NETS) [list {vssd1}]

# turn off CVC as we have multiple power domains
set ::env(RUN_CVC) 0

# make pins wider to solve routing issues
set ::env(FP_IO_VTHICKNESS_MULT) 4
set ::env(FP_IO_HTHICKNESS_MULT) 4



