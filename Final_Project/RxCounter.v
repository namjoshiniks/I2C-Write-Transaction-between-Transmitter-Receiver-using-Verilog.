module RxCounter(SCL, RXIn, Dec, Size, LoadSize, SizeCount);

input RXIn;
//input LoadBurst;  
output [5:0] Size; 
//output [5:0] BurstCount;
  input SCL, Dec;
  input [5:0]SizeCount;
 input LoadSize;
//input LoadBurst;
//input [5:0] Burst;
 reg [5:0] Size;
//reg [5:0] BurstCount;


  always @ (negedge SCL)
 
 begin
//if (LoadBurst)
//begin
//BurstCount <= Burst;
//end
  if (LoadSize)
  begin
  Size<= SizeCount*7+1;
  end
  else if (Dec )
  begin
 Size <=  Size - 1;
 if (Size == 0)
begin
  Size <= SizeCount;
//BurstCount <= BurstCount -1;
end 
  
  end
  end
  
  
  always @ (negedge RXIn )
 begin 
if (SCL == 1) 
  Size <= SizeCount*7+1; 
end
endmodule


