`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/25 18:52:50
// Design Name: 
// Module Name: mul4
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


module mul4(input [3:0] a, b, output [7:0] p);
wire [3:0] d0, d1, d2, d3;
wire [3:0] u0_b, u1_b, u2_b;
wire [3:0] u0_s, u1_s, u2_s;
wire u0_co, u1_co, u2_co;

assign d0[0]=a[0]&b[0];
assign d0[1]=a[1]&b[0];
assign d0[2]=a[2]&b[0];
assign d0[3]=a[3]&b[0];

assign d1[0]=a[0]&b[1];
assign d1[1]=a[1]&b[1];
assign d1[2]=a[2]&b[1];
assign d1[3]=a[3]&b[1];

assign d2[0]=a[0]&b[2];
assign d2[1]=a[1]&b[2];
assign d2[2]=a[2]&b[2];
assign d2[3]=a[3]&b[2];

assign d3[0]=a[0]&b[3];
assign d3[1]=a[1]&b[3];
assign d3[2]=a[2]&b[3];
assign d3[3]=a[3]&b[3];

assign u0_b[0]=d0[1];
assign u0_b[1]=d0[2];
assign u0_b[2]=d0[3];
assign u0_b[3]=1'b0;

add4 add4_u0 (.a(d1), .b(u0_b), .ci(1'b0), .s(u0_s), .co(u0_co));

assign u1_b[0]=u0_s[1];
assign u1_b[1]=u0_s[2];
assign u1_b[2]=u0_s[3];
assign u1_b[3]=u0_co;

add4 add4_u1 (.a(d2), .b(u1_b), .ci(1'b0), .s(u1_s), .co(u1_co));

assign u2_b[0]=u1_s[1];
assign u2_b[1]=u1_s[2];
assign u2_b[2]=u1_s[3];
assign u2_b[3]=u1_co;

add4 add4_u2 (.a(d3), .b(u2_b), .ci(1'b0), .s(u2_s), .co(u2_co));

assign p[0]=d0[0];
assign p[1]=u0_s[0];
assign p[2]=u1_s[0];
assign p[3]=u2_s[0];
assign p[4]=u2_s[1];
assign p[5]=u2_s[2];
assign p[6]=u2_s[3];
assign p[7]=u2_co;

endmodule
