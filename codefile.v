module washing_machine(input logic reset,input logic clk,input logic a1,a2,a3,a4,a5,a6,output logic y1,y2,y3,y4,y5,y6,yout);
typedef enum logic[2:0]{check_door,fill_water,add_detergent,cycle,drain_water,spin}statetype;
statetype currentstate,nextstate;

always_ff@(negedge clk,posedge reset)
if(reset) currentstate <= check_door;
else currentstate<=nextstate;

always_comb
case(currentstate)
check_door:if(a1)nextstate=fill_water;
else nextstate=check_door;
fill_water:if(a2)nextstate=add_detergent;
else nextstate=fill_water;
add_detergent:if(a3)nextstate=cycle;
else nextstate=add_detergent;
cycle:if(a4)nextstate=drain_water;
else nextstate=cycle;
drain_water:if(a5)nextstate=spin;
else nextstate=drain_water;
spin:if(a6)nextstate=check_door;
else nextstate=spin;

default:nextstate=check_door;
endcase

assign y1=(a1 & nextstate==fill_water);
assign y2=(a2 & nextstate==add_detergent);
assign y3=(a3 & nextstate==cycle);
assign y4=(a4 & nextstate==drain_water);
assign y5=(a5 & nextstate==spin);
assign y6=(a6 & currentstate==check_door);

assign yout=(a1 & a2 & a3 & a4 & a5 & a6 );

endmodule
