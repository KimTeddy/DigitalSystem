module rom8x8(
    input clk,
    input [2:0] addr,
    input [2:0] btn,
    output reg [7:0] dout
    );
always @ (posedge clk) begin
    case (addr)
        3'b000: begin dout <= (btn[1]==1'b1) ? 8'b00000001 : 8'b00000011; end
        3'b001: begin dout <= (btn[1]==1'b1) ? 8'b00000010 : 8'b00000110; end
        3'b010: begin dout <= (btn[1]==1'b1) ? 8'b00000100 : 8'b00001100; end
        3'b011: begin dout <= (btn[1]==1'b1) ? 8'b00001000 : 8'b00011000; end
        3'b100: begin dout <= (btn[1]==1'b1) ? 8'b00010000 : 8'b00110000; end
        3'b101: begin dout <= (btn[1]==1'b1) ? 8'b00100000 : 8'b01100000; end
        3'b110: begin dout <= (btn[1]==1'b1) ? 8'b01000000 : 8'b11000000; end
        3'b111: begin dout <= (btn[1]==1'b1) ? 8'b10000000 : 8'b10000001; end
        default:begin dout <= (btn[1]==1'b1) ? 8'b00000000 : 8'b00000000; end
    endcase
end
endmodule