`include "defines.v"
module openmips(
	input wire					rst,
	input wire 					clk,

	input wire[`RegBus]			rom_data_i,

	output wire[`RegBus]		rom_addr_o,
	output wire					rom_ce_o
);

/**************** 1.Instantiate Wire *******************/
	
	//PC -> IF/ID
	wire[`InstAddrBus]		pc;

	//IF/ID -> ID
	wire[`InstAddrBus]		id_pc_i;
	wire[`InstBus]			id_inst_i;

	//ID <=> Regfiles
	wire					reg1_read;
	wire					reg2_read;
	wire[`RegAddrBus]		reg1_addr;
	wire[`RegAddrBus]		reg2_addr;
	wire[`RegBus]			reg1_data;
	wire[`RegBus]			reg2_data;
	
	//ID -> ID/EX
	wire[`AluOpBus]			id_aluop_o;
	wire[`AluSelBus]		id_alusel_o;
	wire[`RegBus]			id_reg1_o;
	wire[`RegBus]			id_reg2_o;
	wire					id_wreg_o;
	wire[`RegAddrBus]		id_wd_o;

	//ID/EX -> EX
	wire[`AluOpBus]			ex_aluop_i;
	wire[`AluSelBus]		ex_alusel_i;
	wire[`RegBus]			ex_reg1_i;
	wire[`RegBus]			ex_reg2_i;
	wire					ex_wreg_i;
	wire[`RegAddrBus]			ex_wd_i;

	//EX -> EX/MEM
	wire					ex_wreg_o;
	wire[`RegAddrBus]		ex_wd_o;
	wire[`RegBus]			ex_wdata_o;

	//EX/MEM -> MEM
	wire					mem_wreg_i;
	wire[`RegAddrBus]		mem_wd_i;
	wire[`RegBus]			mem_wdata_i;

	//MEM -> MEM/WB
	wire					mem_wreg_o;
	wire[`RegAddrBus]		mem_wd_o;
	wire[`RegBus]			mem_wdata_o;
	
	//MEM/WB -> Regfiles
	wire					wb_wreg_i;
	wire[`RegAddrBus]		wb_wd_i;
	wire[`RegBus]			wb_wdata_i;
	
/**************** 2.Instantiate Module *******************/

	pc_reg pc_reg0(
		.rst(rst),		.clk(clk),
		.ce(rom_ce_o),	.pc(pc)
	);
	assign rom_addr_o = pc;

	if_id if_id0(
		.rst(rst),		.clk(clk),	
		.if_pc(pc),					.if_inst(rom_data_i),
		.id_pc(id_pc_i),			.id_inst(id_inst_i)		
	);
	
	id id0(
		.rst(rst),
		.pc_i(id_pc_i),				.inst_i(id_inst_i),
		.reg1_data_i(reg1_data),	.reg2_data_i(reg2_data),
		//Data to Regfiles
		.reg1_addr_o(reg1_addr),	.reg2_addr_o(reg2_addr),
		.reg1_read_o(reg1_read),	.reg2_read_o(reg2_read),
		//Data to ID/EX
		.aluop_o(id_aluop_o),		.alusel_o(id_alusel_o),
		.reg1_o(id_reg1_o),			.reg2_o(id_reg2_o),
		.wd_o(id_wd_o),				.wreg_o(id_wreg_o),
		/* Data Forward */
		.ex_wdata_i(ex_wdata_o),	.ex_wd_i(ex_wd_o),
		.ex_wreg_i(ex_wreg_o),
		.mem_wdata_i(wb_wdata_i),	.mem_wd_i(wb_wd_i),
		.mem_wreg_i(wb_wreg_i)
	);

	regfile regfile1(
		.rst(rst),		.clk(clk),
		.re1(reg1_read),			.re2(reg2_read),
		.raddr1(reg1_addr),			.raddr2(reg2_addr),
		.we(wb_wreg_i),
		.waddr(wb_wd_i),			.wdata(wb_wdata_i),
		.rdata1(reg1_data),			.rdata2(reg2_data)
	);

	id_ex id_ex0(
		.rst(rst),		.clk(clk),		
		.id_aluop(id_aluop_o),		.id_alusel(id_alusel_o),
		.id_reg1(id_reg1_o),		.id_reg2(id_reg2_o),
		.id_wd(id_wd_o),			.id_wreg(id_wreg_o),
		//Output
		.ex_aluop(ex_aluop_i),		.ex_alusel(ex_alusel_i),
		.ex_reg1(ex_reg1_i),		.ex_reg2(ex_reg2_i),
		.ex_wd(ex_wd_i),			.ex_wreg(ex_wreg_i)
	);

	ex ex0(
		.rst(rst),
		.aluop_i(ex_aluop_i),		.alusel_i(ex_alusel_i),
		.reg1_i(ex_reg1_i),			.reg2_i(ex_reg2_i),
		.wd_i(ex_wd_i),				.wreg_i(ex_wreg_i),
		//Output
		.wdata_o(ex_wdata_o),		.wd_o(ex_wd_o),
		.wreg_o(ex_wreg_o)
	);

	ex_mem ex_mem0(
		.rst(rst),		.clk(clk),		
		.ex_wdata(ex_wdata_o),		.ex_wd(ex_wd_o),
		.ex_wreg(ex_wreg_o),
		//Output
		.mem_wdata(mem_wdata_o),	.mem_wd(mem_wd_o),
		.mem_wreg(mem_wreg_o)
	);
	
	mem mem0(
		.rst(rst),
		.wdata_i(mem_wdata_o),		.wd_i(mem_wd_o),
		.wreg_i(mem_wreg_o),
		//Output
		.wdata_o(wb_wdata_i),		.wd_o(wb_wd_i),
		.wreg_o(wb_wreg_i)
	);

	mem_wb mem_wb0(
		.rst(rst),		.clk(clk),
		.mem_wdata(wb_wdata_i),		.mem_wd(wb_wd_i),
		.mem_wreg(wb_wreg_i)
	);

endmodule
