vlib work 
vlog +acc  "Z:/VMWare/tetris/FPGA-Tetris/shift_register.v" 
vlog +acc  "Z:/VMWare/tetris/FPGA-Tetris/shift_reg_tb.v" 
vsim  -novopt -t 1ps -lib work shift_reg_tb
view objects 
view wave 
do {wave.do} 
log -r * 
run 1080900ns
