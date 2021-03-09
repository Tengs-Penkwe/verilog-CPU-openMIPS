module ex(
	input wire				rst,

	input wire[`AluOpBus]	aluop_i,
	input wire[`AluSelBus]	alusel_i,

	input wire[`RegBus]		reg1_i,
	input wire[`RegBus]		reg2_i,

	input wire[`RegAddrBus]	wd_i,
	input wire				wreg_i,

	output reg[`RegAddrBus]	wd_o,
	output reg				wreg_o,
	output reg[`RegBus]		wdata_o
);
	
	
	/********************* Save The Result of Operation *************/
	reg[`RegBus]			logicout;

	/********************* 1.Do ALU Operation due to aluop_i *************
	* The ALU will do multiple operation at the same time, this can
	* simlify the design of circuit, then we choose what result we
	* need in the next stage
	***************************************************************/
	always @(*) begin
		if (rst==`RstEnable) begin
			logicout		<= `ZeroWord; 
		end else begin
			case (aluop_i) begin
				`EXE_OR_OP: begin
					logicout<= reg1_i | reg2_i;
				end
				default: begin
					logicout<= `ZeroWord;
				end
			endcase
		end		//if
	end			//always

	/********************* 1.Do ALU Operation due to aluop_i *************
	* The ALU will do multiple operation at the same time, this can
	* simlify the design of circuit, then we choose what result we
	* need in the next stage
	***************************************************************/
	always @(*) begin
		wd_o			<= wd_i;
		wreg_o			<= wreg_i;
		case (alusel_i) begin
			`EXE_RES_LOGIC: begin
				wdata_o	<= logicout;
			end
			default: begin
				wdata_o	<= `ZeroWord;
		endcase
	end

endmodule
