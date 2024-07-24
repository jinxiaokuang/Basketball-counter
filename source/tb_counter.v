module tb_counter;
// Inputs
reg rst_n;
reg clk_in;
reg en_score;
reg [3:0]key_row;
reg [3:0]key_column;
wire [15:0] score;

counter uut (
.rst_n(rst_n), 
.clk_in(clk_in), 
.en_score(en_score), 
.key_row(key_row), 
.key_column(key_column), 
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

#1780;
rst_n = 1;
en_score = 1;
//黄队得分
#1040;
key_row = 4'b1000;
key_column = 4'b0001; 
#1000
key_row = 4'b0001;
key_column = 4'b0001; 
#1880;

key_row = 4'b1000;
key_column = 4'b0001; 
#1000
key_row = 4'b0001;
key_column = 4'b0010; 

#1880;
key_row = 4'b1000;
key_column = 4'b0001; 
#1000
key_row = 4'b0001;
key_column = 4'b0100; 

//红队得分
#1880;
key_row = 4'b1000;
key_column = 4'b0100; 
#1000
key_row = 4'b0001;
key_column = 4'b0001; 

#1880;
key_row = 4'b1000;
key_column = 4'b0100; 
#1000
key_row = 4'b0001;
key_column = 4'b0010; 

#1880;
key_row = 4'b1000; 
key_column = 4'b0100; 
#1000
key_row = 4'b0001;
key_column = 4'b0100;  

#1800;
en_score = 0;
key_row = 4'b1000;
key_column = 4'b0100; 
#1000
key_row = 4'b0001;
key_column = 4'b0010; 

#1880;
key_row = 4'b0000;
key_column = 4'b0000;

end
always #10 clk_in = ~clk_in;  
endmodule

