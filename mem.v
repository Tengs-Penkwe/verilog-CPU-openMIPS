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

		`define SET_MEM(i_wdata, i_mem_we, i_mem_sel, i_mem_addr, i_mem_data, i_mem_ce) if(1) begin \
			wdata_o     <= i_wdata    ; \
			mem_we_o    <= i_mem_we   ; \
			mem_sel_o   <= i_mem_sel  ; \
			mem_addr_o  <= i_mem_addr ; \
			mem_data_o  <= i_mem_data ; \
			mem_ce_o    <= i_mem_ce   ; \
		end else if(0)

	always @(*) begin
		if (rst==`RstEnable) begin
			wd_o		<= `NOPRegAddr;
			wreg_o		<= `WriteDisable;
			hi_o		<= `ZeroWord;
			lo_o		<= `ZeroWord;
			whilo_o		<= `WriteDisable;
			`SET_MEM(`ZeroWord, `WriteDisable, 4'b0000, `ZeroWord, `ZeroWord, `ChipDisable);
		end else begin
			wd_o		<= wd_i;
			wreg_o		<= wreg_i;
			hi_o		<= hi_i;
			lo_o		<= lo_i;
			whilo_o		<= whilo_i;
			`SET_MEM(wdata_i, 0, 4'b1111, 0, 0, 0);
			case(aluop_i)
				`EXE_LB_OP: case(mem_addr_i[1:0])
					2'b00:	`SET_MEM()
					2'b01:	
					2'b10:	
					2'b11:	
				endcase
				`EXE_LB_OP: case(mem_addr_i[1:0])
					2'b00:	
					2'b01:	
					2'b10:	
					2'b11:	
				endcase
				`EXE_LB_OP: case(mem_addr_i[1:0])
					2'b00:	
					2'b01:	
					2'b10:	
					2'b11:	
				endcase
				`EXE_LB_OP: case(mem_addr_i[1:0])
					2'b00:	
					2'b01:	
					2'b10:	
					2'b11:	
				endcase
				`EXE_LB_OP: case(mem_addr_i[1:0])
					2'b00:	
					2'b01:	
					2'b10:	
					2'b11:	
				endcase
				`EXE_LB_OP: case(mem_addr_i[1:0])
					2'b00:	
					2'b01:	
					2'b10:	
					2'b11:	
				endcase
			endcase	//aluop_i
		end			//if
	end				//always

endmodule
