module RxController ( LoadAddr, LoadSize, LatchD0, LatchD1, Size, ValidRXIn, ValidRXOut, Dec, selBUF,  GetAddr, RXIn, SCL,RXBitCount, DecCount, LoadBitCount,pstate,AckFlag,LoadAck);

input  SCL;
inout RXIn;
input [7:0] GetAddr;
input [5:0] Size;
input [2:0] RXBitCount;
output LoadAddr, LoadSize, ValidRXOut, Dec,selBUF, LatchD0, LatchD1, ValidRXIn, DecCount, LoadBitCount;
reg LoadAddr, LoadSize, ValidRXOut, Dec,selBUF, LatchD0, LatchD1,  ValidRXIn, DecCount, LoadBitCount;
output [3:0]pstate;
reg [3:0] nstate, pstate;
output AckFlag;
reg AckFlag;


localparam Idle= 4'b0000, AddrLoad= 4'b0001, AddrVerfy =4'b0010, SetBUF0 = 4'b0011, Ack0 = 4'b0100, SetBUF1 = 4'b0101,  Ack1 = 4'b0110;
integer i;
// i = 1'b0;
integer Count; 
output LoadAck;
integer LoadAck = 0;
// Count = 3'b111;  
reg [7:0]Addr;

assign RXIn = (LoadAck) ? AckFlag : 1'bz;
always @(RXIn or Size or RXBitCount or pstate)//(negedge SCL or pstate) //(RXIn or Size or RXBitCount or pstate)
begin
case (pstate)
Idle:
begin
selBUF <=0;
ValidRXOut <=0;
LatchD1 <=0;
LoadAck <= 0;
Addr <= 8'b00110110;
ValidRXIn <=1;
LoadBitCount <=1;
nstate <= AddrLoad;
end

AddrLoad:
begin
ValidRXIn <=1;
DecCount<=1;
LoadAddr <=1;

LoadBitCount <=0;

if (RXBitCount == 0)
begin
nstate <= AddrVerfy;


end
else 
nstate <= AddrLoad;
end

AddrVerfy:
 begin

//ValidRXIn <= 0;
LoadAck <= 1;
LoadAddr <=0;
DecCount <=0;

if (GetAddr == 8'b00110110)
begin
//LatchD0 <= 1;
LoadBitCount<=1;
LoadSize <=1;
ValidRXIn<=1;

AckFlag <= 0;
nstate <= SetBUF0;
end
else
begin
AckFlag <= 1;
LatchD0 <= 0;
LoadBitCount<=0;
LoadSize <=0;
ValidRXIn<=0;

nstate <= Idle;
end
end

SetBUF0:
begin

ValidRXOut <=0;
LoadSize<=0;
LatchD1 <=0;
LatchD0 <= 1;
Dec <=1;
ValidRXIn <= 1;
DecCount<=1;
LoadBitCount <= 0;
LoadSize <= 0;
LoadAck <= 0;

if(RXBitCount == 0)

begin
DecCount <=0;
Dec <=0;
//LatchD0 <=0;
//ValidRXIn <= 0;
nstate <= Ack0;
end

else

nstate <= SetBUF0;
end


Ack0:
begin
LatchD0 <=0;
LoadAck <=1;
LoadBitCount <=1;
ValidRXIn <=1;

AckFlag <=0;

if (Size ==1)
begin
//LatchD1 <=1;
LoadSize<= 1;

selBUF <=0;
ValidRXOut <= 1;
nstate <= SetBUF1;
end
else
begin
nstate <= SetBUF0;
//LatchD0 <=1;
end
end

SetBUF1:
begin
LoadBitCount <=0;
LoadSize<=0; 
ValidRXOut <=0;
LoadAck <=0;
LatchD0 <= 0;

LatchD1 <=1;
Dec <=1;
DecCount <=1;
ValidRXIn <=1;


if (RXBitCount == 0)
begin
//LatchD1 <= 0;
//ValidRXIn <=0;
nstate <= Ack1;
Dec <=0;
DecCount <=0;
end
else
nstate <= SetBUF1;
end

Ack1:

begin
LoadAck <=1;
AckFlag <= 0;
LatchD1 <= 0;
LoadBitCount <=1;
ValidRXIn <=1;



if (Size == 1)
begin
selBUF <=1;
//LatchD0 <=1;
LoadSize <=1;

ValidRXOut <=1;
nstate <= SetBUF0;
end
else
begin
nstate <=SetBUF1;
//LatchD1 <=1;
end
end
endcase 
end
 
always @(negedge SCL)
begin
pstate <= nstate;
end
 //Detect Start  
always @ (negedge RXIn )
 begin 
if (SCL == 1) 
  pstate <= Idle; 
end
 
//Detect stop
always @ (posedge RXIn)
begin
if (SCL == 1)
begin
pstate <= Idle;
end 
end
endmodule

