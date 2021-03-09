//************* Global Macro definition ********************
`define RstEnable 1'b1			//reset signal
`define RstDisable 1'b0
`define ZeroWord 32'h00000000	//zero of 32 bits
`define WriteEnable 1'b1
`define WriteDisable 1'b0
`define ReadEnable 1'b1
`define ReadDisable 1'b0
`define AluOpBus 7:0			//ALUop_o width in the Instruction Decipher Stage
`define AluSelBus 2:0			//ALUsel_o with in ID stage
//Mind this, valid if 1`b0
`define InstValid 1'b0			//Valid Instruction
`define InstInvalid 1'b1
`define True_v 1'b1				
`define False_v 1'b0
`define ChipEnable 1'b1
`define ChipDisable 1'b0

//************* Macro about specific instruction ************
`define EXE_ORI			6'b001101		//ori -> 6'op:rs:rt:16'imm
`define EXE_NOP			6'b000000		//nop

//AluOp
`define EXE_OR_OP		8'b00100101
`define EXE_NOP_OP		8'b00000000

//AluSel
`define EXE_RES_LOGIC	3'b001
`define EXE_RES_NOP		3'b000

//*************** Macro about ROM (instruction inside) ************
`define InstAddrBus		31:0		//Width of Address Bus of ROM
`define InstBus			31:0		//Width of Data Bus of ROM
`define InstMemNum		131071		//Actual Size is 128KiB
`define InstMemNumLog2	17			//Actual Address Bus Width

//*************** Macro about General Register Regfile ************
`define RegAddrBus 4:0				//Regfile Address Bus Width
`define RegBus 31:0					//Regfile Data Bus width
`define RegWidth 32					//Width of G-Reg
`define DoubleRegWidth 64			
`define DoubleRegBus 63:0
`define RegNum 32					//Number of G-Regs 2^5=32
`define RegNumLog2 5				
`define NOPRegAddr 5'b00000			//Reg r0 === 0, for special utility
