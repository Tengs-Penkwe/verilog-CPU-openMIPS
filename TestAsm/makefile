CROSS_COMPILE	=	mips-sde-elf-
CC				=	$(CROSS_COMPILE)as
LD				=	$(CROSS_COMPILE)ld
OBJCOPY			=	$(CROSS_COMPILE)objcopy
OBJDUMP			=	$(CROSS_COMPILE)objdump

OBJS			=	inst_rom.o

# ********************
# Rules of Compilation
# ********************

all: inst_rom.om inst_rom.bin inst_rom.asm inst_rom.data

%.o: %.S
	$(CC) -mips32 $< -o $@
inst_rom.om: ram.ld $(OBJS)
	$(LD) -T ram.ld $(OBJS) -o $@
inst_rom.bin: inst_rom.om
	$(OBJCOPY) -O binary $< $@
inst_rom.asm: inst_rom.om
	$(OBJDUMP) -D $< > $@
inst_rom.data: inst_rom.bin
	./Bin2Mem -o $@ $<

clean:
	rm -f *.o *.om *.bin *.data *.mif *.asm
