module TxBurstCounter(LoadBurstCount,DecBurstCount,BurstCount,Burst,Reset,clk);
  input LoadBurstCount;
  input DecBurstCount;
  input [31:0]Burst;
  input clk;
  input Reset;
  output reg [31:0]BurstCount;
  //reg [31:0]Count;
  
  reg [1:0]state;
  
  localparam s1=2'b00, s2=2'b01, s3=2'b10, s4=2'b11;
  
  always@(posedge clk)
  begin
               
                  if(LoadBurstCount==1'b1)
                    begin
                    BurstCount <= Burst;  
                    end
                    
                  else if(DecBurstCount==1'b1)
                    begin
                    BurstCount <= BurstCount-32'b1;  
                    end
                              
                    else if(BurstCount==32'b0)
                    begin  
                    if(LoadBurstCount==1'b1)  
                    begin
                    BurstCount <= Burst; 
                    end 
                     
                    else
                    BurstCount = 32'b0;
                    
                    end
                  end
   
  endmodule
  




