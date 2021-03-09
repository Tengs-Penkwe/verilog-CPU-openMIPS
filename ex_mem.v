module ex_mem(
	input wire				clk,
	input wire				rst,

	input wire[`RegAddrBus]	ex_wd,
	input wire				ex_wreg,
	input wire[`RegBus]		ex_wdata,

	output reg[`RegAddrBus]	mem_wd,
	output reg				mem_wreg,
	output reg[`RegBus]		mem_wdata
);
	

endmodule
