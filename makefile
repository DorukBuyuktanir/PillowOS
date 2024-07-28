ASM = nasm

SRC_DIR = src
BUILD_DIR = build

# Rule to create the PillowOS image
$(BUILD_DIR)/main_PillowOS.img: $(BUILD_DIR)/main.bin
	cp $(BUILD_DIR)/main.bin $(BUILD_DIR)/main_PillowOS.img
	truncate -s 1440k $(BUILD_DIR)/main_PillowOS.img

# Rule to create the binary from assembly
$(BUILD_DIR)/main.bin: $(SRC_DIR)/main.asm | $(BUILD_DIR)
	$(ASM) $(SRC_DIR)/main.asm -f bin -o $(BUILD_DIR)/main.bin

# Ensure the build directory exists before building
$(BUILD_DIR):
	mkdir $(BUILD_DIR)

# Default target
all: $(BUILD_DIR)/main_PillowOS.img

# Clean up build artifacts
clean:
	rm -rf $(BUILD_DIR)