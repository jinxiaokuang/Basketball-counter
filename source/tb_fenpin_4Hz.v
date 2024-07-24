module tb_fenpin_4Hz;
// Inputs
reg rst_n;
reg clk_in;


wire clk_out;

fenpin_4Hz uut (
.rst_n(rst_n), 
.clk_in(clk_in), 
.clk_out(clk_out)
);

initial begin
// Initialize Inputs
rst_n = 0;
clk_in = 1;
//Ê¹ÄÜÐÅºÅ
#10;
rst_n = 1;
end
always #10 clk_in = ~clk_in;  
endmodule

