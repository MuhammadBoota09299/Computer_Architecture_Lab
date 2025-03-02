# RISC-V Toolchain
RISCV_AS = riscv64-unknown-elf-as
RISCV_OBJDUMP = riscv64-unknown-elf-objdump
RISCV_LD = riscv64-unknown-elf-ld
RISCV_OBJCOPY = riscv64-unknown-elf-objcopy

# Directories
SRC_DIR = src
BUILD_DIR = build

# Files
SRC = $(SRC_DIR)/gcd.s
OBJ = $(BUILD_DIR)/gcd.o
OUTPUT = $(BUILD_DIR)/gcd
DUMP = $(BUILD_DIR)/gcd.dump
BIN = $(BUILD_DIR)/gcd.bin
TXT = $(BUILD_DIR)/gcd.txt

# Default target
all: $(OUTPUT) dump bin txt

# Ensure the build directory exists
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Assemble the source file into an object file
$(OBJ): $(SRC) | $(BUILD_DIR)
	$(RISCV_AS) -o $(OBJ) $(SRC)

# Link the object file to create the executable
$(OUTPUT): $(OBJ)
	$(RISCV_LD) -o $(OUTPUT) $(OBJ)

# Generate assembly dump
dump: $(OUTPUT)
	$(RISCV_OBJDUMP) -d $(OUTPUT) > $(DUMP)

# Convert ELF executable to binary format
bin: $(OUTPUT)
	$(RISCV_OBJCOPY) -O binary $(OUTPUT) $(BIN)

# Convert binary to text format
txt: $(BIN)
	python3 maketxt.py $(BIN) > $(TXT)

# Clean up generated files
clean:
	rm -rf $(BUILD_DIR)
