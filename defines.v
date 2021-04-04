`default_nettype none
//************* Global Macro definition ********************
`define RstEnable		1'b1			//reset signal
`define RstDisable		1'b0
`define ZeroWord		32'h00000000	//zero of 32 bits
`define WriteEnable		1'b1
`define WriteDisable	1'b0
`define ReadEnable		1'b1
`define ReadDisable		1'b0
`define AluOpBus		7:0			//ALUop_o width in the Instruction Decipher Stage
`define AluSelBus		2:0			//ALUsel_o with in ID stage
//Mind this, valid if 1`b0
`define InstValid		1'b0			//Valid Instruction
`define InstInvalid		1'b1
`define Stop			1'b1
`define NoStop			1'b0
`define True_v			1'b1				
`define False_v			1'b0
`define ChipEnable		1'b1
`define ChipDisable		1'b0

//************* Macro about specific instruction ************
//********** Opcode 31~26 **********//
// Immediate Instruction
`define EXE_ORI			6'b001101		//ori -> 6'op:rs:rt:16'imm
`define EXE_ANDI		6'b001100		//andi-> 6'op:rs:rt:16'imm
`define EXE_XORI		6'b001110		//xori-> 6'op:rs:rt:16'imm
`define EXE_LUI			6'b001111		//lui -> 6'op:5'0:rt:16'imm

`define EXE_PERF		6'b110011		//perf-> 6'op:5'bs:5'ht:16'off

`define EXE_ADDI		6'b001000
`define EXE_ADDIU		6'b001001
`define EXE_SLTI		6'b001010
`define EXE_SLTIU		6'b001011
// Register Instruction


//********** Funct 5~0 **********//
//Special 1 => 6'b000000
`define EXE_SPEC_INST	6'b000000
`define EXE_NOP			6'b000000		//nop -> 6'0:5'0:5'0:5'0:5'0:6'0			 //SLL, NOP, SSNOP
		
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

`define EXE_MOVZ		6'b001010		//movz-> 6'0:rs:rt:rd:5'0:6'fnc
`define EXE_MOVN		6'b001011		//movn-> 6'0:rs:rt:rd:5'0:6'fnc
`define EXE_MFHI		6'b010000		//mfhi-> 6'0:5'0:5'0:rd:5'0:6'fnc
`define EXE_MTHI		6'b010001		//mthi-> 6'0:5'0:5'0:rd:5'0:6'fnc
`define EXE_MFLO		6'b010010		//mflo-> 6'0:rs:5'0:5'0:5'0:6'fnc
`define EXE_MTLO		6'b010011		//mtlo-> 6'0:rs:5'0:5'0:5'0:6'fnc

`define EXE_ADD			6'b100000
`define EXE_ADDU		6'b100001
`define EXE_SUB			6'b100010
`define EXE_SUBU		6'b100011
`define EXE_SLT			6'b101010
`define EXE_SLTU		6'b101011

`define EXE_DIV			6'b011010
`define EXE_DIVU		6'b011011

`define EXE_MULT		6'b011000
`define EXE_MULTU		6'b011001
//Special 2 000000=> 6'b011100
`define EXE_SPEC2_INST	6'b011100
`define EXE_MUL			6'b000010
`define EXE_MADD		6'b000000
`define EXE_MADDU		6'b000001
`define EXE_MSUB		6'b000100
`define EXE_MSUBU		6'b000101

`define EXE_CLZ			6'b100000
`define EXE_CLO			6'b100001

//********** AluOp **********//
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

`define EXE_MOVZ_OP		8'b00001010
`define EXE_MOVN_OP		8'b00001011
`define EXE_MFHI_OP		8'b00010000
`define EXE_MTHI_OP		8'b00010001
`define EXE_MFLO_OP		8'b00010010
`define EXE_MTLO_OP		8'b00010011

`define EXE_SLT_OP		8'b00101010
`define EXE_SLTU_OP		8'b00101011
`define EXE_SLTI_OP		8'b01010111
`define EXE_SLTIU_OP	8'b01011000
`define EXE_ADD_OP		8'b00100000
`define EXE_ADDU_OP		8'b00100001
`define EXE_SUB_OP		8'b00100010
`define EXE_SUBU_OP		8'b00100011
`define EXE_ADDI_OP		8'b01010101
`define EXE_ADDIU_OP	8'b01010110
`define EXE_CLZ_OP		8'b10110000
`define EXE_CLO_OP		8'b10110001

`define EXE_MULT_OP		8'b00011000
`define EXE_MULTU_OP	8'b00011001
`define EXE_MUL_OP		8'b10101001
`define EXE_MADD_OP		8'b10100110
`define EXE_MADDU_OP	8'b10101000
`define EXE_MSUB_OP		8'b10101010
`define EXE_MSUBU_OP	8'b10101011

`define EXE_DIV_OP		8'b00011010
`define EXE_DIVU_OP		8'b00011011
//********** AluSel **********//
`define EXE_RES_NOP		3'b000
`define EXE_RES_LOGIC	3'b001
`define EXE_RES_SHIFT	3'b010
`define EXE_RES_MOVE	3'b011
`define EXE_RES_ARITH	3'b100
`define EXE_RES_MUL		3'b101

//*************** Macro about ROM (instruction inside) ************
`define InstAddrBus		31:0		//Width of Address Bus of ROM
`define InstBus			31:0		//Width of Data Bus of ROM
`define InstMemNum		131072		//Actual Size is 128KiB
`define InstMemNumLog2	17			//Actual Address Bus Width
`define ByteWidth		8

//*************** Macro about General Register Regfile ************
`define RegAddrBus		4:0			//Regfile Address Bus Width
`define RegBus			31:0		//Regfile Data Bus width
`define RegWidth		32			//Width of G-Reg
`define DoubleRegWidth	64			
`define DoubleRegBus 	63:0
`define RegNum			32			//Number of G-Regs 2^5=32
`define RegNumLog2		5				
`define NOPRegAddr		5'b00000	//Reg r0 === 0, for special utility


//*************** Divide ************
`define DivFree			2'b00
`define DivByZero		2'b01
`define DivOn			2'b10
`define DivEnd			2'b11
`define DivResultReady	1'b1
`define DivResultNotReady	1'b0
`define DivStart		1'b1
`define DivStop			1'b0
