
module EightBitRxCounter(LoadBitCount,DecCount,RXBitCount, SCL);
  input LoadBitCount;
  input DecCount;
  input SCL;
  //input Reset;
  output reg [2:0]RXBitCount;
  //reg [31:0]Count;
  
  always@(negedge SCL)
  begin
                    if(LoadBitCount==1'b1)
                    begin
                    RXBitCount <= 7;  
                    end
          
                    else if(DecCount==1'b1)
                    begin
                   RXBitCount <= RXBitCount-3'b1;  
                    end
                       
                   
                  end
                  
   
  endmodule
  


