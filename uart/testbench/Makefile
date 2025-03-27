# Verilog source files
SRC_FILES = \
    /home/aziz/Documents/Computer_Architecture_Lab/core/rtl/defines/packages.sv \
    ../rtl/bit_count_reg.sv \
    ../rtl/buad_rate_reg.sv \
    ../rtl/parity_calculate.sv \
    ../rtl/rx_fifo.sv \
    ../rtl/rx_shift_reg.sv \
    ../rtl/tx_fifo.sv \
    ../rtl/tx_shift_reg.sv \
    ../rtl/uart.sv \
    ../rtl/uart_controller.sv \
    ../rtl/uart_registerfile.sv \
    uart_tb.sv

# Include directory
INCLUDE_DIR = ../core/rtl/defines

# ModelSim commands
VLIB = vlib
VLOG = vlog
VSIM = vsim

# Work library
WORK_LIB = work

# Default target to compile and run the simulation
all: clean compile simulate

# Create work library
compile:
	@echo "Creating work library..."
	$(VLIB) $(WORK_LIB)

	@echo "Compiling Verilog files..."
	$(VLOG) -sv +incdir+$(INCLUDE_DIR) $(SRC_FILES)

# Run the simulation
simulate:
	@echo "Running simulation..."
	$(VSIM) -c -do "run -all; quit" uart_tb

# Clean up generated files
clean:
	rm -rf $(WORK_LIB) transcript *.vcd *.wlf