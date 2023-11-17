`timescale 1ns / 1ps

module sync_mod(input rst,input clk,output [9:0] x,output [9:0]y,output video_on,output vsync,output hsync);  
reg [9:0] c_v, c_h; 
wire trig;

always @ (posedge clk or posedge rst) begin
if(rst) c_h<=0;
else if(c_h==799) c_h<=0;
else c_h<=c_h+1;
end

assign trig = (c_h==799)? 1:0;

always @ (posedge clk or posedge rst) begin
if(rst) c_v<=0;
else if(trig==1) begin
     if (c_v==523) c_v<=0;
     else c_v<=c_v+1;
     end
end

assign hsync = ((c_h>=656)&(c_h<752))? 0:1;
assign vsync = ((c_v>=491)&(c_v<493))? 0:1;                     

assign x = (c_h<640)? c_h : 0; //640x480 ȭ�� ���� ���� x ��ǥ
assign y = (c_v<480)? c_v : 0; //640x480 ȭ�� ���� ���� y ��ǥ
assign video_on = (c_h<640 && c_v<480)? 1 : 0;

endmodule

