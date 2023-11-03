module uart_tx_tb;

reg clk; //클럭->115200으로 동작하게 해야 함
reg rst; //리셋->IDLE돼야 함
reg uart_tx_en; //전송 버튼, debouncer입력으로
reg [7:0] uart_tx_data; //송신할 8비트 data 
wire tx_busy; //idle 상태가 아닐 때 '1'
wire uart_txd;

always begin
        #5 clk = ~clk;
    end

initial begin
        // Initialize signals
        clk = 0;
        rst = 0;
        uart_tx_en = 0;
        uart_tx_data = 0;

        #10 rst = 1; // Reset the module
        #10 rst = 0;

                // Scenario 5: Transmit 0x80
        #1500 uart_tx_data = 8'h80;
              uart_tx_en = 1;
        #10  uart_tx_en = 0;

        $finish;
end
uart_tx tx1(clk,rst,uart_tx_en,uart_tx_data,tx_busy,uart_txd);
endmodule
