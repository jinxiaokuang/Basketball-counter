module tb_top;
// Inputs
reg rst_n;
reg clk_in;
reg en_score;
wire clk_out;
reg key_1;
reg key_2;
reg key_3;
reg key_yellow;
reg key_red;

wire [7:0] dis_sel;
wire [3:0] dis_shu; 
wire [6:0] dis_seg;
wire [15:0] score;

top_basketball uut (
.rst_n(rst_n), 
.clk_in(clk_in), 
.en_score(en_score), 
.clk_out(clk_out),
.key_1(key_1), 
.key_2(key_2), 
.key_3(key_3), 
.key_yellow(key_yellow), 
.key_red(key_red),
.dis_sel(dis_sel), 
.dis_shu(dis_shu),
.dis_seg(dis_seg),
.score(score)
);

initial begin
// Initialize Inputs
rst_n = 0;
clk_in = 1;
//使能信号
en_score = 0;
//按键
key_1 = 0;
key_2 = 0;
key_3 = 0;
key_yellow = 0;
key_red = 0;

#1780;
rst_n = 1;
en_score = 1;
//黄队得分
#1040;
key_yellow = 1;
key_1 = 1;
key_2 = 0;
key_3 = 0;
#2880;
key_1 = 0;
key_2 = 1;
key_3 = 0;
#2880;
key_1 = 0;
key_2 = 0;
key_3 = 1;
#2880
key_yellow = 0;
//红队得分

key_red = 1;
key_1 = 1;
key_2 = 0;
key_3 = 0;
#2880;
key_1 = 0;
key_2 = 1;
key_3 = 0;
#2880;
key_1 = 0;
key_2 = 0;
key_3 = 1;
#2800
en_score = 0;
key_1 = 0; 
key_2 = 0;
key_3 = 1;
#2880
key_3 =0;
key_red = 0;
end
always #10 clk_in = ~clk_in;  
endmodule

