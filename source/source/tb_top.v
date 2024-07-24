module tb_top;
// Inputs
reg rst_n;
reg clk_in;
reg en_score;
wire clk_out;
reg [3:0]key_row;
reg [3:0]key_column;
wire [2:0] dis_shu; 
wire [6:0] dis_seg;
wire [15:0] score;

top_basketball uut (
.rst_n(rst_n), 
.clk_in(clk_in), 
.en_score(en_score), 
.clk_out(clk_out),
.key_row(key_row), 
.key_column(key_column),  
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
key_row = 4'b0000;
key_column = 4'b0000;

#1280;
rst_n = 1;
en_score = 1;
//黄队得分
#1000;
key_row = 4'b1000;
key_column = 4'b0001; 
#720
key_row = 4'b0001;
key_column = 4'b0001; 
#2160;

key_row = 4'b1000;
key_column = 4'b0001; 
#720
key_row = 4'b0001;
key_column = 4'b0010; 

#2160;
key_row = 4'b1000;
key_column = 4'b0001; 
#720
key_row = 4'b0001;
key_column = 4'b0100; 

//红队得分
#2160;
key_row = 4'b1000;
key_column = 4'b0100; 
#720
key_row = 4'b0001;
key_column = 4'b0001; 

#2160;
key_row = 4'b1000;
key_column = 4'b0100; 
#720
key_row = 4'b0001;
key_column = 4'b0010; 

#2160;
key_row = 4'b1000; 
key_column = 4'b0100; 
#720
key_row = 4'b0001;
key_column = 4'b0100;  

#2160;
en_score = 0;
key_row = 4'b1000;
key_column = 4'b0100; 
#720
key_row = 4'b0001;
key_column = 4'b0010; 

#2160;
key_row = 4'b0000;
key_column = 4'b0000;

end
always #10 clk_in = ~clk_in;  
endmodule

