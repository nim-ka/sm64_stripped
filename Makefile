# Makefile to rebuild SM64 split image

################ Target Executable and Sources ###############

# BUILD_DIR is location where all build artifacts are placed
BUILD_DIR := build

# Directories containing source files
SRC_DIRS := src src/libultra
ASM_DIRS := asm
DATA_DIRS := data

# If COMPARE is 1, check the output sha1sum when building 'all'
COMPARE = 1

# Source code files
C_FILES := $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.c))
S_FILES := $(foreach dir,$(ASM_DIRS),$(wildcard $(dir)/*.s))
D_FILES := $(foreach dir,$(DATA_DIRS),$(wildcard $(dir)/*.s))

# Object files
O_FILES := $(foreach file,$(C_FILES),$(BUILD_DIR)/$(file:.c=.o)) \
           $(foreach file,$(S_FILES),$(BUILD_DIR)/$(file:.s=.o)) \
           $(foreach file,$(D_FILES),$(BUILD_DIR)/$(file:.s=.o))

##################### Compiler Options #######################
IRIX_ROOT := tools/ido5.3_compiler
CROSS := mips-linux-gnu-
AS := $(CROSS)as
CC := $(QEMU_IRIX) -L $(IRIX_ROOT) $(IRIX_ROOT)/usr/bin/cc
LD := $(CROSS)ld
OBJDUMP := $(CROSS)objdump
OBJCOPY := $(CROSS)objcopy --pad-to=0x800000 --gap-fill=0xFF

# Check code syntax with host compiler
CC_CHECK := gcc -m32 -fsyntax-only -I include -std=c99 -Wall -Wextra -pedantic -Werror

ASFLAGS := -march=vr4300 -I include
CFLAGS  := -Wab,-r4300_mul -mips2 -non_shared -G 0 -Xcpluscomm -Xfullwarn -g -I include

LDFLAGS = undefined_syms.txt -T $(LD_SCRIPT) -Map $(BUILD_DIR)/sm64.map --no-check-sections

####################### Other Tools #########################

# N64 tools
TOOLS_DIR = tools
MIO0TOOL = $(TOOLS_DIR)/mio0
N64CKSUM = $(TOOLS_DIR)/n64cksum
N64GRAPHICS = $(TOOLS_DIR)/n64graphics
EMULATOR = mupen64plus
EMU_FLAGS = --noosd
LOADER = loader64
LOADER_FLAGS = -vwf

SHA1SUM = sha1sum

######################## Targets #############################

default: all

# file dependencies generated by splitter
MAKEFILE_SPLIT = Makefile.split
include $(MAKEFILE_SPLIT)

all: $(BUILD_DIR)/$(TARGET).z64
ifeq ($(COMPARE),1)
	@$(SHA1SUM) -c $(TARGET).sha1
endif

clean:
	$(RM) -r $(BUILD_DIR)

$(MIO0_DIR)/%.mio0: $(MIO0_DIR)/%.bin
	$(MIO0TOOL) $< $@

$(BUILD_DIR):
	mkdir $(BUILD_DIR) $(addprefix $(BUILD_DIR)/,$(SRC_DIRS) $(ASM_DIRS) $(DATA_DIRS))

$(BUILD_DIR)/%.o: %.c $(BUILD_DIR)
	@$(CC_CHECK) $<
	$(CC) -c $(CFLAGS) -o $@ $<

$(BUILD_DIR)/%.o: %.s $(BUILD_DIR)
	$(AS) $(ASFLAGS) -o $@ $<

$(BUILD_DIR)/$(TARGET).elf: $(O_FILES) $(LD_SCRIPT)
	$(LD) $(LDFLAGS) -o $@ $(O_FILES) $(LIBS)

$(BUILD_DIR)/$(TARGET).bin: $(BUILD_DIR)/$(TARGET).elf
	$(OBJCOPY) $< $@ -O binary

# final z64 updates checksum
$(BUILD_DIR)/$(TARGET).z64: $(BUILD_DIR)/$(TARGET).bin
	$(N64CKSUM) $< $@

$(BUILD_DIR)/$(TARGET).hex: $(TARGET).z64
	xxd $< > $@

$(BUILD_DIR)/$(TARGET).objdump: $(BUILD_DIR)/$(TARGET).elf
	$(OBJDUMP) -D $< > $@

test: $(TARGET).z64
	$(EMULATOR) $(EMU_FLAGS) $<

load: $(TARGET).z64
	$(LOADER) $(LOADER_FLAGS) $<

.PHONY: all clean default diff test load
