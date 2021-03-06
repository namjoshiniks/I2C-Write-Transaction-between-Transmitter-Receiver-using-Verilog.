module ReceiverBuffer_tb();

reg RXIn, SCL,  LoadAddr, LatchD1, LatchD0, ValidRXIn;
wire [7:0]GetAddr;
wire [31:0] BUF0, BUF1; 
reg clock;
ReceiverBuffer my_rb (RXIn, SCL,  LoadAddr, GetAddr, BUF0, BUF1, LatchD1, LatchD0, ValidRXIn);

initial
begin
SCL = 1'b1;
RXIn = 1;
clock = 0;
#10
SCL = 1;
RXIn = 0;
#10
//SCL =~clock;
LoadAddr <=1'b1;
LatchD0 <= 1'b1;
LatchD1 <= 1'b1;
ValidRXIn <= 1'b1;
@(posedge clock)
begin
RXIn = 1'b0;
SCL =~clock;
end
@(posedge clock)
begin
RXIn = 1'b1;
SCL =~clock;
end
@(posedge clock)
begin
RXIn = 1'b1;
SCL =~clock;
end
@(posedge clock)
begin
RXIn = 1'b0;
SCL =~clock;
end
@(posedge clock)
begin
RXIn = 1'b1;
SCL =~clock;
end
@(posedge clock)
begin
RXIn = 1'b0;
SCL =~clock;
end
@(posedge clock)
begin
RXIn = 1'b1;
SCL =~clock;
end
@(posedge clock)
begin
RXIn = 1'b0;
SCL =~clock;
end
@(posedge clock)
begin
RXIn = 1'b1;
SCL =~clock;
end
@(posedge clock)
begin
RXIn = 1'b1;
SCL =~clock;
end
end


always
#10 clock <= ~clock;

endmodule
