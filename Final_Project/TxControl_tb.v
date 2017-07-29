module TxControl_tb();
  
  wire[31:0] Burst;
  wire[31:0] Size;
  wire[1:0] state;
  reg Write;
  reg[3:0] Addr;
  reg[31:0] Data;
  
  reg clock;  
  TxControl TC(Addr,Data,Write,Size,Burst);
  
  always
  #50 clock = ~clock;
  
  initial begin
    clock = 1'b1;
    Addr = 0000;
    Data = 32'b0;
    Write = 0;
    
@(posedge clock)
 begin
   Write=1;
   Addr = 32'b0010;
   Data = 32'b0011;
 end

@(posedge clock)
 begin
   Write=1;
   Addr = 32'b0100;
   Data = 32'b0111;
  end
  
  @(posedge clock)
 begin
   Write=0;
 end
 end
 endmodule
 


