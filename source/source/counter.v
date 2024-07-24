module counter(
      input rst_n,
	  input clk_in,
	  input [3:0]key_row,
	  input [3:0]key_column,
	  input en_score,
	  output  [15:0] score
    );
     reg  key_1 = 1'b0;
	 reg  key_2 = 1'b0;
	 reg  key_3 = 1'b0;
	 reg  key_yellow = 1'b0;
     reg  key_red = 1'b0;
     reg  key_1_edge = 1'b0;
     reg  key_2_edge = 1'b0;
     reg  key_3_edge = 1'b0;
	 reg [7:0] yellow_score = 8'b0;
	 reg [7:0] red_score = 8'b0;
	 reg t1;
     reg t2;
	 reg t3;
     reg t4;
	 reg t5;
     reg t6;

        always@(posedge clk_in or negedge rst_n )
        begin
          if (!rst_n);
          else if(key_row[3]==1)
          begin
            key_yellow<=key_row[3]&key_column[0];
            key_red<=key_row[3]&key_column[2];
            key_1<=1'b0;
            key_2<=1'b0;
            key_3<=1'b0;
          end
          else if(key_row[0]==1) 
          begin
            key_yellow<=key_yellow;
            key_red<=key_red;
            key_1<=key_row[0]&key_column[0];
            key_2<=key_row[0]&key_column[1];
            key_3<=key_row[0]&key_column[2];
          end
        end
        always@(posedge clk_in or negedge rst_n )
        begin
          if (!rst_n)
          begin
            t1<=0; t2<=0;
            t3<=0; t4<=0;
            t5<=0; t6<=0;
          end
          else 
          begin
            t1<=t2;t2<=key_1;
            t3<=t4;t4<=key_2;
            t5<=t6;t6<=key_3;
          end
        end

        always@(posedge clk_in or negedge rst_n )
        begin
          if (!rst_n)
          begin
            key_1_edge<=1'b0;
            key_2_edge<=1'b0;
            key_3_edge<=1'b0;
          end
          else 
          begin
            key_1_edge<=(~t1&t2);
            key_2_edge<=(~t3&t4);
            key_3_edge<=(~t5&t6);
          end
        end

     //»Æ¶Ó
	  always@(posedge clk_in or negedge rst_n )
begin
	  if(!rst_n)
      begin
	    yellow_score<= 8'd0; 
        red_score<=8'd0;
      end 
	  else if(!en_score)
      begin
	    yellow_score<= yellow_score; 
        red_score<=red_score;
	  end

	  else if(key_1_edge==1&&key_yellow==1)
      begin
	    if(yellow_score[3:0]<4'd9)
        begin
	      yellow_score[3:0]<= yellow_score[3:0]+2'd1;
		  yellow_score[7:4]<= yellow_score[7:4];
	    end
	    else if(yellow_score[3:0]==4'd9)
        begin
	      yellow_score[3:0]<= 4'h0;
		  yellow_score[7:4]<= yellow_score[7:4]+4'h1;
	    end
	  end
	 	
	  else if(key_2_edge==1&&key_yellow==1)
      begin
	    if(yellow_score[3:0]<4'd8)
        begin
	      yellow_score[3:0]<= yellow_score[3:0]+2'd2;
		  yellow_score[7:4]<= yellow_score[7:4];
	    end
	    else if(yellow_score[3:0]==4'd8)
        begin
	      yellow_score[3:0]<= 4'h0;
		  yellow_score[7:4]<= yellow_score[7:4]+4'h1;
	    end
	    else if(yellow_score[3:0]==4'd9)
        begin
	      yellow_score[3:0]<= 4'h1;
		  yellow_score[7:4]<= yellow_score[7:4]+4'h1;
	    end
	  end
	  
	  else if(key_3_edge==1&&key_yellow==1)
      begin
	    if(yellow_score[3:0]<4'd7)
        begin
	      yellow_score[3:0]<= yellow_score[3:0]+2'd3;
		  yellow_score[7:4]<= yellow_score[7:4];
	    end
	    else if(yellow_score[3:0]==4'd7)
        begin
	      yellow_score[3:0]<= 4'h0;
	      yellow_score[7:4]<= yellow_score[7:4]+4'h1;
	    end
	    else if(yellow_score[3:0]==4'd8)
        begin
	      yellow_score[3:0]<= 4'h1;
	      yellow_score[7:4]<= yellow_score[7:4]+4'h1;
	    end
	    else if(yellow_score[3:0]==4'd9)
        begin
	      yellow_score[3:0]<= 4'h2;
	      yellow_score[7:4]<= yellow_score[7:4]+4'h1;
	    end
	  end

      else if(key_1_edge==1&&key_red==1)
      begin
	    if(red_score[3:0]<4'd9)
        begin
	      red_score[3:0]<= red_score[3:0]+2'd1;
		  red_score[7:4]<= red_score[7:4];
	    end
	    else if(red_score[3:0]==4'd9)
        begin
	      red_score[3:0]<= 4'h0;
		  red_score[7:4]<= red_score[7:4]+4'h1;
	    end
	  end
  
	  else if(key_2_edge==1&&key_red==1)
      begin
	    if(red_score[3:0]<4'd8)
        begin
	      red_score[3:0]<= red_score[3:0]+2'd2;
		  red_score[7:4]<= red_score[7:4];
	    end
	    else if(red_score[3:0]==4'd8)
        begin
	      red_score[3:0]<= 4'h0;
		  red_score[7:4]<= red_score[7:4]+4'h1;
	    end
	    else if(red_score[3:0]==4'd9)
        begin
	      red_score[3:0]<= 4'h1;
		  red_score[7:4]<= red_score[7:4]+4'h1;
	    end
	  end
	 
	  else if(key_3_edge==1&&key_red==1)
      begin
	    if(red_score[3:0]<4'd7)
        begin
	      red_score[3:0]<= red_score[3:0]+2'd3;
		  red_score[7:4]<= red_score[7:4];
	    end
	    else if(red_score[3:0]==4'd7)
        begin
	      red_score[3:0]<= 4'h0;
	      red_score[7:4]<= red_score[7:4]+4'h1;
	    end
	    else if(red_score[3:0]==4'd8)
        begin
	      red_score[3:0]<= 4'h1;
	      red_score[7:4]<= red_score[7:4]+4'h1;
	    end
	    else if(red_score[3:0]==4'd9)
        begin
	      red_score[3:0]<= 4'h2;
	      red_score[7:4]<= red_score[7:4]+4'h1;
	    end
	  end
end
	

	  assign score = {yellow_score[7:0],red_score[7:0]};
 
endmodule
