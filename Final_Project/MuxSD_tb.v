module MuxSD_tb();

reg Buf0,Buf1,L1,L0;
wire SDA;
reg [1:0]sel;
reg clk;
 
MuxSD Mut(Buf0,Buf1,L1,L0,sel,SDA);

always
#5 clk = ~clk;

initial begin
Buf0= 1'b1;
Buf1 = 1'b0;
L1 = 1'b0; 
L0 = 1'b1;
sel = 2'b00;
clk = 1'b0;

@(posedge clk)
begin
 sel = 2'b00;
end

@(posedge clk)
begin
 sel = 2'b01;
end

@(posedge clk)
begin
 sel = 2'b10;
end

@(posedge clk)
begin
 sel = 2'b11;
end

end
endmodule
