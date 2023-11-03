`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/17 00:06:29
// Design Name: 
// Module Name: addsub4
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


module addsub4(
    input [3:0] a, b,
    input sign,
    input ci,
    output [3:0] s,
    output co
    );
    wire [3:0] c;
    wire [3:0] bw;
assign c[0]=sign|ci;
assign bw[0]=b[0]^sign;
assign bw[1]=b[1]^sign;
assign bw[2]=b[2]^sign;
assign bw[3]=b[3]^sign;
fa u_fa_0 (a[0],bw[0],c[0],s[0],c[1]);
fa u_fa_1 (a[1],bw[1],c[1],s[1],c[2]);
fa u_fa_2 (a[2],bw[2],c[2],s[2],c[3]);
fa u_fa_3 (a[3],bw[3],c[3],s[3],co);
endmodule

module addsub4b(
    input [3:0] a, b,
    input sign,
    output [3:0] s
    );
    wire [3:0] t;
    wire c;
    //assign s=(sign==1'b0) ? a+b : a-b;
    assign t=(sign==1'b0) ? b : ~b;
    assign s=a+t+sign;
endmodule