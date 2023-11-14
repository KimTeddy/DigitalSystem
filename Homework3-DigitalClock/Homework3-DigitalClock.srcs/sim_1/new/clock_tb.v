`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/09 15:12:21
// Design Name: 
// Module Name: sec0_tb
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


module clock_tb;
reg clk,rst;
reg [5:0] digit;
wire [3:0] sec0, sec1, min0, min1,hrs0,hrs1;
wire clock_en;
reg up,down;

initial begin
clk = 1'b0;
rst = 1'b1;
#10;
rst = 1'b0;
#8680000;
#8680000;
#8680000;
$stop;
end

always begin
#1;
clk = ~clk;
end

clock inst_c1(clk, rst, clock_en, digit, up, down, sec0, sec1, min0, min1, hrs0, hrs1);
gen_counter_en #(.SIZE(100)) gen_clock_en_inst (clk, rst, clock_en);


endmodule