`include "defines.v"
module ex(
	input wire				rst,

	input wire[`AluOpBus]	aluop_i,
	input wire[`AluSelBus]	alusel_i,

	input wire[`RegBus]		reg1_i,
	input wire[`RegBus]		reg2_i,

	input wire[`RegAddrBus]	wd_i,
	input wire				wreg_i,

	//! From HI-LO Module
	input wire[`RegBus]		hi_i,
	input wire[`RegBus]		lo_i,
	/** Operand Forward for HI-LO Register **/
	//! Write Back
	input wire[`RegBus]		wb_hi_i,
	input wire[`RegBus]		wb_lo_i,
	input wire				wb_whilo_i,
	//! Memory
	input wire[`RegBus]		mem_hi_i,
	input wire[`RegBus]		mem_lo_i,
	input wire				mem_whilo_i,
	/********** Operand Forward **********/

	output reg[`RegAddrBus]	wd_o,
	output reg				wreg_o,
	output reg[`RegBus]		wdata_o,

	output reg[`RegBus]		hi_o,
	output reg[`RegBus]		lo_o,
	output reg				whilo_o

);
	
	/********************* Save The Result of Operation *************/
	reg[`RegBus]			logicout;
	reg[`RegBus]			shiftres;
	reg[`RegBus]			moveres;
	reg[`RegBus]			HI;
	reg[`RegBus]			LO;

	wire					ov_sum;				//! Overflow Situation
	wire					reg1_eq_reg2;
	wire					reg1_lt_reg2;
	wire[`RegBus]			reg2_i_mux;			//! One's complete of the second operator
	wire[`RegBus]			reg1_i_not;
	wire[`RegBus]			result_sum;			//! Addition Result
	reg[`RegBus]			arithmeticres;

	wire[`RegBus]			multiplicand;
	wire[`RegBus]			multipler;
	wire[`DoubleRegBus]		hilo_temp;			//! 64 bits temporary rsult of mul
	reg[`DoubleRegBus]		mulres;

	/***************** 1.HI LO Register *************/
	//1.1 Input 
	always @(*)begin
		if (rst==`RstEnable) begin
			{HI,LO} <= {`ZeroWord, `ZeroWord};
		end else if (mem_whilo_i == `WriteEnable) begin
			{HI,LO} <= {mem_hi_i, mem_lo_i};
		end else if (wb_whilo_i == `WriteEnable) begin
			{HI,LO} <= {wb_hi_i, wb_lo_i};
		end else begin 
			{HI,LO} <= {hi_i, lo_i};
		end
	end
	//3.2 Output to HI-Lo register
	always @(*) begin
		if (rst==`RstEnable) begin
			whilo_o	<= `WriteDisable;
			hi_o	<= `ZeroWord;
			lo_o	<= `ZeroWord;
		end else if((aluop_i == `EXE_MULT_OP) || (aluop_i == `EXE_MULTU_OP)) begin
			whilo_o	<= `WriteEnable;
			hi_o	<= mulres[63:32];
			lo_o	<= mulres[31:0];
		end else if(aluop_i == `EXE_MTHI_OP)begin
			whilo_o	<= `WriteEnable;
			hi_o	<= reg1_i;
			lo_o	<= LO;
		end else if(aluop_i == `EXE_MTLO_OP)begin
			whilo_o	<= `WriteEnable;
			hi_o	<= HI;
			lo_o	<= reg1_i;
		end else begin
			whilo_o	<= `WriteDisable;
			hi_o	<= `ZeroWord;
			lo_o	<= `ZeroWord;
		end
	end

	/***************** 2.Do ALU Operation due to aluop_i *************/
	//2.1 Logical Operation
	always @(*) begin
		if (rst==`RstEnable) begin
			logicout		<= `ZeroWord; 
		end else begin
			case (aluop_i) 
				`EXE_OR_OP: begin
					logicout<= reg1_i | reg2_i;
				end
				`EXE_AND_OP: begin
					logicout<= reg1_i & reg2_i;
				end
				`EXE_NOR_OP: begin
					logicout<= ~(reg1_i|reg2_i);
				end
				`EXE_XOR_OP: begin
					logicout<= reg1_i ^ reg2_i;
				end
				default: begin
					logicout<= `ZeroWord;
				end
			endcase
		end
	end

	//2.2 Shift Operation
	always @(*) begin
		if (rst==`RstEnable) begin
			shiftres		<= `ZeroWord; 
		end else begin
			case (aluop_i) 
				`EXE_SLL_OP: begin
					shiftres<= reg2_i << reg1_i[4:0];
				end
				`EXE_SRL_OP: begin
					shiftres<= reg2_i >> reg1_i[4:0];
				end
				`EXE_SRA_OP: begin
					shiftres<= ({32{reg2_i[31]}} << (6'd32-{1'b0,reg1_i[4:0]})) | (reg2_i>>reg1_i[4:0]);
				end
				default: begin
					shiftres<= `ZeroWord;
				end
			endcase
		end
	end

	//2.3 Move Operation
	always @(*) begin
		if (rst==`RstEnable) begin
			moveres			<= `ZeroWord;
		end else begin
			case (aluop_i)
				`EXE_MFHI_OP: begin
					moveres	<= HI;
				end
				`EXE_MFLO_OP: begin
					moveres	<= LO;
				end
				`EXE_MOVZ_OP: begin
					moveres	<= reg1_i;
				end
				`EXE_MOVN_OP: begin
					moveres	<= reg1_i;
				end
				default: begin
					moveres	<= `ZeroWord;
				end
			endcase
		end			//if
	end				//always

	//2.4 Arithmetic Operation
	always @(*) begin
		if (rst==`RstEnable) begin
			arithmeticres	<= `ZeroWord;
		end else begin
			arithmeticres	<= `ZeroWord;
			case (aluop_i)
				`EXE_SLT_OP, `EXE_SLTU_OP: begin
					arithmeticres	<= reg1_lt_reg2;
				end
				`EXE_ADD_OP, `EXE_ADDU_OP, `EXE_ADDI_OP, `EXE_ADDIU_OP, `EXE_SUB_OP, `EXE_SUBU_OP: begin
					arithmeticres	<= result_sum;
				end
				`EXE_CLZ_OP: begin
					arithmeticres 	<=	 reg1_i[31] ? 0 : reg1_i[30] ? 1 : reg1_i[29] ? 2 :
										 reg1_i[28] ? 3 : reg1_i[27] ? 4 : reg1_i[26] ? 5 :
										 reg1_i[25] ? 6 : reg1_i[24] ? 7 : reg1_i[23] ? 8 :
										 reg1_i[22] ? 9 : reg1_i[21] ? 10: reg1_i[20] ? 11:
										 reg1_i[19] ? 12: reg1_i[18] ? 13: reg1_i[17] ? 14:
										 reg1_i[16] ? 15: reg1_i[15] ? 16: reg1_i[14] ? 17:
										 reg1_i[13] ? 18: reg1_i[12] ? 19: reg1_i[11] ? 20:
										 reg1_i[10] ? 21: reg1_i[9] ? 22 : reg1_i[8] ? 23 :
										 reg1_i[7] ? 24 : reg1_i[6] ? 25 : reg1_i[5] ? 26 :
										 reg1_i[4] ? 27 : reg1_i[3] ? 28 : reg1_i[2] ? 29 :
										 reg1_i[1] ? 30 : reg1_i[0] ? 31 : 32 ;
				end
				`EXE_CLO_OP: begin
					arithmeticres	<= 	(reg1_i_not[31] ? 0 : reg1_i_not[30] ? 1 : reg1_i_not[29] ? 2 :
										 reg1_i_not[28] ? 3 : reg1_i_not[27] ? 4 : reg1_i_not[26] ? 5 :
										 reg1_i_not[25] ? 6 : reg1_i_not[24] ? 7 : reg1_i_not[23] ? 8 :
										 reg1_i_not[22] ? 9 : reg1_i_not[21] ? 10: reg1_i_not[20] ? 11:
										 reg1_i_not[19] ? 12: reg1_i_not[18] ? 13: reg1_i_not[17] ? 14:
										 reg1_i_not[16] ? 15: reg1_i_not[15] ? 16: reg1_i_not[14] ? 17:
										 reg1_i_not[13] ? 18: reg1_i_not[12] ? 19: reg1_i_not[11] ? 20:
										 reg1_i_not[10] ? 21: reg1_i_not[9] ? 22 : reg1_i_not[8] ? 23 :
										 reg1_i_not[7] ? 24 : reg1_i_not[6] ? 25 : reg1_i_not[5] ? 26 :
										 reg1_i_not[4] ? 27 : reg1_i_not[3] ? 28 : reg1_i_not[2] ? 29 :
										 reg1_i_not[1] ? 30 : reg1_i_not[0] ? 31 : 32) ;
				end
			endcase
		end			//if
	end				//always

	//2.5 Substraction or Signed Comparsion 
		//reg2_i_mux = 2's complement of second operator
		assign reg2_i_mux = ((aluop_i == `EXE_SUB_OP)	||
							 (aluop_i == `EXE_SUBU_OP)	||
							 (aluop_i == `EXE_SLT_OP))	?
							 (~reg2_i)+1 : reg2_i;
		/** Result of Add, Sub, Signed Comparison **/
		assign result_sum = reg1_i + reg2_i_mux;
		assign reg1_i_not = ~reg1_i;
		/** Calculate Overflow **/
		assign ov_sum = ( (!reg1_i[31] && !reg2_i_mux[31]) && result_sum[31])	||
						(  (reg1_i[31] && reg2_i_mux[31]) && !result_sum[31]);
		assign reg1_lt_reg2 = ((aluop_i == `EXE_SLT_OP)) 	?
							  ((reg1_i[31] && !reg2_i[31])						||
							  (!reg1_i[31] && !reg2_i[31] && result_sum[31]) 	||
							  (reg1_i[31] && reg2_i[31] && !result_sum[31]))
							: (reg1_i < reg2_i);

	//2.6 Multiplication 
		assign multiplicand = (((aluop_i==`EXE_MUL_OP)||(aluop_i==`EXE_MULT_OP)) && (reg1_i[31])) ?
								(~reg1_i + 1) : reg1_i;
		assign multipler	= (((aluop_i==`EXE_MUL_OP)||(aluop_i==`EXE_MULT_OP)) && (reg2_i[31])) ?
								(~reg2_i + 1) : reg2_i;
		assign hilo_temp	= multiplicand * multipler;
		//! Modify the Result
	always @(*) begin
		if (rst==`RstEnable) begin
			mulres		<= {`ZeroWord, `ZeroWord};
		end else if ((aluop_i == `EXE_MUL_OP)||(aluop_i == `EXE_MULT_OP)) begin
			if (reg1_i[31] ^ reg2_i[31] == 1'b1) begin
				mulres	<= ~hilo_temp + 1;
			end else begin
				mulres	<= hilo_temp;
			end 
		end else begin
			mulres		<= hilo_temp;
		end
	end		//always

	/***************** 3.Select Result due to alusel_i *************
	***************************************************************/
	always @(*) begin
		wd_o			<= wd_i;
		if (((aluop_i==`EXE_ADD_OP)||(aluop_i==`EXE_ADDI_OP)||(aluop_i==`EXE_SUB_OP)) && (ov_sum==1'b1)) begin
			wreg_o 		<= `WriteDisable;
		end else begin
			wreg_o			<= wreg_i;
		end
		case (alusel_i)
			`EXE_RES_LOGIC: begin
				wdata_o	<= logicout;
			end
			`EXE_RES_SHIFT: begin
				wdata_o <= shiftres;
			end
			`EXE_RES_MOVE: begin
				wdata_o	<= moveres;
			end
			`EXE_RES_ARITH: begin
				wdata_o <= arithmeticres;
			end
			`EXE_RES_MUL: begin
				wdata_o <= mulres[31:0];
			end
			default:		begin
				wdata_o	<= `ZeroWord;
			end
		endcase
	end

endmodule
