`timescale 1ns/1ps
`include "../test/assert.v"

module inst_simple_arith_test();
    reg     clk, rst;
    integer i  ;

    openmips_min_sopc openmips_min_sopc0 (clk,rst);

    always #1 clk = ~clk;
    initial begin
        $dumpfile("../test/inst_simple_arith_test.vcd");
        $dumpvars;
        for (i = 1; i <= 4; i = i+1)
            $dumpvars(0, openmips_min_sopc0.openmips0.regfile1.regs[i]);

        $readmemh("../data/inst_simple_arith_test.txt", openmips_min_sopc0.inst_rom0.inst_mem, 0, 42);

        clk = 0;
        rst = 1;
        #20 rst = 0;
        #12 `AR(1,32'h00008000);`AR(2,32'hxxxxxxxx);`AR(3,32'hxxxxxxxx);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h80000000);`AR(2,32'hxxxxxxxx);`AR(3,32'hxxxxxxxx);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h80000010);`AR(2,32'hxxxxxxxx);`AR(3,32'hxxxxxxxx);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h80000010);`AR(2,32'h00008000);`AR(3,32'hxxxxxxxx);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h80000010);`AR(2,32'h80000000);`AR(3,32'hxxxxxxxx);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h80000010);`AR(2,32'h80000001);`AR(3,32'hxxxxxxxx);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h80000010);`AR(2,32'h80000001);`AR(3,32'h00000000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h80000010);`AR(2,32'h80000001);`AR(3,32'h00000011);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h80000010);`AR(2,32'h80000001);`AR(3,32'h00000000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h80000010);`AR(2,32'h80000001);`AR(3,32'h00000000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h80000010);`AR(2,32'h80000001);`AR(3,32'h80000010);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h80000010);`AR(2,32'h80000001);`AR(3,32'h0000000F);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h80000010);`AR(2,32'h80000001);`AR(3,32'h00000011);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h80000010);`AR(2,32'h80000001);`AR(3,32'h00000000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h80000010);`AR(2,32'h80000001);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h0000FFFF);`AR(2,32'h80000001);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'hFFFF0000);`AR(2,32'h80000001);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'hFFFF0000);`AR(2,32'h00000001);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'hFFFF0000);`AR(2,32'h00000000);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'hFFFF0000);`AR(2,32'h00000001);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'hFFFF0000);`AR(2,32'h00000001);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h00000000);`AR(2,32'h00000001);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h00000000);`AR(2,32'h00000000);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h00000000);`AR(2,32'h00000020);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'hFFFF0000);`AR(2,32'h00000020);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'hFFFFFFFF);`AR(2,32'h00000020);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'hFFFFFFFF);`AR(2,32'h00000000);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'hFFFFFFFF);`AR(2,32'h00000020);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'hA1000000);`AR(2,32'h00000020);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'hA1000000);`AR(2,32'h00000000);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'hA1000000);`AR(2,32'h00000001);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h11000000);`AR(2,32'h00000001);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h11000000);`AR(2,32'h00000003);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h11000000);`AR(2,32'h00000000);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'h0000FFFF);`AR(2,32'h00000000);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'hFFFF0000);`AR(2,32'h00000000);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'hFFFFFFFB);`AR(2,32'h00000000);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'hFFFFFFFB);`AR(2,32'h00000006);`AR(3,32'hFFFF8000);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'hFFFFFFFB);`AR(2,32'h00000006);`AR(3,32'hFFFFFFE2);`AHI(32'h00000000);`ALO(32'h00000000);
        #2  `AR(1,32'hFFFFFFFB);`AR(2,32'h00000006);`AR(3,32'hFFFFFFE2);`AHI(32'hFFFFFFFF);`ALO(32'hFFFFFFE2);
        #2  `AR(1,32'hFFFFFFFB);`AR(2,32'h00000006);`AR(3,32'hFFFFFFE2);`AHI(32'h00000005);`ALO(32'hFFFFFFE2);
        `PASS(simple arithematic instruction test);
    end

endmodule
