module top (
    input clk,
    input reset_poweron,
    input [3:0] btn, 
    output reg [7:0] seg_data, 
    output reg [5:0] seg_com
    );
    
wire clk_6mhz, clk_600hz;
wire [6:0] sec0_out, sec1_out, min0_out, min1_out, hrs0_out, hrs1_out; //7seg 숫자 표시용
wire [3:0] sec0, sec1, min0, min1, hrs0, hrs1;//실제 각 자리 값
wire clock_en;
reg [5:0] digit;
wire left, right, up, down; 
wire [3:0] btn_pulse; 
wire locked, rst; 

//for PLL
clk_wiz_0 clk_inst (clk_6mhz, reset_poweron, locked, clk); //for Zedboard
//assign clk_6mhz = clk;  //for Simulation only

//for reset signal generation
assign rst = reset_poweron | (~locked); 

//1초에 한 번 발생하는 clock enable 신호
//for speed control: SIZE=6000000(x1), SIZE=600000(x10), SIZE=6000(x1000)
gen_counter_en #(.SIZE(600)) gen_clock_en_inst (clk_6mhz, rst, clock_en);
//실제 시계 값
clock clock_inst (clk_6mhz, rst, clock_en, digit, up, down, sec0, sec1, min0, min1, hrs0, hrs1); 

// for debouncing, use btn_pulse that has only 1 cycle duration)
//버튼 디바운싱 후 펄스를 각 신호에 넣기
debounce #(.BTN_WIDTH(4)) debounce_btn0_inst (clk_6mhz, rst, btn, ,btn_pulse);
assign {down, up, right, left} = btn_pulse;

//7-seg decoder로 띄우기
dec7 dec_sec0_inst (sec0, sec0_out); 
dec7 dec_sec1_inst (sec1, sec1_out); 
dec7 dec_min0_inst (min0, min0_out); 
dec7 dec_min1_inst (min1, min1_out); 
dec7 dec_hrs0_inst (hrs0, hrs0_out); 
dec7 dec_hrs1_inst (hrs1, hrs1_out);

//digit[5:0] generation code here with “left” or “right” button
//digit[5:0] = 100000,010000,001000,000100,000010,000001,100000,010000……

wire[7:0]a;
wire[2:0]s;
reg[7:0]o;

always @ (a or s) begin //right rotation
    case (s)
        3'b000: o = a;
        3'b001: o = {a[0], a[7:1]};
        3'b010: o = {a[1:0], a[7:2]};
        3'b011: o = {a[2:0], a[7:3]};
        3'b100: o = {a[3:0], a[7:4]};
        3'b101: o = {a[4:0], a[7:5]};
        3'b110: o = {a[5:0], a[7:6]};
        default: o = {a[6:0], a[7]};
    endcase
end


//seg_com[5:0] generation code here (shifts 600 times per second)
//seg_com[5:0] = 100000,010000,001000,000100,000010,000001,100000,010000……
clk_divider #(.DIVISOR(10000)) clk_div(clk_6mhz, clk_600hz);

always @(posedge clk_600hz, posedge rst) begin
    if(rst) seg_com <= 6'b100000;
    else seg_com <= {seg_com[0], seg_com[5:1]};
end

always @ (seg_com) begin
    case (seg_com)
        6'b100000: seg_data = {sec0_out, digit[5]};
        6'b010000: seg_data = {sec1_out, digit[4]};
        6'b001000: seg_data = {min0_out, digit[3]};
        6'b000100: seg_data = {min1_out, digit[2]};
        6'b000010: seg_data = {hrs0_out, digit[1]};
        6'b000001: seg_data = {hrs1_out, digit[0]};
        default: seg_data = 8'b0; 
    endcase
end


endmodule
