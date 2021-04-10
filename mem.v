`timescale 1ns/1ps
`include "defines.v"
module mem(
	input wire				rst,

	input wire[`RegAddrBus]	wd_i,
	input wire				wreg_i,
	input wire[`RegBus]		wdata_i,
	input wire[`RegBus]		hi_i,
	input wire[`RegBus]		lo_i,
	input wire				whilo_i,
	// Load & Store
	input wire[`AluOpBus]	aluop_i,
	input wire[`RegBus]		reg2_i,
	input wire[`RegBus]		mem_addr_i,
	// From Data ROM
	input wire[`RegBus]		mem_data_i,

	output reg[`RegAddrBus]	wd_o,
	output reg				wreg_o,
	output reg[`RegBus]		wdata_o,
	output reg[`RegBus]		hi_o,
	output reg[`RegBus]		lo_o,
	output reg				whilo_o,
	// Load & Store
	output reg[`RegBus]		mem_addr_o,		//! Memory to Access
	output reg				mem_we_o,		//! Write(1) or Read(0)
	output reg[3:0]			mem_sel_o,		//! Which Bit
	output reg[`RegBus]		mem_data_o,		//! Data to Write
	output reg				mem_ce_o		//! RAM Enable


);

	always @(*) begin
		if (rst==`RstEnable) begin
			wd_o		<= `NOPRegAddr;
			wreg_o		<= `WriteDisable;
			wdata_o		<= `ZeroWord;
			hi_o		<= `ZeroWord;
			lo_o		<= `ZeroWord;
			whilo_o		<= `WriteDisable;
		end else begin
			wd_o		<= wd_i;
			wreg_o		<= wreg_i;
			wdata_o		<= wdata_i;
			hi_o		<= hi_i;
			lo_o		<= lo_i;
			whilo_o		<= whilo_i;
		end
	end

endmodule
