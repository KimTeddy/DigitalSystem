`timescale 1ns / 1ps

module graph_mod (input clk, input rst,input [9:0] x,input [9:0] y,input [4:0] key,input [4:0] key_pulse,output [2:0] rgb);

//assign rgb = (x>=600 && x<=603 && y>=204 && y<=275)? 3'b010 : 3'b110;

reg [9:0] current_bar_y; 
wire frame_tick; 

assign frame_tick = (x==639 && y==479)? 1 : 0; 

always @(posedge clk, posedge rst) begin
    if (rst) current_bar_y <= 0; 
    else if (frame_tick) current_bar_y <= current_bar_y+4; 
end

assign rgb = (x>=600 && x<=603 && y>=current_bar_y && y<=current_bar_y+71)? 3'b010 : 3'b110;


endmodule

