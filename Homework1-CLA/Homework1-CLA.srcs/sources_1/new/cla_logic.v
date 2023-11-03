`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/25 21:20:02
// Design Name: 
// Module Name: pll
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


module cll(
    input ci,
    input [3:0] p,
    input [3:0] g,
    output [3:1] c,
    output co,
    output po,
    output go
    );
    
assign c[1] = g[0] | p[0]&ci;
assign c[2] = g[1] | p[1]&g[0] | p[1]&p[0]&ci;
assign c[3] = g[2] | p[2]&g[1] | p[2]&p[1]&g[0] | p[2]&p[1]&p[0]&ci;
assign co = g[3] | p[3]&g[2] | p[3]&p[2]&g[1] | p[3]&p[2]&p[1]&g[0] | p[3]&p[2]&p[1]&p[0]&ci;
assign po = p[3]&p[2]&p[1]&p[0];
assign go = g[3] | p[3]&g[2] | p[3]&p[2]&g[1] | p[3]&p[2]&p[1]&g[0];
endmodule
