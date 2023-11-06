module uart_tx_tb;
reg clk;
reg rst; 
reg uart_tx_en; 
reg [7:0] uart_tx_data; 
wire tx_busy; 
wire uart_txd;

always begin
    #5 clk = ~clk;
end

initial begin
        clk = 0;
        rst = 1;
        uart_tx_en = 0;
        uart_tx_data = 0;
        #10000;
        uart_tx_data = 8'h56;
        #10; rst = 0;
        #10; uart_tx_en = 1;
        #10; uart_tx_en = 0;
        #86800;
        #8680;

        uart_tx_data = 8'h41;
        #10; uart_tx_en = 1;
        #10; uart_tx_en = 0;
        #86800;
        #8680;

        uart_tx_data = 8'h5D;
        #10; uart_tx_en = 1;
        #10; uart_tx_en = 0;
        #86800;
        #8680;
        $stop;
end
uart_tx tx0(clk,rst,uart_tx_en,uart_tx_data,tx_busy,uart_txd);
endmodule
