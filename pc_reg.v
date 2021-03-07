module pc_reg{
	input wire					clk,	
	input wire					rst,
	output reg[`InstAddrBus]	pc,
	output reg					ce		//ChipEnable
		//Instruction ROM 
};
	
	always @(posedge clk) begin
		if(rst == `RstEnable) begin
			pc <= pc + 4'h4;
		end else begin
			ce <= `ChipEnable;
		end
	end

	always @(posedge clk) begin
		if(ce == `ChipDisable) begin
			pc <= `ZeroWord;
		end else begin
			pc <= pc + 4'h4;
		end
	end
	
endmodule
