# Verilog source files
SRC_FILES = \
    /home/aziz/Documents/Computer_Architecture_Lab/core/rtl/defines/packages.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/core/rtl/alu.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/core/rtl/branch.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/core/rtl/data_memory.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/core/rtl/decoder.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/core/rtl/instruction_memory.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/core/rtl/mux2_1.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/core/rtl/mux3_1.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/core/rtl/pc.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/core/rtl/pc_add.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/core/rtl/pipline_reg.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/core/rtl/registerfile.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/core/rtl/lsu.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/uart/rtl/bit_count_reg.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/uart/rtl/buad_rate_reg.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/uart/rtl/parity_calculate.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/uart/rtl/rx_fifo.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/uart/rtl/rx_shift_reg.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/uart/rtl/tx_fifo.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/uart/rtl/tx_shift_reg.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/uart/rtl/uart.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/uart/rtl/uart_controller.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/uart/rtl/uart_registerfile.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/core/rtl/core.sv \
    /home/aziz/Documents/Computer_Architecture_Lab/core/testbench/core_tb.sv

# Include directory (relative to where make is run)
INCLUDE_DIR = ./core/rtl/defines

# ModelSim commands
VLIB = vlib
VLOG = vlog
VSIM = vsim

# Work library
WORK_LIB = work

# Default target
all: clean compile simulate

compile:
	@echo "Creating work library..."
	$(VLIB) $(WORK_LIB)
	@echo "Compiling Verilog files..."
	$(VLOG) -sv +incdir+$(INCLUDE_DIR) $(SRC_FILES)

simulate:
	@echo "Running simulation..."
	$(VSIM) -c -do "run -all; quit" core_tb

clean:
	rm -rf $(WORK_LIB) transcript *.vcd *.wlf