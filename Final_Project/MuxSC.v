module MuxSC(clk,selSC,SC);
  input clk;
  input selSC;       
  output SC;
  reg SC;   
 

 always @(*)
 begin 
 if(selSC==1'b0) 
  SC = ~clk;
 else if(selSC==1'b1) 
  SC = 1'b1;
 end
 endmodule



