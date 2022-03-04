onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /testbench_1/Clk
add wave -noupdate -radix hexadecimal /testbench_1/Reset
add wave -noupdate -radix hexadecimal /testbench_1/Run
add wave -noupdate -radix hexadecimal /testbench_1/Continue
add wave -noupdate -radix hexadecimal /testbench_1/OE
add wave -noupdate -radix hexadecimal /testbench_1/WE
add wave -noupdate -radix hexadecimal /testbench_1/LD_PC
add wave -noupdate -radix hexadecimal /testbench_1/LD_MAR
add wave -noupdate -radix hexadecimal /testbench_1/GatePC
add wave -noupdate -radix hexadecimal /testbench_1/SW
add wave -noupdate -radix hexadecimal /testbench_1/LED
add wave -noupdate -radix hexadecimal /testbench_1/HEX0
add wave -noupdate -radix hexadecimal /testbench_1/HEX1
add wave -noupdate -radix hexadecimal /testbench_1/HEX2
add wave -noupdate -radix hexadecimal /testbench_1/HEX3
add wave -noupdate -radix hexadecimal /testbench_1/ADDR
add wave -noupdate -radix hexadecimal /testbench_1/Data_to_SRAM
add wave -noupdate -radix hexadecimal /testbench_1/Data_from_SRAM
add wave -noupdate -radix hexadecimal /testbench_1/R0
add wave -noupdate -radix hexadecimal /testbench_1/R1
add wave -noupdate -radix hexadecimal /testbench_1/R2
add wave -noupdate -radix hexadecimal /testbench_1/R3
add wave -noupdate -radix hexadecimal /testbench_1/R4
add wave -noupdate -radix hexadecimal /testbench_1/R5
add wave -noupdate -radix hexadecimal /testbench_1/R6
add wave -noupdate -radix hexadecimal /testbench_1/R7
add wave -noupdate -radix hexadecimal /testbench_1/ALU_OUT
add wave -noupdate -radix hexadecimal /testbench_1/PC
add wave -noupdate -radix hexadecimal /testbench_1/IR
add wave -noupdate -radix hexadecimal /testbench_1/MAR
add wave -noupdate -radix hexadecimal /testbench_1/MDR
add wave -noupdate -radix hexadecimal /testbench_1/BUS
add wave -noupdate -radix hexadecimal /testbench_1/State
add wave -noupdate -radix hexadecimal /testbench_1/SLC3/slc/state_controller/State
add wave -noupdate -radix hexadecimal /testbench_1/PCMUX_Adder
add wave -noupdate -radix hexadecimal /testbench_1/SLC3/slc/ALU_Unit/SR1
add wave -noupdate -radix hexadecimal /testbench_1/SLC3/slc/ALU_Unit/SR2_OUT
add wave -noupdate -radix hexadecimal /testbench_1/SLC3/slc/ALU_Unit/ALUK
add wave -noupdate -radix hexadecimal /testbench_1/SLC3/slc/ALU_Unit/OUT
add wave -noupdate -radix hexadecimal /testbench_1/SLC3/slc/SR2_Mux/Choose
add wave -noupdate -radix hexadecimal /testbench_1/SLC3/slc/SR2_Mux/S0
add wave -noupdate -radix hexadecimal /testbench_1/SLC3/slc/SR2_Mux/S1
add wave -noupdate -radix hexadecimal /testbench_1/SLC3/slc/SR2_Mux/OUT
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20023 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 271
configure wave -valuecolwidth 80
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {393216 ps}
