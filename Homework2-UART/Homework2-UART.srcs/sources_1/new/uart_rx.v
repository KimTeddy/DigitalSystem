module uart_rx (
    input clk,
    input rst,
    input uart_rxd, //수신 데이터
    output reg rx_busy,	//idle 상태가 아닐때 '1'
    output reg [7:0] uart_rx_data //수신한 8비트 data
);
reg [3:0] c_state, n_state;
reg [7:0] rx_data_buf;
//reg uart_start_pulse;
wire change_en;

reg [9:0] o;
parameter   SIZE = 868;
//100MHz = 10ns -> 115200[bit/s] => [ns/bit] => 8680.555ns/10ns = 868 clk
parameter   IDLE=4'b0, START=4'b1, 
            BIT0=4'd2, BIT1=4'd3, BIT2=4'd4, BIT3=4'd5, 
            BIT4=4'd6, BIT5=4'd7, BIT6=4'd8, BIT7=4'd9,
            STOP=4'd10;

always @(*) begin
    case (c_state)
        IDLE:   begin n_state = !uart_rxd ? START: IDLE; end
        START:  begin n_state = change_en ? BIT0 :START; end
        BIT0:   begin n_state = change_en ? BIT1 : BIT0; end
        BIT1:   begin n_state = change_en ? BIT2 : BIT1; end
        BIT2:   begin n_state = change_en ? BIT3 : BIT2; end
        BIT3:   begin n_state = change_en ? BIT4 : BIT3; end
        BIT4:   begin n_state = change_en ? BIT5 : BIT4; end
        BIT5:   begin n_state = change_en ? BIT6 : BIT5; end
        BIT6:   begin n_state = change_en ? BIT7 : BIT6; end
        BIT7:   begin n_state = change_en ? STOP : BIT7; end
        default:begin n_state = change_en ? IDLE : STOP; end//STOP
    endcase
end

always @(*) begin
    case (c_state)
        IDLE:   begin uart_rx_data=rx_data_buf;rx_busy=1'b0; end
        START:  begin                          rx_busy=1'b1; end
        BIT0:   begin rx_data_buf[0]=uart_rxd; rx_busy=1'b1; end
        BIT1:   begin rx_data_buf[1]=uart_rxd; rx_busy=1'b1; end
        BIT2:   begin rx_data_buf[2]=uart_rxd; rx_busy=1'b1; end
        BIT3:   begin rx_data_buf[3]=uart_rxd; rx_busy=1'b1; end
        BIT4:   begin rx_data_buf[4]=uart_rxd; rx_busy=1'b1; end
        BIT5:   begin rx_data_buf[5]=uart_rxd; rx_busy=1'b1; end
        BIT6:   begin rx_data_buf[6]=uart_rxd; rx_busy=1'b1; end
        BIT7:   begin rx_data_buf[7]=uart_rxd; rx_busy=1'b1; end
        default:begin                          rx_busy=1'b1; end//STOP
    endcase
end

always @(posedge clk, posedge rst) begin
    if(rst) c_state <= IDLE;
    else    c_state <= n_state;
end

always @(posedge clk or posedge rst) begin
    if(rst) o <= 0;
    else if(o == SIZE-1) o <= 0;
    //else if(uart_start_pulse) o <= 0;
    else o <= o + 1;
end

// always @(*) begin
//     if(rst) uart_rx_data <= 8'b0;
// end

// always @(posedge clk, posedge rst) begin
//     if(rst) begin c_state <= IDLE; uart_rx_data <= 8'b0; end
//     else    c_state <= n_state;
// end

assign change_en = (o == SIZE-1) ? 1'b1 : 1'b0;
//assign uart_start_pulse = change_en;
endmodule