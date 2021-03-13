SRCS			=	$(wildcard *.v)
TOP				=	openmips_min_sopc_tb

TARGET			=	openMIPS.out

LOG				=	iverilog
LOGFLAGS		=	-Wall 

SIM				=	vvp
SIMFLAGS		=	

$(TARGET): $(SRCS)
	$(LOG) $(LOGFLAGS) -o $@ -s $(TOP) $^

sim: $(TARGET)
	$(SIM) $(SIMFLAGS) $(TARGET)

wave: sim
	$(shell /Applications/gtkwave.app/Contents/Resources/bin/gtkwave dump.vcd)

clean:
	@rm -f $(TARGET)
