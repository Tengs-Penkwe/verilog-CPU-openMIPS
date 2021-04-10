`timescale 1ns/1ps
`include "defines.v"
module data_ram(
	input wire					ce,
	input wire[`InstAddrBus]	addr,

	output reg[`InstBus]		inst
);


endmodule
