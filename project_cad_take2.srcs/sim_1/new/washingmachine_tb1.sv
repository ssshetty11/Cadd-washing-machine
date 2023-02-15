`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2022 21:26:32
// Design Name: 
// Module Name: washingmachine_tb1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module washingmachine_tb1( );
reg reset;
reg clk;
reg a1,a2,a3,a4,a5,a6;
wire y1,y2,y3,y4,y5,y6,yout;
washing_machine dut(.reset(reset),.clk(clk),.a1(a1),.a2(a2),.a3(a3),.a4(a4),.a5(a5),.a6(a6),.y1(y1),.y2(y2),.y3(y3),.y4(y4),.y5(y5),.y6(y6),.yout(yout));
always #5 clk=~clk;
initial begin
reset=1;
clk=0;
a1=0;
a2=0;a3=0;a4=0;a5=0;a6=0;
#4reset=0;
#6a1=1;
#10a2=1;
#10a3=1;
#10a4=1;
#10a5=1;
#10a6=1;
#10$finish;
end 
endmodule
