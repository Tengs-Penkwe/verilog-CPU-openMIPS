`include "defines.v"
module openmips_min_sopc(
	input wire			clk,
	input wire			rst
);

	wire[`RegBus]		inst;
	wire[`InstAddrBus]	inst_addr;
	wire				rom_ce;

	openmips openmips0(
		.rst(rst),			.clk(clk),
		.rom_data_i(inst),	

		.rom_ce_o(rom_ce),	.rom_addr_o(inst_addr)
	);

	inst_rom inst_rom0(
		.ce(rom_ce),		.addr(inst_addr),
		.inst(inst)
	);


endmodule
