`include "defines.v"
module id(
	input wire					rst,

	//Read Instruction from IF_ID
	input wire[`InstAddrBus] 	pc_i,
	input wire[`InstBus]		inst_i,

	//Read Data from Regfile
	input wire[`RegBus]			reg1_data_i,			
	input wire[`RegBus]			reg2_data_i,			

	/********** Data Forward **********/ 
	input wire					ex_wreg_i,
	input wire[`RegBus]			ex_wdata_i,
	input wire[`RegAddrBus]		ex_wd_i,
	input wire					mem_wreg_i,
	input wire[`RegBus]			mem_wdata_i,
	input wire[`RegAddrBus]		mem_wd_i,
	/********** Data Forward **********/ 

	
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
);

	/* Get Opration Code */
		//Opcode(6) in R,I,J
		wire [5:0] op		= inst_i[31:26];
		//Shamt(5) in R
		wire [4:0] shamt	= inst_i[10:6];		//offset
		//Funct(6) in R
		wire [5:0] funct	= inst_i[5:0];
		//rs(5) in R,I
		wire [4:0] rs		= inst_i[25:21];
		//rt(5) in R,I
		wire [4:0] rt		= inst_i[20:16];
		//rd(5) in R,I,J
		wire [4:0] rd		= inst_i[15:10];
		//Sign-extended Imm
		wire [31:0] sgn_imm	= {{16{inst_i[15]}}, inst_i[15:0]};
		//Zero-extended Imm
		wire [31:0] zro_imm	= {16'h0,inst_i[15:0]};

	/* Immediate Number */
	reg [`RegBus] imm ;

	/* State */
	reg 	inst_valid;

	/********************* 1.Instruction Decipher ********************
	* In this Stage, OP1(31~26) is read, then we send instruction 
	* to other stage
	***************************************************************/
	
	//*************** Function-like Macro for OP decode ************
	`define SET_INST(i_aluop, i_alusel, i_read1, i_reg1_addr, i_read2, i_reg2_addr, i_wreg, i_wd, i_imm, i_inst_valid) if(1) begin \
		aluop_o       <=  i_aluop       ; \
		alusel_o      <=  i_alusel      ; \
		reg1_read_o   <=  i_read1       ; \
		reg1_addr_o   <=  i_reg1_addr   ; \
		reg2_read_o   <=  i_read2       ; \
		reg2_addr_o   <=  i_reg2_addr   ; \
		wreg_o        <=  i_wreg        ; \
		wd_o	      <=  i_wd          ; \
		imm           <=  i_imm         ; \
		inst_valid    <=  i_inst_valid  ; \
	end else if(0)
	
	`define SET_BRANCH(i_branch_flag, i_branch_target_addr, i_link_addr, i_next_in_delay_slot) if(1) begin \
		branch_flag_o         <=  i_branch_flag         ; \
		branch_addr_o         <=  i_branch_target_addr  ; \
		link_addr_o           <=  i_link_addr           ; \
		next_in_delay_slot_o  <=  i_next_in_delay_slot  ; \
	end else if(0)


	always @(*) begin 
		if(rst==`RstEnable) begin 
			`SET_INST(`EXE_NOP_OP,`EXE_RES_NOP,`ReadDisable,`NOPRegAddr,`ReadDisable,`NOPRegAddr,`WriteDisable,`NOPRegAddr,`ZeroWord,`InstValid);
			//Mind this ! valide (1'b0) and it's nop
		end else begin
			`SET_INST(`EXE_NOP_OP,`EXE_RES_NOP,`ReadDisable,inst_i[25:21],`ReadDisable,inst_i[20:16],`WriteDisable,inst_i[15:11],`ZeroWord,`InstInvalid);
			case(op)  
				`EXE_ORI:`SET_INST(`EXE_OR_OP, `EXE_RES_LOGIC,`ReadEnable,inst_i[25:21],`ReadDisable,`NOPRegAddr,`WriteEnable,inst_i[20:16],{16'h0,inst_i[15:0]},`InstValid);
					//op(31~26):001101		//rs(25:21):src		rt(20:16):target as dst		//imm(15:0):Zero Extended
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
		end else if((reg1_read_o==1'b1) && (ex_wreg_i==1'b1) && (reg1_addr_o==ex_wd_i)) begin
			reg1_o		<= ex_wdata_i;
		end else if((reg1_read_o==1'b1) && (mem_wreg_i==1'b1) && (reg1_addr_o==mem_wd_i)) begin
			reg1_o		<= mem_wdata_i;
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
		end else if((reg2_read_o==1'b1) && (ex_wreg_i==1'b1) && (reg2_addr_o==ex_wd_i)) begin
			reg2_o		<= ex_wdata_i;
		end else if((reg2_read_o==1'b1) && (mem_wreg_i==1'b1) && (reg2_addr_o==mem_wd_i)) begin
			reg2_o		<= mem_wdata_i;
		end else if(reg2_read_o == `ReadEnable) begin
			reg2_o 		<= reg2_data_i;
		end else if(reg2_read_o == `ReadDisable) begin
			reg2_o 		<= imm;
		end else begin
			reg2_o		<= `ZeroWord;
		end
	end

    `undef SET_INST
    `undef SET_BRANCH

endmodule
