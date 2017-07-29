module TxBurstCounter_tb();
  
  reg LoadBurstCount;
  reg DecBurstCount;
  reg [31:0]Burst;
  reg Reset;
  wire [31:0]BurstCount;
  //reg Count;
  
  reg clk;
  TxBurstCounter MUT(LoadBurstCount,DecBurstCount,BurstCount,Burst,Reset,clk);
  
  always
  #50 clk = ~clk;
  
  initial begin
  clk = 1'b0;
  LoadBurstCount = 1'b0;
  Reset = 1'b0;
  Burst = 32'b0;
  DecBurstCount = 1'b0;
  
  @(posedge clk) //1
  begin
  Burst = 32'b100;  
  Reset = 1'b1;  
  LoadBurstCount = 1'b0;
  DecBurstCount = 1'b0;
  end
  
  @(posedge clk) //2
  begin
  Burst = 32'b100;  
  Reset = 1'b0;  
  LoadBurstCount = 1'b1;
  DecBurstCount = 1'b0;
  end
  
  @(posedge clk) //3
  begin
  Burst = 32'b100;  
  Reset = 1'b0;  
  LoadBurstCount = 1'b0;
  DecBurstCount = 1'b1;
  end
  
  @(posedge clk) //4
  begin
  Burst = 32'b100;  
  Reset = 1'b0;  
  LoadBurstCount = 1'b0;
  DecBurstCount = 1'b1;
  end

@(posedge clk) //5
  begin
  Burst = 32'b100;  
  Reset = 1'b0;  
  LoadBurstCount = 1'b0;
  DecBurstCount = 1'b1;
  end
  
  @(posedge clk) //6
  begin
  Burst = 32'b100;  
  Reset = 1'b0;  
  LoadBurstCount = 1'b0;
  DecBurstCount = 1'b1;
  end
  
  @(posedge clk) //10
  begin
  Burst = 32'b100;  
  Reset = 1'b0;  
  LoadBurstCount = 1'b1;
  DecBurstCount = 1'b0;
  end
  
  @(posedge clk) //11
  begin
  Burst = 32'b100;  
  Reset = 1'b0;  
  LoadBurstCount = 1'b0;
  DecBurstCount = 1'b1;
  end
  
  @(posedge clk) //12
  begin
  Burst = 32'b100;  
  Reset = 1'b0;  
  LoadBurstCount = 1'b0;
  DecBurstCount = 1'b1;
  end
  
  @(posedge clk) //13
  begin
  Burst = 32'b100;  
  Reset = 1'b0;  
  LoadBurstCount = 1'b0;
  DecBurstCount = 1'b1;
  end
  
  
  
end
endmodule


