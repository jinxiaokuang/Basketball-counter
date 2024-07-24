module fenpin(
	input          clk_in    ,//输入时钟
	input          rst_n     ,//复位端口
	output   reg   clk_out   //输出4Hz
    );

	
	reg      [23:0] cnt            ;//存放计数器的值
	parameter TIME=   24'd1250_0000;//时钟50MHz

//分频模块,使得输入时钟为50MHz输出时钟为4Hz
/*	always@ (posedge clk_in or negedge rst_n)begin
		if(!rst_n)begin
			clk_out <=1'b0;
			cnt <=24'd0;
		end
		else if(cnt ==TIME-1'b1)begin
			clk_out <=~clk_out;
			cnt <=1'b0;
		end
		else begin
			cnt <=cnt + 1'b1;
		end
	end
*/
    always@ (posedge clk_in or negedge rst_n)begin
		if(!rst_n)begin
			 clk_out <=1'b0;
			cnt <=1'b0;
		end
		else if(cnt ==  5'd50-1'd1)begin  //分频为1KHz
			clk_out <=~clk_out;
			cnt <=1'b0;
		end
		else begin
			cnt <=cnt + 1'b1;
		end
	end

endmodule
