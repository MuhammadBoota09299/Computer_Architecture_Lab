@echo off

:: Set the base directory relative to testbench
set BASE_DIR=D:\University\Semester_6\CA\Computer_Architecture_Lab

:: Clean previous files
echo Cleaning old files...
if exist work rmdir /s /q work
del transcript *.vcd *.wlf 2>nul

:: Create work library
echo Creating work library...
vlib work

:: Compile all files with correct paths
echo Compiling Verilog files...
vlog -sv ^
+incdir+%BASE_DIR%/CEP/defines ^
%BASE_DIR%/CEP/defines/cep_define.sv ^
pmp_tb.sv ^
%BASE_DIR%/CEP/rtl/tor.sv ^
%BASE_DIR%/CEP/rtl/addr_check_n.sv ^
%BASE_DIR%/CEP/rtl/na4.sv ^
%BASE_DIR%/CEP/rtl/napot.sv ^
%BASE_DIR%/CEP/rtl/pmp.sv ^
%BASE_DIR%/CEP/rtl/pmp_check.sv ^
%BASE_DIR%/CEP/rtl/pmp_registers.sv


:: Run simulation
echo Starting simulation...
vsim -c -voptargs="+acc" -do "run -all; quit" pmp_tb

echo Simulation complete!
pause