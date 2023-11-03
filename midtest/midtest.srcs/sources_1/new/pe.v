`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/17 00:39:36
// Design Name: 
// Module Name: pe
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

module pe(
  input [3:0] A,
  output reg [2:0] P
    );
    always @* begin
        casez(A)
            4'b1zzz: P=3'b100;
            4'b01zz: P=3'b011;
            4'b001z: P=3'b010;
            4'b0001: P=3'b001;
            4'b0000: P=3'b000;
        endcase
    end
endmodule
