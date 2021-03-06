//`include "rxcounter.v"
//`include "rxbuffer.v"
//`include "rxcontr.v"
//`include "rxmux.v"

module RxController_tb();
//reg, GetAddr; 
reg [7:0] Addr; 
reg SCL;
wire RXIn;
reg [5:0]Burst;
reg [5:0]SizeCount;
//reg LatchD1;
//reg LatchD0;
reg CSRX;
reg clock;
wire LoadAck, LoadAddr , SelBUF, LatchD1, LatchD0, ValidRXIn, LoadSize, LoadBurst ;
wire [5:0] Size, BurstCount;
wire [7:0] GetAddr;
wire [31:0] BUF0, RXOut, BUF1;
wire [2:0] Count;
reg dir;
//reg [2:0]count;
reg SDA;

initial 
begin
//$dumpfile("dump.vcd");
//$dumpvars(1);
clock = 1'b1;
CSRX = 1'b0;
dir = 1;
SDA = 1;//EX
//count = 3'b0;
#10
CSRX = 1'b1;
SCL = 1'b1;
//RXIn = 1'b1;
#45//25
SDA=0;//EX
//RXIn = 1'b0;
#10
SizeCount = 6'b001000;
Burst = 6'b000011;
#50 dir = 0;
//$finish;
/*@(negedge clock )
begin 
SDA <= 1;
end

@(negedge clock )
begin 
SDA <= 0;
end

@(negedge clock )
begin 
SDA <= 1;
end

@(negedge clock )
begin 
SDA <= 0;
end

@(negedge clock )
begin 
SDA <= 1;
end

@(negedge clock )
begin 
SDA <= 0;
end*/

end




always
 begin
#5 clock = ~clock;
end

ReceiverBuffer  myrb(.RXIn(RXIn), .clock(clock), .LoadAck(LoadAck), .LoadAddr(LoadAddr), .GetAddr(GetAddr), .BUF0(BUF0), .BUF1(BUF1), .Count(Count), .LatchD1(LatchD1), .LatchD0(LatchD0),.CSRX(CSRX),.ValidRXIn(ValidRXIn));
RxController myctrl (.CSRX(CSRX), .clock(clock), .LoadAddr(LoadAddr), .LoadSize(LoadSize), .LoadBurst(LoadBurst), .LatchD0(LatchD0), .SizeCount(SizeCount), .LatchD1(LatchD1), .Size(Size), .ValidRXIn(ValidRXIn), .BurstCount(BurstCount), .LoadAck(LoadAck), .ValidRXOut(ValidRXOut), .Dec(Dec), .selBUF(selBUF), .GetAddr(GetAddr), .Addr(Addr), .RXIn(RXIn), .SCL(SCL));
RxMux  mymux(.BUF0(BUF0), .BUF1(BUF1), .RXOut(RXOut), .selBUF(selBUF));
RxCounter mycntr(.clock(clock), .CSRX(CSRX), .Dec(Dec), .Size(Size), .LoadSize(LoadSize), .SizeCount(SizeCount), .Burst(Burst), .BurstCount(BurstCount), .LoadBurst(LoadBurst));
endmodule
