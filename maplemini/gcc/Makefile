
BINARY   = miniblink
LDSCRIPT = stm32-maple.ld
LIBNAME	 = opencm3_stm32f1
DEFS    += -DSTM32F1

FP_FLAGS  ?= -msoft-float
ARCH_FLAGS = -mthumb -mcpu=cortex-m3 $(FP_FLAGS) \
						 -mfix-cortex-m3-ldrd

#########################################################

# Be silent per default, but 'make V=1' will show
# all compiler calls.
ifneq ($(V),1)
Q := @
NULL := 2>/dev/null
endif

#########################################################
# Executables

PREFIX ?= arm-none-eabi

CC		:= $(PREFIX)-gcc
CXX		:= $(PREFIX)-g++
LD		:= $(PREFIX)-gcc
AR		:= $(PREFIX)-ar
AS		:= $(PREFIX)-as
OBJCOPY	:= $(PREFIX)-objcopy
OBJDUMP	:= $(PREFIX)-objdump
GDB		:= $(PREFIX)-gdb
OPT		:= -Os
DEBUG	:= -ggdb3
CSTD	?= -std=c99

#########################################################
# Source files

OBJS += $(BINARY).o

STM_DIR := /home/wiffel/dev/hardware/stm32
OPENCM3_DIR := $(STM_DIR)/libopencm3-examples/libopencm3

ifeq ($(V),1)
$(info Using $(OPENCM3_DIR) path to library)
endif

DEFS     += -I$(OPENCM3_DIR)/include
LDFLAGS  += -L$(OPENCM3_DIR)/lib
LDLIBS   += -l$(LIBNAME)
LDSCRIPT ?= $(BINARY).ld

OPENCM3_SCRIPT_DIR = $(OPENCM3_DIR)/scripts
EXAMPLES_SCRIPT_DIR	= $(OPENCM3_DIR)/../scripts

#########################################################
# C flags

TGT_CFLAGS += $(OPT) $(CSTD) $(DEBUG)
TGT_CFLAGS += $(ARCH_FLAGS)
TGT_CFLAGS += -Wextra -Wshadow \
							-Wimplicit-function-declaration
TGT_CFLAGS += -Wredundant-decls -Wmissing-prototypes \
							-Wstrict-prototypes
TGT_CFLAGS += -fno-common -ffunction-sections \
							-fdata-sections

#########################################################
# C++ flags

TGT_CXXFLAGS += $(OPT) $(CXXSTD) $(DEBUG)
TGT_CXXFLAGS += $(ARCH_FLAGS)
TGT_CXXFLAGS += -Wextra -Wshadow -Wredundant-decls \
								-Weffc++
TGT_CXXFLAGS += -fno-common -ffunction-sections \
								-fdata-sections

#########################################################
# C & C++ preprocessor common flags

TGT_CPPFLAGS	+= -MD
TGT_CPPFLAGS	+= -Wall -Wundef
TGT_CPPFLAGS	+= $(DEFS)

#########################################################
# Linker flags

TGT_LDFLAGS		+= --static -nostartfiles
TGT_LDFLAGS		+= -T$(LDSCRIPT)
TGT_LDFLAGS		+= $(ARCH_FLAGS) $(DEBUG)
TGT_LDFLAGS		+= -Wl,-Map=$(*).map -Wl,--cref
TGT_LDFLAGS		+= -Wl,--gc-sections
ifeq ($(V),99)
TGT_LDFLAGS		+= -Wl,--print-gc-sections
endif

#########################################################
# Used libraries

LDLIBS += -Wl,--start-group -lc -lgcc -lnosys \
					-Wl,--end-group

#########################################################

.SUFFIXES: .elf .bin .hex .srec .list .map
.SECONDEXPANSION:
.SECONDARY:

all: bin

elf: $(BINARY).elf
bin: $(BINARY).bin
hex: $(BINARY).hex
srec: $(BINARY).srec
list: $(BINARY).list

# Define a helper macro for debugging make errors online
# you can type "make print-OPENCM3_DIR" and it will
# show you how that ended up being resolved by all of
# the included makefiles.
print-%:
	@echo $*=$($*)

%.bin: %.elf
	@#printf "  OBJCOPY $(*).bin\n"
	$(Q)$(OBJCOPY) -Obinary $(*).elf $(*).bin

%.hex: %.elf
	@#printf "  OBJCOPY $(*).hex\n"
	$(Q)$(OBJCOPY) -Oihex $(*).elf $(*).hex

%.srec: %.elf
	@#printf "  OBJCOPY $(*).srec\n"
	$(Q)$(OBJCOPY) -Osrec $(*).elf $(*).srec

%.list: %.elf
	@#printf "  OBJDUMP $(*).list\n"
	$(Q)$(OBJDUMP) -S $(*).elf > $(*).list

%.elf %.map: $(OBJS) $(LDSCRIPT)
	@#printf "  LD      $(*).elf\n"
	$(Q)$(LD) $(TGT_LDFLAGS) $(LDFLAGS) $(OBJS) \
		$(LDLIBS) -o $(*).elf

%.o: %.c
	@#printf "  CC      $(*).c\n"
	$(Q)$(CC) $(TGT_CFLAGS) $(CFLAGS) $(TGT_CPPFLAGS) \
		$(CPPFLAGS) -o $(*).o -c $(*).c

%.o: %.cxx
	@#printf "  CXX     $(*).cxx\n"
	$(Q)$(CXX) $(TGT_CXXFLAGS) $(CXXFLAGS) \
		$(TGT_CPPFLAGS) $(CPPFLAGS) -o $(*).o -c $(*).cxx

%.o: %.cpp
	@#printf "  CXX     $(*).cpp\n"
	$(Q)$(CXX) $(TGT_CXXFLAGS) $(CXXFLAGS) \
		$(TGT_CPPFLAGS) $(CPPFLAGS) -o $(*).o -c $(*).cpp

clean:
	@#printf "  CLEAN\n"
	$(Q)$(RM) *.o *.d *.elf *.bin *.hex *.srec *.list \
		*.map generated.* ${OBJS} ${OBJS:%.o:%.d}

.PHONY: clean elf bin hex srec list

-include $(OBJS:.o=.d)
