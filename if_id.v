module if_id{
	input wire		clk,
	input wire		rst,

	/* From Instruction Fetch Stage */
	input wire[`InstAddrBus]	if_pc,
	//Get Instruction from ROM
	input wire[`InstBus]		if_inst,

	/* To Instruction Decipher Stage */
	output wire[`InstAddrBus]	id_pc,
	output wire[`InstBus]		id_inst
};

	always @(posedge) begin
		if (rst == `RstEnable) begin
			id_inst <= `ZeroWord;
			if_inst <= `ZeroWord;
		end else begin
			id_pc   <= if_pc;
			id_inst <= if_inst;
		end
	end

endmodule


