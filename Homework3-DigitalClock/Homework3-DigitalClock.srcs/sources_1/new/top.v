module top (
    input clk,
    input reset_poweron,
    input [3:0] btn, 
    output reg [7:0] seg_data, 
    output reg [5:0] seg_com
    );

parameter CLOCK = 2'd0, TIMER = 2'd1, STOPWATCH = 2'd2, ALARM = 2'd3;

wire clk_6mhz, clk_600hz;//clk_600hz추가
wire [6:0] sec0_out, sec1_out, min0_out, min1_out, hrs0_out, hrs1_out; //7seg 숫자 표시용
reg [3:0] sec0, sec1, min0, min1, hrs0, hrs1;//실제 각 자리 값
wire [3:0] sec0_0, sec1_0, min0_0, min1_0, hrs0_0, hrs1_0;//CLOCK
wire [3:0] sec0_1, sec1_1, min0_1, min1_1, hrs0_1, hrs1_1;//TIMER
wire [3:0] sec0_2, sec1_2, min0_2, min1_2, hrs0_2, hrs1_2;//STOPWATCH
wire [3:0] sec0_3, sec1_3, min0_3, min1_3, hrs0_3, hrs1_3;//ALARM
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
gen_counter_en #(.SIZE(6000000)) gen_clock_en_inst (clk_6mhz, rst, clock_en);

//모드
wire [3:0]for_mode_button;//mode_button을 위해 btn out 받는 용도
wire mode_button;//실제 모드 버튼
reg mode_trigger;//2초 세는 용도
wire mode_change_trigger;
wire [1:0] mode; // 0:clock, 1:timer, 2:stopwatch, 3:alarm
//down 버튼 2초 이상: 모드 변경
always @(posedge clock_en, posedge rst)begin//2초 세는 mode_trigger
    if(rst) mode_trigger <= 0;
    else if(mode_button) mode_trigger <= mode_trigger + 1;//버튼을 누르고 있는 동안 1씩 증가
    else mode_trigger <= 0;//안 누를 때는 0
end
assign mode_change_trigger = (mode_trigger>=2) ? 1'b1 : 1'b0;//2초 지나면 1 됨

mode_changer mode_changer_inst (rst, mode_change_trigger, mode);//모드 변경 FSM



//시계 숫자 값
clock clock_inst (clk_6mhz, rst, clock_en, digit, up, down, sec0_0, sec1_0, min0_0, min1_0, hrs0_0, hrs1_0); 

always @(*)begin
    case(mode)
        CLOCK:      begin 
            sec0=sec0_0;
            sec1=sec1_0;
            min0=min0_0;
            min1=min1_0;
            hrs0=hrs0_0;
            hrs1=hrs1_0;    end
        TIMER:      begin 
            sec0=sec0_1;
            sec1=sec1_1;
            min0=min0_1;
            min1=min1_1;
            hrs0=hrs0_1;
            hrs1=hrs1_1;    end
        STOPWATCH:  begin 
            sec0=sec0_2;
            sec1=sec1_2;
            min0=min0_2;
            min1=min1_2;
            hrs0=hrs0_2;
            hrs1=hrs1_2;    end
        ALARM:      begin 
            sec0=sec0_3;
            sec1=sec1_3;
            min0=min0_3;
            min1=min1_3;
            hrs0=hrs0_3;
            hrs1=hrs1_3;    end
        default:    begin 
            sec0=sec0_0;
            sec1=sec1_0;
            min0=min0_0;
            min1=min1_0;
            hrs0=hrs0_0;
            hrs1=hrs1_0;    end
    endcase
end



//버튼 디바운싱 후 펄스를 각 신호에 넣기
// for debouncing, use btn_pulse that has only 1 cycle duration)
debounce #(.BTN_WIDTH(4)) debounce_btn0_inst (clk_6mhz, rst, btn, for_mode_button, btn_pulse);
assign {down, up, right, left} = btn_pulse;
assign mode_button = for_mode_button[3];

//7-seg decoder로 띄우기
dec7 dec_sec0_inst (sec0, sec0_out); 
dec7 dec_sec1_inst (sec1, sec1_out); 
dec7 dec_min0_inst (min0, min0_out); 
dec7 dec_min1_inst (min1, min1_out); 
dec7 dec_hrs0_inst (hrs0, hrs0_out); 
dec7 dec_hrs1_inst (hrs1, hrs1_out);

//LEFT / RIGHT 버튼
//digit[5:0] generation code here with “left” or “right” button
//digit[5:0] = 100000,010000,001000,000100,000010,000001,100000,010000……
always @(posedge clk_6mhz, posedge rst) begin
    if(rst) digit <= 6'b100000;
    else if(left) digit <= {digit[0], digit[5:1]};
    else if(right) digit <= {digit[4:0], digit[5]};
end
// always @(*) begin
//     if(right) digit = {digit[0], digit[5:1]};
// end
// always @(*) begin
//     if(left) digit = {digit[4:0], digit[5]};
// end

//600hz마다 켜는 LED위치 바꾸기
//seg_com[5:0] generation code here (shifts 600 times per second)
//seg_com[5:0] = 100000,010000,001000,000100,000010,000001,100000,010000……
clk_divider #(.DIVISOR(10000)) clk_div(clk_6mhz, clk_600hz);

always @(posedge clk_600hz, posedge rst) begin
    if(rst) seg_com <= 6'b100000;
    else seg_com <= {seg_com[0], seg_com[5:1]};
end
//해당 위치에 켜야 할 숫자값을 7segment용으로 변환한 값을 넣어줌
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