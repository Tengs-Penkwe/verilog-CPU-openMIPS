module id{
	input wire					rst,

	//Read Instruction from IF_ID
	input wire[`InstAddrBus] 	pc_i,
	input wire[`InstBus]		inst_i,

	//Read Data from Regfile
	input wire[`RegBus]			reg1_data_i,			
	input wire[`RegBus]			reg2_data_i,			
	
	//Send Information to Regfile
	output reg[`RegAddrBus]		reg1_addr_o,
	output reg[`RegAddrBus]		reg2_addr_o,
	output reg					reg1_read_o,
	output reg					reg2_read_o,

	//ALU operation
	output reg[`AluOpBus]		aluop_o,
	output reg[`AluSelBus]		alusel_o,

	//Read Info from Regfile and send to ID_EX
	output reg[`RegBus]			reg1_o,
	output reg[`RegBus]			reg2_o,

	//Which Reg to write
	output reg[`RegAddrBus]		wd_o,
	output reg					wreg_o
};

	/* Get Opration Code */
	wire [5:0] op1 = inst_i[31:26];
		//funct(5) in R-inst
	wire [4:0] op2 = inst_i[10:6];
		//funct(6) in R-inst
	wire [5:0] op3 = inst_i[5:0];
		//rd(5) in R-inst
	wire [4:0] op4 = inst_i[20:16];

	/* Immediate Number */
	reg [`RegBus] imm ;

	/* State */
	reg 	instvalid;

	/********************* 1.Instruction Decipher ********************
	* In this Stage, OP1(31~26) is read, then we send instruction 
	* to other stage
	***************************************************************/
	
	always @(*) begin
		if(rst==`RstEnable) begin
			//Reg to read
			reg1_read_o <= `ReadDisable;
			reg2_read_o <= `ReadDisable;
			wreg_o		<= `WriteDisable;
			reg1_addr_o <= `NOPRegAddr;
			reg2_addr_o <= `NOPRegAddr;
			wd_o		<= `NOPRegAddr;		
			//Data to send
			imm			<= `ZeroWord;
				//no need, guaranteed to be zero
				//reg1_o		<= `ZeroWord 
				//reg2_o		<= `ZeroWord 
			//ALU
			aluop_o     <= `EXE_NOP_OP;
			alusel_o	<= `EXE_RES_NOP;
		//State 
			//Mind this ! valide (1`b0) and it's nop
			instvalid	<= `InstValid;
		end else begin
			reg1_read_o <= `ReadDisable;
			reg2_read_o <= `ReadDisable;
			wreg_o		<= `WriteDisable;
			reg1_addr_o <= inst_i[25:21];
			reg2_addr_o <= inst_i[20:16];
			wd_o		<= inst_i[15:11];		
			imm			<= `ZeroWord;
			aluop_o     <= `EXE_NOP_OP;
			alusel_o	<= `EXE_RES_NOP;
		//First we need to Invlaid it, incase there is some glitch
			instvalid	<= `InstInvalid;

			case(op)
				`EXE_ORI: begin
				//op1(31~26):	001101
				//rs(25:21):	Source Regfile
				//rt(20:16):	Target Regfile, used as Destination in I-inst
				//imm(15:0);	Zero Extended
					wd_o			<= inst_i[20:16];
					imm				<= {16'h0,inst_i[15:0]};
					
					wreg_o			<= `WriteEnable;
					reg1_read_o		<= `ReadEnable;
					reg2_read_o		<= `ReadDisable;
					
					aluop_o			<= `EXE_OR_OP;
					alusel_o		<= `EXE_RES_LOGIC;

					instvalid		<= `InstValid;
					end
				default: begin
					end
			endcase
		end			//if
	end				//always

	/********************* 2.Get the Source Operators ********************
	* In this Stage, we get the operators(rs,rt) from Regfiles
	***************************************************************/

	always @(*) begin
		if(rst==`RstEnable) begin
			reg1_o		<= `ZeroWord;
		end else if(reg1_read_o == `ReadEnable) begin
			reg1_o 		<= reg1_data_i;
		end else if(reg1_read_o == `ReadDisable) begin
			reg1_o 		<= imm;
		end else begin
			reg1_o		<= `ZeroWord;
		end
	end
	
	always @(*) begin
		if(rst==`RstEnable) begin
			reg2_o		<= `ZeroWord;
		end else if(reg2_read_o == `ReadEnable) begin
			reg2_o 		<= reg2_data_i;
		end else if(reg2_read_o == `ReadDisable) begin
			reg2_o 		<= imm;
		end else begin
			reg2_o		<= `ZeroWord;
		end
	end

endmodule
