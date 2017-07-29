module ShiftingLogic(ShiftBuf0,ShiftBuf1,LoadBuf0,LoadBuf1,StartTx,clk,TxIn,PassSDA,SDA);

input ShiftBuf0,ShiftBuf1,LoadBuf0,LoadBuf1,StartTx;
wire signalShiftBuf0,signalShiftBuf1,signalLoadBuf0,signalLoadBuf1,L1,L0,dout0,dout1; 

input [1:0] PassSDA;
input [31:0] TxIn;
input clk;
output SDA;
wire SDA1;

ShiftBuf0Reg MUT1(clk,signalShiftBuf0,signalLoadBuf0,TxIn,dout0);
ShiftBuf1Reg MUT2(clk,signalShiftBuf1,signalLoadBuf1,TxIn,dout1);
MuxSD MUT3(dout0,dout1,L1,L0,PassSDA,SDA1);

//always@(ShiftBuf0 or ShiftBuf1 or LoadBuf0 or LoadBuf0 or StartTx)
//begin
assign SDA = SDA1;
assign L1 = 1'b1;
assign L0 = 1'b0;
assign  signalShiftBuf0 = ShiftBuf0 && StartTx;
assign  signalShiftBuf1 = ShiftBuf1 && StartTx;
assign  signalLoadBuf0  = LoadBuf0 && StartTx; 
assign  signalLoadBuf1  = LoadBuf1 && StartTx;

//end
endmodule

 
