module shuxian(
input clk_in,
input clk_out,
input rst_n,
input [15:0]score,
output reg [6:0] dis_seg,
output reg [2:0] dis_shu
);
reg [3:0] dis_lin;
reg [7:0] dis_sel;
reg [15:0] dis_num;
reg [3:0] dis_tmp;
always@(posedge clk_in or negedge rst_n) begin
if(rst_n==0)
dis_num<=0;
else 
dis_num<=score;
end

always@(posedge clk_out or negedge rst_n) begin   //位选信号
if(rst_n==0)begin
dis_sel<=8'b11111111;
dis_lin<=4'b1110;
end
else begin
dis_lin<={dis_lin[0],dis_lin[3:1]};
dis_sel[7:6]<=dis_lin[3:2];
dis_sel[5:2]<=dis_sel[5:2];
dis_sel[1:0]<=dis_lin[1:0];
end
end

//分配数据的16位，低电平有效 
always@(*) begin
case(dis_sel)
8'b11111110 : dis_tmp<= dis_num[3:0]; 
8'b11111101 : dis_tmp<= dis_num[7:4]; 
8'b10111111 : dis_tmp<= dis_num[11:8]; 
8'b01111111 : dis_tmp<= dis_num[15:12]; 
default:dis_tmp<=4'b1111;
endcase
end
always@(*) begin           //位选信号转为10进制数形式显示
case(dis_sel)
8'b11111110 : dis_shu<= 3'b000; 
8'b11111101 : dis_shu<= 3'b001; 
8'b10111111 : dis_shu<= 3'b110; 
8'b01111111 : dis_shu<= 3'b111; 
default:dis_shu<=3'd0;
endcase
end

always@(*)begin          //段选信号
if(!rst_n) 
dis_seg = 7'h1111111;
else begin
case(dis_tmp) 
4'h0: dis_seg = 7'b0111111;
4'h1: dis_seg = 7'b0000110;
4'h2: dis_seg = 7'b1011011;
4'h3: dis_seg = 7'b1001111;
4'h4: dis_seg = 7'b1100110;
4'h5: dis_seg = 7'b1101101;
4'h6: dis_seg = 7'b1111101;
4'h7: dis_seg = 7'b0000111;
4'h8: dis_seg = 7'b1111111;
4'h9: dis_seg = 7'b1101111;
default:dis_seg = 7'b1111111;
endcase
end
end 
endmodule