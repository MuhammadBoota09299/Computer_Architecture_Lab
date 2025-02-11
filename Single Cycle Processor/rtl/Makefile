# Verilog source files
SRC_FILES = includes/packages.sv alu.sv decoder.sv instruction_memory.sv pc.sv pc_add.sv registerfile.sv single_cycle_processor.sv

# Include directory
INCLUDE_DIR = ./includes

# Verilator executable
VERILATOR = verilator

# Default target to compile and run the simulation
all:
	$(VERILATOR) --cc --exe $(SRC_FILES) --top-module single_cycle_processor -I$(INCLUDE_DIR) -Wall
	make -C obj_dir -f Vsingle_cycle_processor.mk

# Clean up generated files
clean:
	rm -rf obj_dir
