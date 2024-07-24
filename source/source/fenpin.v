module fenpin(
	input          clk_in    ,//����ʱ��
	input          rst_n     ,//��λ�˿�
	output   reg   clk_out   //���4Hz
    );

	
	reg      [23:0] cnt            ;//��ż�������ֵ
	parameter TIME=   24'd1250_0000;//ʱ��50MHz

//��Ƶģ��,ʹ������ʱ��Ϊ50MHz���ʱ��Ϊ4Hz
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
		else if(cnt ==  5'd50-1'd1)begin  //��ƵΪ1KHz
			clk_out <=~clk_out;
			cnt <=1'b0;
		end
		else begin
			cnt <=cnt + 1'b1;
		end
	end

endmodule
