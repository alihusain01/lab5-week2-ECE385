transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab5-week2-ECE385 {C:/Users/alijh/Documents/ECE 385/lab5-week2-ECE385/two_to_one_mux.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab5-week2-ECE385 {C:/Users/alijh/Documents/ECE 385/lab5-week2-ECE385/reg_16.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab5-week2-ECE385 {C:/Users/alijh/Documents/ECE 385/lab5-week2-ECE385/pc_mux.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab5-week2-ECE385 {C:/Users/alijh/Documents/ECE 385/lab5-week2-ECE385/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab5-week2-ECE385 {C:/Users/alijh/Documents/ECE 385/lab5-week2-ECE385/gate_mux.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab5-week2-ECE385/lab5-givenModules {C:/Users/alijh/Documents/ECE 385/lab5-week2-ECE385/lab5-givenModules/test_memory.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab5-week2-ECE385/lab5-givenModules {C:/Users/alijh/Documents/ECE 385/lab5-week2-ECE385/lab5-givenModules/synchronizers.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab5-week2-ECE385/lab5-givenModules {C:/Users/alijh/Documents/ECE 385/lab5-week2-ECE385/lab5-givenModules/SLC3_2.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab5-week2-ECE385/lab5-givenModules {C:/Users/alijh/Documents/ECE 385/lab5-week2-ECE385/lab5-givenModules/Mem2IO.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab5-week2-ECE385/lab5-givenModules {C:/Users/alijh/Documents/ECE 385/lab5-week2-ECE385/lab5-givenModules/ISDU.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab5-week2-ECE385 {C:/Users/alijh/Documents/ECE 385/lab5-week2-ECE385/reg_file.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab5-week2-ECE385 {C:/Users/alijh/Documents/ECE 385/lab5-week2-ECE385/ALU.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab5-week2-ECE385 {C:/Users/alijh/Documents/ECE 385/lab5-week2-ECE385/reg_two_to_one_mux.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab5-week2-ECE385 {C:/Users/alijh/Documents/ECE 385/lab5-week2-ECE385/addr2_mux.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab5-week2-ECE385 {C:/Users/alijh/Documents/ECE 385/lab5-week2-ECE385/reg_1.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab5-week2-ECE385 {C:/Users/alijh/Documents/ECE 385/lab5-week2-ECE385/reg_3.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab5-week2-ECE385/lab5-givenModules {C:/Users/alijh/Documents/ECE 385/lab5-week2-ECE385/lab5-givenModules/slc3.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab5-week2-ECE385/lab5-givenModules {C:/Users/alijh/Documents/ECE 385/lab5-week2-ECE385/lab5-givenModules/memory_contents.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab5-week2-ECE385/lab5-givenModules {C:/Users/alijh/Documents/ECE 385/lab5-week2-ECE385/lab5-givenModules/slc3_testtop.sv}

vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab5-week2-ECE385 {C:/Users/alijh/Documents/ECE 385/lab5-week2-ECE385/testbench_1.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench_1

add wave *
view structure
view signals
run 10000 ns
