# Verilog source files
SRC_FILES = rtl/includes/packages.sv rtl/alu.sv ... rtl/single_cycle_processor.sv test_bench/single_cycle_tb.sv

# Include directory
INCLUDE_DIR = ./includes

# ModelSim commands
VLIB = vlib
VLOG = vlog
VSIM = vsim

# Work library
WORK_LIB = work

# Default target to compile and run the simulation
all: compile simulate

# Create work library
compile:
	@echo "Creating work library..."
	$(VLIB) $(WORK_LIB)

	@echo "Compiling Verilog files..."
	$(VLOG) -sv +incdir+$(INCLUDE_DIR) $(SRC_FILES)

# Run the simulation
simulate:
	@echo "Running simulation..."
	$(VSIM) -c -do "run -all; quit" single_cycle_tb

# Clean up generated files
clean:
	rm -rf $(WORK_LIB) transcript *.vcd *.wlf
