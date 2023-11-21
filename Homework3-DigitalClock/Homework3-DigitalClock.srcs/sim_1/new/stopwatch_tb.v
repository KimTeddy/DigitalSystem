`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/20 20:57:00
// Design Name: 
// Module Name: stopwatch_tb
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


module stopwatch_tb;
reg clk,rst;
reg [5:0] digit;
wire [3:0] msec0, msec1, sec0, sec1, min0, min1;
wire clock_en;
reg stopwatch_en;

initial begin
clk = 1'b0;
rst = 1'b1;
stopwatch_en = 1'b0;
#10;
rst = 1'b0;
#1000;
stopwatch_en = 1'b1;
#8680000;
stopwatch_en = 1'b0;
#8680000;
stopwatch_en = 1'b1;
#8680000;
#8680000;
#8680000;
#8680000;
#8680000;
#8680000;
#8680000;
#8680000;
#8680000;
#8680000;
#8680000;
$stop;
end

always begin
#1;
clk = ~clk;
end

stopwatch inst_s1(clk, rst, clock_en, stopwatch_en, msec0, msec1, sec0, sec1, min0, min1);
gen_counter_en #(.SIZE(100)) gen_clock_en_inst (clk, rst, clock_en);


endmodule
