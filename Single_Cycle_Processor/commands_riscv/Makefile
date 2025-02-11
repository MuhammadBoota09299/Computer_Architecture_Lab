# RISC-V Toolchain
RISCV_AS = riscv64-unknown-elf-as
RISCV_OBJDUMP = riscv64-unknown-elf-objdump
RISCV_LD = riscv64-unknown-elf-ld
RISCV_SIM = spike  # Assuming you're using Spike as a simulator

# Files and Directories
SRC_DIR = src
SRC = $(SRC_DIR)/gcd.s
OBJ = gcd.o
OUTPUT = gcd
DUMP = gcd.dump

# Default target
all: $(OUTPUT) dump run

# Assemble the source file into an object file
$(OBJ): $(SRC)
	$(RISCV_AS) -o $(OBJ) $(SRC)

# Link the object file to create the executable
$(OUTPUT): $(OBJ)
	$(RISCV_LD) -o $(OUTPUT) $(OBJ)

# Generate assembly dump
dump: $(OUTPUT)
	$(RISCV_OBJDUMP) -d $(OUTPUT) > $(DUMP)

# Run the program (ensure Spike or your RISC-V simulator is installed)
run: $(OUTPUT)
	$(RISCV_SIM) pk $(OUTPUT)

# Clean up generated files
clean:
	rm -f $(OBJ) $(OUTPUT) $(DUMP)
