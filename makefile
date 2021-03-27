SRCS			=	$(wildcard *.v)
TOP				=	openmips_min_sopc_tb

TARGET			=	openMIPS.out

LOG				=	iverilog
LOGFLAGS		=	-Wall 

SIM				=	vvp
SIMFLAGS		=	

VERILATOR		=	verilator
VERILATOR_ROOT ?=	$(shell bash -c 'verilator -V|grep VERILATOR_ROOT | head -1 | sed -e "s/^.*=\s*//"')
VINC 			:=	$(VERILATOR_ROOT)/include

$(TARGET): $(SRCS)
	$(LOG) $(LOGFLAGS) -o $@ -s $(TOP) $^

asm:
	make -C asm/

sim: $(TARGET) asm
	$(SIM) $(SIMFLAGS) $(TARGET)

wave: sim
	$(shell /Applications/gtkwave.app/Contents/Resources/bin/gtkwave dump.vcd)

clean:
	@rm -f $(TARGET)


#Target			=	my_design
#SimFile			=	$(addprefix V,$(Target))
#
#
#all: $(Target)
#
#obj_dir/$(SimFile).cpp: $(Target).v
#	$(VERILATOR) --trace -Wall -cc $<
#
#obj_dir/$(SimFile)__ALL.a: obj_dir/$(SimFile).cpp
#	make -C obj_dir -f $(SimFile).mk
#
#$(Target): $(Target).cpp obj_dir/$(SimFile)__ALL.a
#	g++ -std=c++11	-I obj_dir		\
#		-I $(VINC)					\
#		$(VINC)/verilated.cpp       \
#		$(VINC)/verilated_vcd_c.cpp \
#		$^							\
#		-o $(Target)
#
#wave: $(Target)
#	$(shell ./$(Target))
#	$(shell /Applications/gtkwave.app/Contents/Resources/bin/gtkwave $(Target).vcd)
#
#clean:
#	rm -rf obj_dir/ $(Target) $(Target).vcd
