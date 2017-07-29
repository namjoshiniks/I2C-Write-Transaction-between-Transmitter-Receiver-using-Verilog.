module TxBitCounter_tb();
  
  reg LoadBitCount;
  reg DecTxBitCount;
  reg [31:0]Size;
  reg Reset;
  wire [31:0]BitCount;
  //reg Count;
  
  reg clk;
  TxBitCounter MUT(LoadBitCount,DecTxBitCount,BitCount,Size,Reset,clk);
  
  always
  #50 clk = ~clk;
  
  initial begin
  clk = 1'b0;
  LoadBitCount = 1'b0;
  Reset = 1'b0;
  Size = 32'b0;
  DecTxBitCount = 1'b0;
  
  @(posedge clk) //1
  begin
  Size = 32'b111;  
  Reset = 1'b1;  
  LoadBitCount = 1'b0;
  DecTxBitCount = 1'b0;
  end
  
  @(posedge clk) //2
  begin
  Size = 32'b111;  
  Reset = 1'b0;  
  LoadBitCount = 1'b1;
  DecTxBitCount = 1'b0;
  end
  
  @(posedge clk) //3
  begin
  Size = 32'b111;  
  Reset = 1'b0;  
  LoadBitCount = 1'b0;
  DecTxBitCount = 1'b1;
  end
  
  @(posedge clk) //4
  begin
  Size = 32'b111;  
  Reset = 1'b0;  
  LoadBitCount = 1'b0;
  DecTxBitCount = 1'b1;
  end

@(posedge clk) //5
  begin
  Size = 32'b111;  
  Reset = 1'b0;  
  LoadBitCount = 1'b0;
  DecTxBitCount = 1'b1;
  end
  
  @(posedge clk) //6
  begin
  Size = 32'b111;  
  Reset = 1'b0;  
  LoadBitCount = 1'b0;
  DecTxBitCount = 1'b1;
  end
  
  @(posedge clk) //7
  begin
  Size = 32'b111;  
  Reset = 1'b0;  
  LoadBitCount = 1'b0;
  DecTxBitCount = 1'b1;
  end
  
  @(posedge clk) //8
  begin
  Size = 32'b111;  
  Reset = 1'b0;  
  LoadBitCount = 1'b0;
  DecTxBitCount = 1'b1;
  end
  
  @(posedge clk) //9
  begin
  Size = 32'b111;  
  Reset = 1'b0;  
  LoadBitCount = 1'b0;
  DecTxBitCount = 1'b1;
  end
  
  @(posedge clk) //10
  begin
  Size = 32'b111;  
  Reset = 1'b0;  
  LoadBitCount = 1'b1;
  DecTxBitCount = 1'b0;
  end
  
  @(posedge clk) //11
  begin
  Size = 32'b111;  
  Reset = 1'b0;  
  LoadBitCount = 1'b0;
  DecTxBitCount = 1'b1;
  end
  
  @(posedge clk) //12
  begin
  Size = 32'b111;  
  Reset = 1'b0;  
  LoadBitCount = 1'b0;
  DecTxBitCount = 1'b1;
  end
  
  @(posedge clk) //13
  begin
  Size = 32'b111;  
  Reset = 1'b0;  
  LoadBitCount = 1'b0;
  DecTxBitCount = 1'b1;
  end
  
  
  
end
endmodule
