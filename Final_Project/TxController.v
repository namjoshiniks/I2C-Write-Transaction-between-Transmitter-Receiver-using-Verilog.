module TxController(clk,SDA,TxIn,Reset,StartTx,TxBitCount,TxBurstCount,LoadTxBuf0,LoadTxBuf1,LoadTxBitCount,LoadTxBurstCount,ShiftTxBuf0,ShiftTxBuf1,DecTxBitCount,DecTxBurstCount,ReadyData,PassSDA,PassSCL,pstate,LoadEightBitCount,DecEightBitCount,EightBitCount);

inout SDA;
wire SDATx;
reg direction;
input [31:0]TxIn;
input clk,Reset,StartTx;
input [31:0]TxBitCount;
input [31:0]TxBurstCount;
output [3:0]pstate;
reg [3:0]pstate;
reg [3:0]nstate;
output LoadTxBuf0,LoadTxBuf1,LoadTxBitCount,ShiftTxBuf0,ShiftTxBuf1,LoadTxBurstCount,LoadEightBitCount,DecEightBitCount;
reg LoadTxBuf0,LoadTxBuf1,LoadTxBitCount,ShiftTxBuf0,ShiftTxBuf1,LoadTxBurstCount,LoadEightBitCount,DecEightBitCount;



output DecTxBitCount,DecTxBurstCount,ReadyData,PassSCL;
reg DecTxBitCount,DecTxBurstCount,ReadyData,PassSCL;

output [1:0]PassSDA;
reg [1:0]PassSDA;
input [3:0]EightBitCount; 

reg SizeShiftFlag,StartBitFlag;

assign SDA = direction ? SDATx : 1'bz;

 
ShiftingLogic MUT2(ShiftTxBuf0,ShiftTxBuf1,LoadTxBuf0,LoadTxBuf1,StartTx,clk,TxIn,PassSDA,SDATx);


always@(posedge clk)
begin
 if(Reset == 1)
   begin
   // pstate = 4'b0000;
  direction <= 1;
  PassSDA <= 2'b10;
  PassSCL <= 1;
  LoadTxBuf0 <= 1;
  LoadTxBurstCount <= 1;
  LoadTxBitCount <= 1;
  LoadEightBitCount <= 1;
  SizeShiftFlag <= 0;
  
  if(StartTx == 1)
  begin
     StartBitFlag <= 1;
     nstate <= 4'b1010;
  end
   end
 else
    pstate <= nstate;
end

always@(negedge clk)
begin
 if(StartBitFlag == 0)
 begin
  
  PassSDA <= 2'b11;
  PassSCL <= 1;
  StartBitFlag <= 1;
 end
end


always@(TxBitCount or TxBurstCount or EightBitCount or pstate )//(pstate or posedge clk)//@(posedge clk)
begin
  case(pstate)


  4'b1010:  //Load Addr
  begin
  LoadTxBuf0 <= 0;
  LoadTxBurstCount <= 0;
  LoadTxBitCount <= 0;
  LoadEightBitCount <= 0;
 
  StartBitFlag <= 0;
 ShiftTxBuf0 <= 1;
  DecEightBitCount <= 1;
  PassSDA <= 2'b10;
  PassSCL <= 1;
  nstate <= 4'b1011;
  end

  4'b1011:  //Shift Addr Bits
  begin
 
  PassSDA <= 2'b00;
  PassSCL <= 0;
  if(EightBitCount == 0)
  begin
  LoadTxBuf1 <= 1;
  LoadEightBitCount <= 1;
  ReadyData <= 1;
  nstate <= 4'b0001;
  end
  else
  begin
  ShiftTxBuf0 <= 1;
  DecEightBitCount <= 1;
  end
  end

  4'b0001:    //Ack ADDR
  begin
  LoadTxBuf1 <= 0;
  LoadEightBitCount <= 0;
  ShiftTxBuf0 <= 0;
  DecEightBitCount <= 0;
  ReadyData <= 0;
  

  direction <= 0;
  if(SDA == 0)
  begin
  ShiftTxBuf1 <= 1;
  DecTxBitCount <= 1;
  DecEightBitCount <= 1;
  nstate <= 4'b0110;
  end
  else if(SDA == 1)
  begin
  nstate = 4'b0101;
  end
  
  
  end
 
 
  4'b0010: //ShiftBitBuf0
  begin
  SizeShiftFlag <= 0; 

  ShiftTxBuf0 <= 1;
  DecTxBitCount <= 1;
  PassSDA <= 2'b00;
  PassSCL <= 0;
  direction <= 1;
  DecEightBitCount <= 1;
  if(EightBitCount == 1)
    begin
    nstate <= 4'b0011;
    end
  
  end

  4'b0011:  //ShiftLastBitBuf0
  begin
  ShiftTxBuf0 <= 0;
  DecTxBitCount <= 0;
  
  DecEightBitCount <= 1;
  PassSDA <= 2'b00;
  PassSCL <= 0;
  direction <= 1;
  LoadEightBitCount <= 1;
  if(TxBitCount == 0)
   begin
   LoadTxBuf1 <= 1;
   SizeShiftFlag <= 1;
   LoadTxBitCount <= 1;
   DecTxBurstCount <= 1;
   SizeShiftFlag <= 1;
   ReadyData <= 1;
   end
  nstate <= 4'b0100;

  end

  4'b0100: //ACKBuf0
  begin
  ReadyData <= 0;
  LoadTxBuf1 <= 0;
  DecTxBurstCount <= 0;
  LoadTxBitCount <= 0;
  LoadEightBitCount = 0;
  direction <= 0;

  if(TxBurstCount == 0) 
   begin
   nstate <= 4'b0101; 
   end
  else if(SizeShiftFlag == 0 )
   begin
   ShiftTxBuf0 <= 1;
   DecTxBitCount <= 1;
   DecEightBitCount = 1; 
   nstate <= 4'b0010;
   end
  else if(SizeShiftFlag == 1)
   begin
   ShiftTxBuf1 <= 1;
   DecTxBitCount <= 1;
   DecEightBitCount = 1; 
   nstate <= 4'b0110;
   end 
  end

  4'b0110:  //ShiftBitsBuf1
  begin
  SizeShiftFlag <= 0;

  ShiftTxBuf1 <= 1;
  PassSDA <= 2'b01;
  PassSCL <= 0;
  DecTxBitCount <= 1;
  DecEightBitCount = 1; 
  direction <= 1;
  if(EightBitCount == 1)
   begin
   nstate <= 4'b0111; 
   end
  end

  4'b0111:  //ShiftLastBitBuf1
  begin
  ShiftTxBuf1 <= 0;
  DecTxBitCount <= 0;
  DecEightBitCount = 0;

  LoadEightBitCount <= 1;
  PassSDA <= 2'b01;
  PassSCL <= 0;
  direction <= 1;
  if(TxBitCount == 0)
   begin
   LoadTxBuf0 <= 1;
   SizeShiftFlag <= 1;
   LoadTxBitCount <= 1;
   DecTxBurstCount <= 1;
   ReadyData <= 1;
   end
  nstate <= 4'b1000;
  end

  4'b1000:  //ACK Buf1
  begin
  ReadyData <= 0;
  LoadTxBuf0 <= 0;
  DecTxBurstCount <= 0;
  LoadTxBitCount <= 0;
  direction <= 0;
  LoadEightBitCount <= 0;
  
  if(TxBurstCount == 0 )
   begin
   nstate <= 4'b0101;
   end
  else if(SizeShiftFlag == 0)
   begin
   ShiftTxBuf1 <= 1;
   DecTxBitCount <= 1;
   DecEightBitCount <= 1;
   nstate <= 4'b0110; 
   end
  else if(SizeShiftFlag == 1)
   begin
   ShiftTxBuf0 <= 1;
   DecTxBitCount <= 1;
   DecEightBitCount <= 1; 
   nstate <= 4'b0010;
   end
  end
  
  4'b0101:  //Stop Preset
  begin
  ShiftTxBuf1 <= 0;
  ShiftTxBuf0 <= 0;
  DecTxBitCount <= 0;
  DecEightBitCount <= 0;

  direction <= 1;
  PassSDA <= 2'b11;
  PassSCL <= 0;
  nstate <= 4'b1001;
  end

  4'b1001:  //STOP
  begin
  direction <= 1;
  PassSDA <= 2'b10;
  PassSCL <= 1;
  end
  endcase
end


endmodule

