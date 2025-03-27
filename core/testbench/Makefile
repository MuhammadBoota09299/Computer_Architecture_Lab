# Verilog source files
SRC_FILES = \
    ./core/rtl/defines/packages.sv \
    ./core/rtl/alu.sv \
    ./core/rtl/branch.sv \
    ./core/rtl/data_memory.sv \
    ./core/rtl/decoder.sv \
    ./core/rtl/instruction_memory.sv \
    ./core/rtl/mux2_1.sv \
    ./core/rtl/mux3_1.sv \
    ./core/rtl/pc.sv \
    ./core/rtl/pc_add.sv \
    ./core/rtl/pipline_reg.sv \
    ./core/rtl/registerfile.sv \
    ./core/rtl/lsu.sv \
    ./uart/rtl/bit_count_reg.sv \
    ./uart/rtl/buad_rate_reg.sv \
    ./uart/rtl/parity_calculate.sv \
    ./uart/rtl/rx_fifo.sv \
    ./uart/rtl/rx_shift_reg.sv \
    ./uart/rtl/tx_fifo.sv \
    ./uart/rtl/tx_shift_reg.sv \
    ./uart/rtl/uart.sv \
    ./uart/rtl/uart_controller.sv \
    ./uart/rtl/uart_registerfile.sv \
    ./core/rtl/core.sv \
    ./core/testbench/core_tb.sv

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