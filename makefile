SRCS			=	$(wildcard *.v)
TOP				=	openmips_min_sopc_tb

TARGET			=	openMIPS.out

LOG				=	iverilog
LOGFLAGS		=	-Wall 

SIM				=	vvp
SIMFLAGS		=	

$(TARGET): 
	$(LOG) $(LOGFLAGS) -o $@ -s $(TOP)  $(SRCS)

sim: $(TARGET)
	$(SIM) $(SIMFLAGS) $(TARGET)

clean:
	@rm -f $(TARGET)
