# Makefile to rebuild SM64 split image

### Default target ###

default: all

### Build Options ###
# Version of the game to build
VERSION ?= jp
# If COMPARE is 1, check the output sha1sum when building 'all'
COMPARE ?= 1

ifeq ($(VERSION),jp)
  VERSION_CFLAGS := -DVERSION_JP=1
  VERSION_ASFLAGS := --defsym VERSION_JP=1
  TARGET := sm64.j
else
ifeq ($(VERSION),us)
  VERSION_CFLAGS := -DVERSION_US=1
  VERSION_ASFLAGS := --defsym VERSION_US=1
  TARGET := sm64.u
else
  $(error unknown version "$(VERSION)")
endif
endif

################ Target Executable and Sources ###############

# BUILD_DIR is location where all build artifacts are placed
BUILD_DIR_BASE := build
BUILD_DIR := $(BUILD_DIR_BASE)/$(VERSION)

LIBULTRA := $(BUILD_DIR)/libultra.a
ROM := $(BUILD_DIR)/$(TARGET).z64
ELF := $(BUILD_DIR)/$(TARGET).elf
LD_SCRIPT := sm64.ld
MIO0_DIR := $(BUILD_DIR)/mio0
TEXTURE_DIR := textures
ACTOR_DIR := actors

# Directories containing source files
SRC_DIRS := src src/goddard src/goddard/dynlists src/audio
ASM_DIRS := asm actors lib data levels sound demos anims text
BIN_DIRS := bin

ULTRA_SRC_DIRS := lib/src lib/src/math
ULTRA_ASM_DIRS := lib/asm lib/data

LEVEL_DIRS := $(patsubst levels/%,%,$(dir $(wildcard levels/*/header.s)))

MIPSISET := -mips2 -32
OPT_FLAGS := -g

# File dependencies and variables for specific files
include Makefile.split

# Source code files
C_FILES := $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.c))
S_FILES := $(foreach dir,$(ASM_DIRS),$(wildcard $(dir)/*.s))
ULTRA_C_FILES := $(foreach dir,$(ULTRA_SRC_DIRS),$(wildcard $(dir)/*.c))
ULTRA_S_FILES := $(foreach dir,$(ULTRA_ASM_DIRS),$(wildcard $(dir)/*.s))
LEVEL_S_FILES := $(addsuffix header.s,$(addprefix bin/,$(LEVEL_DIRS)))
SEG_IN_FILES := $(foreach dir,$(BIN_DIRS),$(wildcard $(dir)/*.s.in))
SEG_S_FILES := $(foreach dir,$(BIN_DIRS),$(wildcard $(dir)/*.s)) \
               $(foreach file,$(SEG_IN_FILES),$(file:.s.in=.s))

# Object files
O_FILES := $(foreach file,$(C_FILES),$(BUILD_DIR)/$(file:.c=.o)) \
           $(foreach file,$(S_FILES),$(BUILD_DIR)/$(file:.s=.o)) \
           $(foreach file,$(LEVEL_S_FILES),$(BUILD_DIR)/$(file:.s=.o))

ULTRA_O_FILES := $(foreach file,$(ULTRA_S_FILES),$(BUILD_DIR)/$(file:.s=.o)) \
                 $(foreach file,$(ULTRA_C_FILES),$(BUILD_DIR)/$(file:.c=.o))

# Automatic dependency files
DEP_FILES := $(O_FILES:.o=.d) $(ULTRA_O_FILES:.o=.d)

# Segment elf files
SEG_FILES := $(foreach file,$(SEG_S_FILES),$(BUILD_DIR)/$(file:.s=.elf)) $(ACTOR_ELF_FILES) $(LEVEL_ELF_FILES)

##################### Compiler Options #######################
IRIX_ROOT := tools/ido5.3_compiler
CROSS     := mips-linux-gnu-
AS        := $(CROSS)as
CC        := $(QEMU_IRIX) -silent -L $(IRIX_ROOT) $(IRIX_ROOT)/usr/bin/cc
CPP       := cpp -P
LD        := $(CROSS)ld
AR        := $(CROSS)ar
OBJDUMP   := $(CROSS)objdump
OBJCOPY   := $(CROSS)objcopy

# Check code syntax with host compiler
CC_CHECK := gcc -fsyntax-only -fsigned-char -I include -I $(BUILD_DIR)/include -std=gnu90 -Wall -Wextra -Wno-format-security $(VERSION_CFLAGS)

ASFLAGS := -march=vr4300 -mabi=32 -I include -I $(BUILD_DIR) $(VERSION_ASFLAGS)
CFLAGS = -Wab,-r4300_mul -non_shared -G 0 -Xcpluscomm -Xfullwarn $(OPT_FLAGS) -signed -I include -I $(BUILD_DIR)/include $(VERSION_CFLAGS) $(MIPSISET)
OBJCOPYFLAGS := --pad-to=0x800000 --gap-fill=0xFF
SYMBOL_LINKING_FLAGS := $(addprefix -R ,$(SEG_FILES))
LDFLAGS := -T undefined_syms.txt -T $(BUILD_DIR)/$(LD_SCRIPT) -Map $(BUILD_DIR)/sm64.map --no-check-sections $(SYMBOL_LINKING_FLAGS)

ifeq ($(shell getconf LONG_BIT), 32)
  # Work around memory allocation bug in QEMU
  export QEMU_GUEST_BASE := 1
else
  # Ensure that gcc treats the code as 32-bit
  CC_CHECK += -m32
endif

####################### Other Tools #########################

# N64 tools
TOOLS_DIR = tools
MIO0TOOL = $(TOOLS_DIR)/mio0
N64CKSUM = $(TOOLS_DIR)/n64cksum
N64GRAPHICS = $(TOOLS_DIR)/n64graphics
TEXTCONV = $(TOOLS_DIR)/textconv
EMULATOR = mupen64plus
EMU_FLAGS = --noosd
LOADER = loader64
LOADER_FLAGS = -vwf
SHA1SUM = sha1sum

###################### Dependency Check #####################

BINUTILS_VER_MAJOR := $(shell $(LD) --version | grep ^GNU | sed 's/^.* //; s/\..*//g')
BINUTILS_VER_MINOR := $(shell $(LD) --version | grep ^GNU | sed 's/^[^.]*\.//; s/\..*//g')
BINUTILS_DEPEND := $(shell expr $(BINUTILS_VER_MAJOR) \>= 2 \& $(BINUTILS_VER_MINOR) \>= 27)
ifeq ($(BINUTILS_DEPEND),0)
$(error binutils version 2.27 required, version $(BINUTILS_VER_MAJOR).$(BINUTILS_VER_MINOR) detected)
endif

ifndef QEMU_IRIX
$(error env variable QEMU_IRIX should point to the qemu-mips binary)
endif

######################## Targets #############################

all: $(ROM)
ifeq ($(COMPARE),1)
	@$(SHA1SUM) -c $(TARGET).sha1
endif

clean:
	$(RM) -r $(BUILD_DIR_BASE)

test: $(ROM)
	$(EMULATOR) $(EMU_FLAGS) $<

load: $(ROM)
	$(LOADER) $(LOADER_FLAGS) $<

libultra: $(BUILD_DIR)/libultra.a

$(BUILD_DIR)/include/text_strings.h: include/text_strings.h.in | $(BUILD_DIR)
	$(TEXTCONV) charmap.txt $< $@

$(BUILD_DIR)/text/%.s: text/$(VERSION)/%.s.in | $(BUILD_DIR)
	$(TEXTCONV) charmap.txt $< $@

build/bin/segment2.o: bin/segment2.s

bin/segment2.s: $(BUILD_DIR)/text/debug.s $(BUILD_DIR)/text/dialog.s $(BUILD_DIR)/text/level.s $(BUILD_DIR)/text/star.s
	touch bin/segment2.s

$(MIO0_DIR)/%.mio0: bin/%.bin
	$(MIO0TOOL) $< $@

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR) $(addprefix $(BUILD_DIR)/,$(SRC_DIRS) $(ASM_DIRS) $(ULTRA_SRC_DIRS) $(ULTRA_ASM_DIRS) $(BIN_DIRS) $(TEXTURE_DIRS) $(addprefix levels/,$(LEVEL_DIRS)) $(addprefix bin/,$(LEVEL_DIRS)) include text) $(MIO0_DIR) $(addprefix $(MIO0_DIR)/,$(LEVEL_DIRS))

# Make sure build directory exists before compiling objects
$(O_FILES): | $(BUILD_DIR)

$(BUILD_DIR)/src/star_select.o: $(BUILD_DIR)/include/text_strings.h
$(BUILD_DIR)/src/file_select.o: $(BUILD_DIR)/include/text_strings.h
$(BUILD_DIR)/src/ingame_menu.o: $(BUILD_DIR)/include/text_strings.h

# texture generation
$(BUILD_DIR)/bin/%.rgba16: textures/%.rgba16.png
	$(N64GRAPHICS) -i $@ -g $< -f rgba16

$(BUILD_DIR)/bin/%.ia16: textures/%.ia16.png
	$(N64GRAPHICS) -i $@ -g $< -f ia16

$(BUILD_DIR)/bin/%.ia8: textures/%.ia8.png
	$(N64GRAPHICS) -i $@ -g $< -f ia8

$(BUILD_DIR)/bin/%.ia4: textures/%.ia4.png
	$(N64GRAPHICS) -i $@ -g $< -f ia4

$(BUILD_DIR)/bin/%.ia1: textures/%.ia1.png
	$(N64GRAPHICS) -i $@ -g $< -f ia1

# texture generation 2nd method: rgba16s are preferred (and used
# more often) over the ones listed below due to more colors.
$(BUILD_DIR)/actors/%.rgba16: actors/%.rgba16.png
	$(N64GRAPHICS) -i $@ -g $< -f rgba16

$(BUILD_DIR)/actors/%.ia16: actors/%.ia16.png
	$(N64GRAPHICS) -i $@ -g $< -f ia16

$(BUILD_DIR)/actors/%.ia8: actors/%.ia8.png
	$(N64GRAPHICS) -i $@ -g $< -f ia8

$(BUILD_DIR)/actors/%.ia4: actors/%.ia4.png
	$(N64GRAPHICS) -i $@ -g $< -f ia4

$(BUILD_DIR)/actors/%.ia1: actors/%.ia1.png
	$(N64GRAPHICS) -i $@ -g $< -f ia1

# texture generation 3rd method: rgba16s are preferred (and used
# more often) over the ones listed below due to more colors.
$(BUILD_DIR)/levels/%.rgba16: levels/%.rgba16.png
	$(N64GRAPHICS) -i $@ -g $< -f rgba16

$(BUILD_DIR)/levels/%.ia16: levels/%.ia16.png
	$(N64GRAPHICS) -i $@ -g $< -f ia16

$(BUILD_DIR)/levels/%.ia8: levels/%.ia8.png
	$(N64GRAPHICS) -i $@ -g $< -f ia8

$(BUILD_DIR)/levels/%.ia4: levels/%.ia4.png
	$(N64GRAPHICS) -i $@ -g $< -f ia4

$(BUILD_DIR)/levels/%.ia1: levels/%.ia1.png
	$(N64GRAPHICS) -i $@ -g $< -f ia1

# compressed segment generation
$(BUILD_DIR)/bin/%.o: bin/%.s
	$(AS) $(ASFLAGS) --no-pad-sections -o $@ $<

# compressed segment generation (actors)
$(BUILD_DIR)/bin/%.o: actors/%.s
	$(AS) $(ASFLAGS) --no-pad-sections -o $@ $<

$(BUILD_DIR)/bin/%/level.o: levels/%/level.s
	$(AS) $(ASFLAGS) --no-pad-sections -o $@ $<

$(BUILD_DIR)/bin/%/header.o: levels/%/header.s $(MIO0_DIR)/%/level.mio0 levels/%/script.s
	$(AS) $(ASFLAGS) --no-pad-sections -o $@ $<

# TODO: ideally this would be `-Trodata-segment=0x07000000` but that doesn't set the address
$(BUILD_DIR)/bin/%.elf: $(BUILD_DIR)/bin/%.o
	$(LD) -e 0 -Ttext=$(SEGMENT_ADDRESS) -Map $@.map -o $@ $<

# Override for level.elf, which otherwise matches the above pattern
.SECONDEXPANSION:
$(BUILD_DIR)/bin/%/level.elf: $(BUILD_DIR)/bin/%/level.o $(BUILD_DIR)/bin/$$(TEXTURE_BIN).elf
	$(LD) -e 0 -Ttext=$(SEGMENT_ADDRESS) --just-symbols=$(BUILD_DIR)/bin/$(TEXTURE_BIN).elf -o $@ $<

$(BUILD_DIR)/bin/%.bin: $(BUILD_DIR)/bin/%.elf
	$(OBJCOPY) -j .rodata $< -O binary $@

$(MIO0_DIR)/%.mio0: $(BUILD_DIR)/bin/%.bin
	$(MIO0TOOL) $< $@

$(MIO0_DIR)/%.mio0.o: $(MIO0_DIR)/%.mio0.s
	$(AS) $(ASFLAGS) -o $@ $<

$(MIO0_DIR)/%.mio0.s: $(MIO0_DIR)/%.mio0
	printf ".section .data\n\n.incbin \"$<\"\n" > $@

# Source code
$(BUILD_DIR)/src/goddard/%.o: MIPSISET := -mips1
$(BUILD_DIR)/src/audio/%.o: CC := python3 tools/asm_processor/build.py $(CC) -- $(AS) $(ASFLAGS) --
$(BUILD_DIR)/src/audio/dma.o: OPT_FLAGS := -O2 -framepointer -Wo,-loopunroll,0
$(BUILD_DIR)/src/audio/playback.o: OPT_FLAGS := -O2 -Wo,-loopunroll,0
$(BUILD_DIR)/src/audio/interface_2.o: OPT_FLAGS := -O2 -Wo,-loopunroll,0
$(BUILD_DIR)/lib/src/%.o: OPT_FLAGS :=
$(BUILD_DIR)/lib/src/math/ll%.o: MIPSISET := -mips3 -32
$(BUILD_DIR)/lib/src/math/%.o: OPT_FLAGS := -O2
$(BUILD_DIR)/lib/src/math/ll%.o: OPT_FLAGS :=
$(BUILD_DIR)/lib/src/ldiv.o: OPT_FLAGS := -O2
$(BUILD_DIR)/lib/src/string.o: OPT_FLAGS := -O2
$(BUILD_DIR)/lib/src/gu%.o: OPT_FLAGS := -O3
$(BUILD_DIR)/lib/src/al%.o: OPT_FLAGS := -O3

$(BUILD_DIR)/lib/src/math/%.o: lib/src/math/%.c
	@$(CC_CHECK) -MMD -MT $@ -MF $(BUILD_DIR)/lib/src/$*.d $<
	$(CC) -c $(CFLAGS) -o $@ $<
	tools/patch_libultra_math $@ || rm $@

$(BUILD_DIR)/%.o: %.c
	@$(CC_CHECK) -MMD -MT $@ -MF $(BUILD_DIR)/$*.d $<
	$(CC) -c $(CFLAGS) -o $@ $<


$(BUILD_DIR)/%.o: %.s $(MIO0_FILES)
	$(AS) $(ASFLAGS) -MD $(BUILD_DIR)/$*.d -o $@ $<

$(BUILD_DIR)/$(LD_SCRIPT): $(LD_SCRIPT)
	$(CPP) $(VERSION_CFLAGS) -DBUILD_DIR=$(BUILD_DIR) $< > $@

$(BUILD_DIR)/libultra.a: $(ULTRA_O_FILES)
	$(AR) rcs -o $@ $(ULTRA_O_FILES)

$(ELF): $(O_FILES) $(MIO0_OBJ_FILES) $(SEG_FILES) $(BUILD_DIR)/$(LD_SCRIPT) undefined_syms.txt $(BUILD_DIR)/libultra.a
	$(LD) -L $(BUILD_DIR) $(LDFLAGS) -o $@ $(O_FILES)$(LIBS) -lultra

$(ROM): $(ELF)
	$(OBJCOPY) $(OBJCOPYFLAGS) $< $(@:.z64=.bin) -O binary
	$(N64CKSUM) $(@:.z64=.bin) $@

$(BUILD_DIR)/$(TARGET).objdump: $(ELF)
	$(OBJDUMP) -D $< > $@



.PHONY: all clean default diff test load libultra
.PRECIOUS: $(BUILD_DIR)/mio0/%.mio0 $(BUILD_DIR)/bin/%.elf $(BUILD_DIR)/mio0/%.mio0.s

-include $(DEP_FILES)

print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true
