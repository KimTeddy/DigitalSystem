`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/20 21:28:57
// Design Name: 
// Module Name: alarm_tb
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


module alarm_tb;
reg clk,rst;
reg [5:0] digit;
wire [3:0] sec0, sec1, min0, min1, hrs0, hrs1;
wire [3:0] sec0_3, sec1_3, min0_3, min1_3, hrs0_3, hrs1_3;
wire clock_en;
wire alarm_trigger;
reg up,down;

initial begin
clk = 1'b0;
rst = 1'b1;
digit = 6'b001000;
up = 1'b0;
#10;
rst = 1'b0;
#1000000;
up = 1'b1;
#150;
up = 1'b0;
#1000000;
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

clock inst_c1(clk, rst, clock_en, digit, , down, sec0, sec1, min0, min1, hrs0, hrs1);
alarm       alarm_inst_dut  (clk, rst, clock_en, digit, up, down, 
                            sec0, sec1, min0, min1, hrs0, hrs1, 
                            sec0_3, sec1_3, min0_3, min1_3, hrs0_3, hrs1_3, alarm_trigger);
gen_counter_en #(.SIZE(100)) gen_clock_en_inst (clk, rst, clock_en);

endmodule