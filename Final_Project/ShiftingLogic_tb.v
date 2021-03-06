module ShiftingLogic_tb();

reg clk,ShiftBuf0,ShiftBuf1,LoadBuf0,LoadBuf1,StartTx;
reg [31:0]TxIn;
reg [1:0]PassSDA;
wire SDA;

ShiftingLogic MUT1(ShiftBuf0,ShiftBuf1,LoadBuf0,LoadBuf1,StartTx,clk,TxIn,PassSDA,SDA);

always
#5 clk = ~clk;

initial begin
clk = 1'b0;
ShiftBuf0 = 1'b0;
ShiftBuf1  = 1'b0;
LoadBuf0 = 1'b0;
LoadBuf1 = 1'b0;
PassSDA = 2'b10;
StartTx = 1'b0;
TxIn = 10;

@(posedge clk)
begin
 StartTx = 1'b1;
 LoadBuf0 = 1'b1;
 PassSDA = 2'b10;
end

/*@(posedge clk)
begin
 StartTx = 1'b1;
LoadBuf0 = 1'b0;
 PassSDA = 2'b11;
end
*/

//ShiftBuf0Bit0
@(posedge clk)
begin
 StartTx = 1'b1;
 ShiftBuf0 = 1'b1;
LoadBuf0 = 1'b0;
 TxIn = 5;
 LoadBuf1 = 1'b1;
 PassSDA = 2'b11;
end

//ShiftBuf0Bit1
@(posedge clk)
begin
 StartTx = 1'b1;
 LoadBuf1 = 1'b0;
 ShiftBuf0 = 1'b1;
 PassSDA = 2'b00;
end

//ShiftBuf0Bit2
@(posedge clk)
begin
 StartTx = 1'b1;
 ShiftBuf0 = 1'b1;
 PassSDA = 2'b00;
end

//ShiftBuf0Bit3
@(posedge clk)
begin
 StartTx = 1'b1;
 ShiftBuf0 = 1'b1;
 PassSDA = 2'b00;
end

//ShiftBuf1Bit0
@(posedge clk)
begin
 StartTx = 1'b1;
 ShiftBuf1 = 1'b1;
 PassSDA = 2'b00;
end

//ShiftBuf1Bit1
@(posedge clk)
begin
 StartTx = 1'b1;
 ShiftBuf1 = 1'b1;
 PassSDA = 2'b01;
end

//ShiftBuf1Bit2
@(posedge clk)
begin
 StartTx = 1'b1;
 ShiftBuf1 = 1'b1;
 PassSDA = 2'b01;
end

//ShiftBuf1Bit3
@(posedge clk)
begin
 StartTx = 1'b1;
 ShiftBuf1 = 1'b1;
 PassSDA = 2'b01;
end

end
endmodule
