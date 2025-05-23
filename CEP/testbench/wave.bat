@echo off
setlocal

:: 1. Clean and compile
if exist work rmdir /s /q work
del transcript *.vcd *.wlf 2>nul

call c.bat
if %ERRORLEVEL% GEQ 1 (
    echo ERROR: Compilation failed
    pause
    exit /b 1
)

:: 2. Run simulation with waveform setup
echo Starting simulation with waveform logging...
vsim -gui -voptargs="+acc" work.pmp_tb -do "add wave -r sim:/pmp_tb/*;add wave sim:/pmp_tb/PMP/* ; run -all;"

if %ERRORLEVEL% GEQ 1 (
    echo ERROR: Simulation failed
    pause
    exit /b 1
)

echo Simulation complete with waveforms ready!