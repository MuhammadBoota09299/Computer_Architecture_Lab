# Verilog source files
SRC_FILES = includes/packages.sv alu.sv decoder.sv instruction_memory.sv pc.sv pc_add.sv registerfile.sv single_cycle_processor.sv single_cycle_tb.sv

# Include directory
INCLUDE_DIR = ./includes

# Verilator executable
VERILATOR = verilator

# Default target to compile and run the simulation
all:
	# Lint the Verilog files
	$(VERILATOR) --lint-only --sv --timing $(SRC_FILES) -I$(INCLUDE_DIR)

	# Compile the Verilog files and generate the executable, ignoring specific warnings
	$(VERILATOR) --cc --exe --sv $(SRC_FILES) -I$(INCLUDE_DIR) --top-module single_cycle_tb --timing -Wall --trace --build \
		-Wno-IMPORTSTAR -Wno-UNUSEDSIGNAL

	# Run the generated simulation executable
	./obj_dir/Vsingle_cycle_tb

# Clean up generated files
clean:
	rm -rf obj_dir *.vcd
