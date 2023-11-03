module top (
    input clk,
    input rst,
    input btn, 
    output [7:0] seg_data, 
    output [5:0] seg_com
    );
    
    wire clk_6mhz, clk_1hz;
    wire [3:0] count; 
    wire btn_out_pulse; 
    wire [6:0] dec_out; 
    wire counter_en;
    
    clk_wiz_0 clk_inst (clk_6mhz, rst, , clk);
    clk_divider clk_div_inst (clk_6mhz, clk_1hz);
    gen_counter_en gen_cnt_en_inst (clk_6mhz, rst, counter_en);
    debounce debounce_inst (clk_6mhz, rst, btn, ,btn_out_pulse); 
    counter counter_inst (clk_1hz, rst, 1'b1, count); // clk_1hz, always enable
    //counter counter_inst (clk_6mhz, rst, counter_en, count); //clk_6mhz, using counter_enable 
    //counter counter_inst (clk_6mhz, rst, btn_out_pulse, count); //clk_6mhz, using btn_enable

    dec7 dec7_inst (count, dec_out); 
    
    assign seg_data = {dec_out, clk_1hz}; 
    assign seg_com = 6'b101110;
    
endmodule
