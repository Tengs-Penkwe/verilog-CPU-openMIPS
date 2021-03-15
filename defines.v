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
// Immediate Instruction
`define EXE_ORI			6'b001101		//ori -> 6'op:rs:rt:16'imm
`define EXE_ANDI		6'b001100		//andi-> 6'op:rs:rt:16'imm
`define EXE_XORI		6'b001110		//xori-> 6'op:rs:rt:16'imm
`define EXE_LUI			6'b001111		//lui -> 6'op:5'0:rt:16'imm

`define EXE_PERF		6'b110011		//perf-> 6'op:5'bs:5'ht:16'off

// Register Instruction
`define EXE_SPEC_INST	6'b000000
`define EXE_NOP			6'b000000		//nop -> 6'0:5'0:5'0:5'0:5'0:6'0

`define EXE_SLL			6'b000000		//sll -> 6'0:5'0:rt:rd:sa:6'fnc
`define EXE_SRL			6'b000010		//srl -> 6'0:5'0:rt:rd:sa:6'fnc
`define EXE_SRA			6'b000011		//sra -> 6'0:5'0:rt:rd:sa:6'fnc
`define EXE_SLLV		6'b000100		//sllv-> 6'0:rs:rt:rd:5'0:6'fnc
`define EXE_SRLV		6'b000110		//srlv-> 6'0:rs:rt:rd:5'0:6'fnc
`define EXE_SRAV		6'b000111		//srav-> 6'0:rs:rt:rd:5'0:6'fnc

`define EXE_AND			6'b100100		//and -> 6'0:rs:rt:rd:5'0:6'fnc
`define EXE_OR			6'b100101		//or  -> 6'0:rs:rt:rd:5'0:6'fnc
`define EXE_XOR			6'b100110		//xor -> 6'0:rs:rt:rd:5'0:6'fnc
`define EXE_NOR			6'b100111		//nor -> 6'0:rs:rt:rd:5'0:6'fnc

`define EXE_SYNC		6'b001111		//sync-> 6'0:rs:rt:rd:5'0:6'fnc

//AluOp
`define EXE_NOP_OP		8'b00000000

`define EXE_AND_OP		8'b00100100
`define EXE_OR_OP		8'b00100101
`define EXE_XOR_OP		8'b00100110
`define EXE_NOR_OP		8'b00100111
`define EXE_ANDI_OP		8'b01011001
`define EXE_ORI_OP		8'b01011010
`define EXE_XORI_OP		8'b01011011
`define EXE_LUI_OP		8'b01011100

`define EXE_SLL_OP		8'b01111100
`define EXE_SLLV_OP		8'b00000100
`define EXE_SRL_OP		8'b00000010
`define EXE_SRLV_OP		8'b00000110
`define EXE_SRA_OP		8'b00000011
`define EXE_SRAV_OP		8'b00000111

//AluSel
`define EXE_RES_NOP		3'b000
`define EXE_RES_LOGIC	3'b001
`define EXE_RES_SHIFT	3'b010

//*************** Macro about ROM (instruction inside) ************
`define InstAddrBus		31:0		//Width of Address Bus of ROM
`define InstBus			31:0		//Width of Data Bus of ROM
`define InstMemNum		131072		//Actual Size is 128KiB
`define InstMemNumLog2	17			//Actual Address Bus Width
`define ByteWidth		8

//*************** Macro about General Register Regfile ************
`define RegAddrBus 4:0				//Regfile Address Bus Width
`define RegBus 31:0					//Regfile Data Bus width
`define RegWidth 32					//Width of G-Reg
`define DoubleRegWidth 64			
`define DoubleRegBus 63:0
`define RegNum 32					//Number of G-Regs 2^5=32
`define RegNumLog2 5				
`define NOPRegAddr 5'b00000			//Reg r0 === 0, for special utility

