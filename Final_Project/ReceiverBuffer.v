module ReceiverBuffer (RXIn, SCL,  LoadAddr, GetAddr, BUF0, BUF1, LatchD1, LatchD0, ValidRXIn);
input LatchD1, LatchD0,SCL,ValidRXIn,  LoadAddr;
input RXIn;
output [31:0] BUF0;
output  [31:0] BUF1;
output [7:0] GetAddr;

reg [7:0] GetAddr;
reg [2:0] Count;
reg [31:0] BUF0;
reg  [31:0] BUF1;

//assign RXIn =  (LoadAck) ? 1'b0: 1'b1; 

always @(negedge SCL)
begin
if (ValidRXIn)
begin
if(LoadAddr)
begin

GetAddr = GetAddr*2;
GetAddr = GetAddr + RXIn;
end
if(LatchD0)
begin
  BUF0 = BUF0*2;
  BUF0 = BUF0 + RXIn;
  BUF1 <= 0;
end
if(LatchD1)
begin
   BUF1 = BUF1*2;
   BUF1 = BUF1 + RXIn;
   BUF0 <= 0;
end
end
end

always @ (negedge RXIn)
begin
if (SCL == 1)
begin 
BUF0 <= 0;
BUF1 <=0;
GetAddr <= 0;
end
end

endmodule


