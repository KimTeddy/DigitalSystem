module top(input clk, input rst, input [2:0] btn, output [7:0] leds); 

wire clk_8hz;
wire [2:0] addr;
wire [7:0] dout_rom8x8, dout_bram8x8;
wire [7:0] din;  
wire [0:0] we; 

clk_divider clk_div_inst (clk, clk_8hz);
gen_addr gen_addr_inst (clk_8hz, rst, addr); 
rom8x8 rom8x8_inst (clk_8hz, addr, btn, dout_rom8x8);
bram8x8 bram8x8_inst (clk_8hz, we, addr, din, dout_bram8x8); 

assign leds = (btn[0]==1'b0)? dout_bram8x8 : dout_rom8x8;

assign we[0] = 1'b0; 

endmodule
