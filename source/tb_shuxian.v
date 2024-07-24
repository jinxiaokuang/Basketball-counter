module tb_shuxian;

// Inputs
reg rst_n;
reg clk_in;
reg clk_out;
reg [15:0]score;

wire [2:0] dis_shu; 
wire [6:0] dis_seg;

shuxian uut (
.rst_n(rst_n), 
.clk_in(clk_in), 
.clk_out(clk_out),
.score(score),
.dis_shu(dis_shu),
.dis_seg(dis_seg)
);

initial begin
// Initialize Inputs
rst_n = 0;
score=16'h0000;
clk_in = 1;
clk_out = 1;
//使能信号

//按键

#1780;
rst_n = 1;

//黄队得分
#1040;

score=16'h0100;
#2880;
score=16'h0300;
#2880;
score=16'h0600;
#2880
score=16'h0601;
#2880;
score=16'h0603;
#2880;
score=16'h0606;
#2800;

end
always #10 clk_in = ~clk_in;  
always #360 clk_out=~clk_out;
endmodule

