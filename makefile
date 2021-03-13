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

clean:
	@rm -f $(TARGET)
