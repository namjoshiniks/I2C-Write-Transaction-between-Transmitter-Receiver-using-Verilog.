module TxController_tb();

//Tx Wires
reg clk,Reset,StartTx,Write;
wire [3:0]pstate;
reg [3:0]Addr;
reg [31:0]Data;
wire [31:0]Size;
wire [31:0]Burst;
wire SCL;
wire SDA,PassSCL;
wire [1:0]PassSDA;
wire LoadTxBurstCount,LoadTxBuf0,LoadTxBuf1,DecTxBurstCount;
wire [31:0]TxBurstCount;
wire LoadTxBitCount,ShiftTxBuf0,ShiftTxBuf1,DecTxBitCount;
wire [31:0]TxBitCount;
wire LoadEightBitCount,DecEightBitCount;
wire [31:0]EightBitCount;
wire ReadyData;
reg [31:0] TxIn;
reg [31:0] TxInList [0:5];
reg [31:0]RxVerify; // RxVerify will change with size, it will be 8 bits for size 1, 16 for size 2 and 32 for size 4. 

//RxWires
wire [3:0]pstateRX;
wire LoadAddr, LoadSize, LatchD0, LatchD1, ValidRXIn, ValidRXOut, Dec, selBUF;  
wire DecCount, LoadBitCount;
wire AckFlag;
wire[31:0]LoadAck;
wire [5:0] SizeRx;
wire [7:0] GetAddr;
wire [2:0]RXBitCount;
wire[31:0] BUF0,BUF1,RXOut;
reg [5:0]SizeCount;
integer count = 1;
integer count1 = 1;
integer i = 0;

//Tx Modules
TxController MUT1(clk,SDA,TxIn,Reset,StartTx,TxBitCount,TxBurstCount,LoadTxBuf0,LoadTxBuf1,LoadTxBitCount,LoadTxBurstCount,ShiftTxBuf0,ShiftTxBuf1,DecTxBitCount,DecTxBurstCount,ReadyData,PassSDA,PassSCL,pstate,LoadEightBitCount,DecEightBitCount,EightBitCount);
TxBurstCounter MUT3(LoadTxBurstCount,DecTxBurstCount,TxBurstCount,Burst,Reset,clk);
TxBitCounter MUT4(LoadTxBitCount,DecTxBitCount,TxBitCount,Size,Reset,clk);
EightBitCouter MUT7(LoadEightBitCount,DecEightBitCount,EightBitCount,Reset,clk);
TxControl MUT6(Addr,Data,Write,Size,Burst);
MuxSC MUT5(clk,PassSCL,SCL);


//Rx Modules
 ReceiverBuffer myrbuf (SDA, SCL,  LoadAddr, GetAddr, BUF0, BUF1, LatchD1, LatchD0, ValidRXIn);
RxMux myrxmux(BUF0, BUF1,ValidRXOut, RXOut, selBUF);
RxController myctrl( LoadAddr, LoadSize, LatchD0, LatchD1, SizeRx, ValidRXIn, ValidRXOut, Dec, selBUF,  GetAddr, SDA, SCL,RXBitCount, DecCount, LoadBitCount,pstateRX,AckFlag,LoadAck);
EightBitRxCounter mycount(LoadBitCount,DecCount,RXBitCount, SCL);
RxCounter mysize(SCL, SDA, Dec, SizeRx, LoadSize, SizeCount);

always@(negedge ValidRXOut)
begin 
RxVerify = 0;
for (i=0; i<32; i=i+1)    // for loop 2nd condition depends on size 
  RxVerify[i] = RXOut[31-i]; //for size 1 we have RXOut[7-i], for size 2 we have RXOut[15-i];
if (RxVerify == TxInList[count1])
begin
$display ("It is a match");
count1 = count1 + 1;
end
end

always
#5 clk=~clk;
always@(ReadyData)
begin
if(ReadyData == 1)
begin
TxIn <= TxInList[count];
count = count + 1;
end
end
initial begin
clk <= 0;
Addr <= 4'b0010;
Data <= 2;
Write <= 0; 
Reset <=0;
StartTx <=0;
TxInList[0] <= 8'h6c;  
TxInList[1] <= 4048;
TxInList[2] <= 800;
TxInList[3] <= 456;
TxInList[4] <= 785;
TxInList[5] <= 987;


TxIn <=32'h6c; //Valid Address
//TxIn <=8'hf0; //To check the transaction with Invalid Address, comment previous line and uncomment this line to check.

SizeCount <= 4;    //SizeCount for receiver will vary depending on the size that transmitter will set 
 @(posedge clk) //Write Burst 
 begin
    Addr <= 4'b0010;
    Data <= 2;
    Write <= 1;  
    
 end

 @(posedge clk) //Write Size //Reset //Start 
 begin
    Addr <= 4'b0100;
    Data <= 4;
    Write <= 1;  
    Reset <= 1; 
    StartTx <= 1;
    
 end
  
@(posedge clk) //3
 begin
    Write <= 0; 
    Reset <= 0;
    
     
 end

end

endmodule
