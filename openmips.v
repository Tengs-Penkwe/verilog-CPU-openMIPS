`timescale 1ns/1ps
`include "defines.v"
module openmips(
	input wire				rst,
	input wire 				clk,

	input wire[`RegBus]		rom_data_i,

	output wire[`RegBus]	rom_addr_o,
	output wire				rom_ce_o
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
	wire[`RegAddrBus]		ex_wd_i;

	//EX -> EX/MEM
	wire					ex_wreg_o;
	wire[`RegAddrBus]		ex_wd_o;
	wire[`RegBus]			ex_wdata_o;
	wire					ex_whilo_o;
	wire[`RegBus]			ex_hi_o;
	wire[`RegBus]			ex_lo_o;
	wire[`DoubleRegBus]		hilo_temp_o;
	wire[1:0] 				cnt_o;

	//EX <=> DIV
	wire					signed_div;
	wire[`RegBus]			div_opdata1;
	wire[`RegBus]			div_opdata2;
	wire					div_start;

	wire[`DoubleRegBus]		div_result;
	wire					div_ready;

	//EX/MEM -> MEM
	wire					mem_wreg_i;
	wire[`RegAddrBus]		mem_wd_i;
	wire[`RegBus]			mem_wdata_i;
	wire					mem_whilo_i;
	wire[`RegBus]			mem_hi_i;
	wire[`RegBus]			mem_lo_i;
	wire[`DoubleRegBus]		hilo_temp_i;
	wire[1:0]				cnt_i;

	//MEM -> MEM/WB
	wire					mem_wreg_o;
	wire[`RegAddrBus]		mem_wd_o;
	wire[`RegBus]			mem_wdata_o;
	wire					mem_whilo_o;
	wire[`RegBus]			mem_hi_o;
	wire[`RegBus]			mem_lo_o;

	//MEM/WB -> Regfiles
	wire					wb_wreg_i;
	wire[`RegAddrBus]		wb_wd_i;
	wire[`RegBus]			wb_wdata_i;
	//MEM/WB -> HILO
	wire					wb_whilo_i;
	wire[`RegBus]			wb_hi_i;
	wire[`RegBus]			wb_lo_i;
	
	//HILO -> EX
	wire[`RegBus]			hi;
	wire[`RegBus]			lo;
	
	//Control 
	wire[5:0]				stall;
	wire					stallreq_from_id;
	wire					stallreq_from_ex;

/**************** 2.Instantiate Module *******************/

	pc_reg pc_reg0(
		.rst(rst),		.clk(clk),
		//From Control
		.stall(stall),
		//To ROM
		.ce(rom_ce_o),
		//To ROM and IF/ID
		.pc(pc)
	);
	assign rom_addr_o = pc;

	if_id if_id0(
		.rst(rst),		.clk(clk),	
		//From Control
		.stall(stall),
		//From PC
		.if_pc(pc),					.if_inst(rom_data_i),
		.id_pc(id_pc_i),			.id_inst(id_inst_i)		
	);
	
	id id0(
		.rst(rst),
		.pc_i(id_pc_i),				.inst_i(id_inst_i),
		//From Regfiles
		.reg1_data_i(reg1_data),	.reg2_data_i(reg2_data),
		//To Control
		.stallreq(stallreq_from_id),
		/* Data Forward */
		.ex_wdata_i(ex_wdata_o),	.ex_wd_i(ex_wd_o),
		.ex_wreg_i(ex_wreg_o),
		.mem_wdata_i(mem_wdata_o),	.mem_wd_i(mem_wd_o),
		.mem_wreg_i(mem_wreg_o),
		//To Regfiles
		.reg1_addr_o(reg1_addr),	.reg2_addr_o(reg2_addr),
		.reg1_read_o(reg1_read),	.reg2_read_o(reg2_read),
		//To ID/EX
		.aluop_o(id_aluop_o),		.alusel_o(id_alusel_o),
		.reg1_o(id_reg1_o),			.reg2_o(id_reg2_o),
		.wd_o(id_wd_o),				.wreg_o(id_wreg_o)
	);

	regfile regfile1(
		.rst(rst),		.clk(clk),
		//From ID
		.re1(reg1_read),			.re2(reg2_read),
		.raddr1(reg1_addr),			.raddr2(reg2_addr),
		//From WB
		.we(wb_wreg_i),
		.waddr(wb_wd_i),			.wdata(wb_wdata_i),
		//To ID
		.rdata1(reg1_data),			.rdata2(reg2_data)
	);

	id_ex id_ex0(
		.rst(rst),		.clk(clk),		
		//From Control
		.stall(stall),
		//From ID
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
		//From ID/EX
		.aluop_i(ex_aluop_i),		.alusel_i(ex_alusel_i),
		.reg1_i(ex_reg1_i),			.reg2_i(ex_reg2_i),
		.wd_i(ex_wd_i),				.wreg_i(ex_wreg_i),
		//From ID/EX, HI-LO 
		.hi_i(hi),					.lo_i(lo),
		.wb_hi_i(wb_hi_i),			.wb_lo_i(wb_lo_i),
		.wb_whilo_i(wb_whilo_i),
		//From MEM, HI-LO 
		.mem_hi_i(mem_hi_i),		.mem_lo_i(mem_lo_i),
		.mem_whilo_i(mem_whilo_i),
		//From DIV
		.div_result_i(div_result), 	.div_ready_i(div_ready),
		//From EX/MEM (Multiple Cycle)
		.cnt_i(cnt_i),
		.hilo_temp_i(hilo_temp_i),

		//To Control
		.stallreq(stallreq_from_ex),
		//To EX/MEM
		.wdata_o(ex_wdata_o),		.wd_o(ex_wd_o),
		.wreg_o(ex_wreg_o),
		//TO EX/MEM (HI-LO)
		.hi_o(ex_hi_o),				.lo_o(ex_lo_o),
		.whilo_o(ex_whilo_o),
		//To DIV
		.signed_div_o(signed_div),
		.div_opdata1_o(div_opdata1), .div_opdata2_o(div_opdata2),
		.div_start_o(div_start),
		//TO EX/MEM (Multiple Cycle)
		.cnt_o(cnt_o),
		.hilo_temp_o(hilo_temp_o)
	);

	div div0(
		.rst(rst),		.clk(clk),
		//From EX
		.signed_div_i(signed_div),
		.opdata1_i(div_opdata1),	.opdata2_i(div_opdata2),
		.start_i(div_start),		.annul_i(1'b0),
		//To EX
		.result_o(div_result),		.ready_o(div_ready)
	);

	ex_mem ex_mem0(
		.rst(rst),		.clk(clk),		
		//From EX/MEM (Multiple Cycle)
		.cnt_i(cnt_o),
		.hilo_i(hilo_temp_o),
		//From Control
		.stall(stall),
		.ex_wdata(ex_wdata_o),		.ex_wd(ex_wd_o),
		.ex_wreg(ex_wreg_o),
		.ex_hi(ex_hi_o),			.ex_lo(ex_lo_o),
		.ex_whilo(ex_whilo_o),
		/// Output
		.mem_wdata(mem_wdata_i),	.mem_wd(mem_wd_i),
		.mem_wreg(mem_wreg_i),
		.mem_hi(mem_hi_i),			.mem_lo(mem_lo_i),
		.mem_whilo(mem_whilo_i),
		//From EX/MEM (Multiple Cycle)
		.cnt_o(cnt_i),
		.hilo_o(hilo_temp_i)
	);
	
	mem mem0(
		.rst(rst),
		//From EX/MEM
		.wdata_i(mem_wdata_i),		.wd_i(mem_wd_i),
		.wreg_i(mem_wreg_i),
		.hi_i(mem_hi_i),			.lo_i(mem_lo_i),
		.whilo_i(mem_whilo_i),
		//To MEM/WB
		.wdata_o(mem_wdata_o),		.wd_o(mem_wd_o),
		.wreg_o(mem_wreg_o),
		//To EX, HI-LO
		.hi_o(mem_hi_o),			.lo_o(mem_lo_o),
		.whilo_o(mem_whilo_o)
	);

	mem_wb mem_wb0(
		.rst(rst),		.clk(clk),
		//From Control
		.stall(stall),
		//From MEM
		.mem_wdata(mem_wdata_o),	.mem_wd(mem_wd_o),
		.mem_wreg(mem_wreg_o),
		.mem_hi(mem_hi_o),			.mem_lo(mem_lo_o),
		.mem_whilo(mem_whilo_o),
		//To WB
		.wb_wdata(wb_wdata_i),		.wb_wd(wb_wd_i),
		.wb_wreg(wb_wreg_i),
		//To EX, HI-LO
		.wb_hi(wb_hi_i),	        .wb_lo(wb_lo_i),
        .wb_whilo(wb_whilo_i)
	);

	hilo_reg hilo_reg0(
		.rst(rst),		.clk(clk),
		//From MEM/WB
		.hi_i(wb_hi_i),				.lo_i(wb_lo_i),
		.we(wb_whilo_i),
		//To EX
		.hi_o(hi),					.lo_o(lo)
	);

	ctrl ctrl0(
		.rst(rst),
		.stallreq_from_id(stallreq_from_id),
		.stallreq_from_ex(stallreq_from_ex),
		.stall(stall)
	);
endmodule
