`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/17 01:06:11
// Design Name: 
// Module Name: 2mux1
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


module mux21(
input a, b, s,
output reg o
    );
    always @(a, b, s) begin
        if (s==1'b0) o=a;
        else if(s==1'b1) o=b;
    end
endmodule
