module EightBitCouter(LoadEightBitCount,DecEightBitCount,EightBitCount,Reset,clk);
  input LoadEightBitCount;
  input DecEightBitCount;
  input clk;
  input Reset;
  output reg [31:0]EightBitCount;
  //reg [31:0]Count;
  
  always@(posedge clk)
  begin
                    if(LoadEightBitCount==1'b1)
                    begin
                    EightBitCount <= 8;  
                    end
          
                    else if(DecEightBitCount==1'b1)
                    begin
                   EightBitCount <= EightBitCount-32'b1;  
                    end
                       
                   
                  end
                  
   
  endmodule
  



