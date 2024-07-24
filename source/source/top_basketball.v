module top_basketball( 
input rst_n,
input clk_in,
input en_score,   
input [3:0]key_row,
input [3:0]key_column,
output wire clk_out,
output wire[2:0] dis_shu,
output wire[6:0] dis_seg,
output wire[15:0] score
);


fenpin s0(
.clk_in(clk_in),
.rst_n(rst_n),
.clk_out(clk_out)
);
counter s1(
.clk_in(clk_in), 
.rst_n(rst_n), 
.key_row(key_row), 
.key_column(key_column), 
.en_score(en_score),
.score(score)
);

shuxian s2(
.clk_in(clk_in),
.clk_out(clk_out), 
.rst_n(rst_n),
.score(score), 
.dis_seg (dis_seg),
.dis_shu (dis_shu)
);
endmodule