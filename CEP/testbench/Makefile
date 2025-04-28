# Verilog source files
SRC_FILES = \
    CEP/defines/cep_defines.sv \
    CEP/testbench/pmp_tb.sv \
    CEP/rtl/tor.sv \
    CEP/rtl/addr_check_n.sv \
    CEP/rtl/na4.sv \
    CEP/rtl/napot.sv \
    CEP/rtl/pmp.sv \
    CEP/rtl/pmp_check.sv \
    CEP/rtl/pmp_registers.sv

# Include directory (relative to where make is run)
INCLUDE_DIR = CEP/defines

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

simulate:compile
	@echo "Running simulation..."
	$(VSIM) -c -do "run -all; quit" pmp_tb

clean:
	rm -rf $(WORK_LIB) transcript *.vcd *.wlf
