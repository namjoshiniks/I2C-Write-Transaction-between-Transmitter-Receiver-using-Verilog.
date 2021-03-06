module ShiftBuf1Reg(clk,signalShift,signalLoad,TxIn,dout);

output dout;
reg dout;

input [31:0] TxIn;
input signalShift;
input signalLoad;
input clk;

reg [31:0] data;

always@(posedge clk)
begin
if(signalLoad)
  data <= TxIn;
else if(signalShift)
 begin
   dout <= data[0];
   data <= {1'b0,data[31:1]};
 end
end
endmodule
