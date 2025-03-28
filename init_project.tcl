# Vivado in project mode is less bad, pick part here, we use arty a35t dev board
create_project blinky ./xilinx/ -force -part xc7a35ticsg324-1L;

# add source files
add_files -norecurse -fileset [current_fileset] "./src/blink.sv"
add_files -norecurse -fileset [current_fileset] "./xilinx/src/top.sv"
add_files -norecurse -fileset [current_fileset] "./xilinx/ip/clk_wiz_0/clk_wiz_0.xci"

# add constraints
add_files -norecurse -fileset constrs_1 "./xilinx/constraints/ARTY.xdc"

# set property for constraints
set_property used_in_synthesis false "./xilinx/constraints/ARTY.xdc"

set_property verilog_define [list \
    TARGET_FPGA \
    TARGET_SYNTHESIS \
    TARGET_VIVADO \
    TARGET_XILINX \
] [current_fileset]


set_property verilog_define [list \
    TARGET_FPGA \
    TARGET_SYNTHESIS \
    TARGET_VIVADO \
    TARGET_XILINX \
] [current_fileset -simset]

# generate a reasonable compile order
update_compile_order -fileset [current_fileset]

# start Vivado GUI (this can be omitted)
start_gui

