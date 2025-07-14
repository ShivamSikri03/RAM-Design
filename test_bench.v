module tb_ram;

    // Signals
    reg clk;
    reg we;
    reg [3:0] addr;
    reg [7:0] din;
    wire [7:0] dout;

    ram uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    always #5 clk = ~clk;

    initial begin
        // Monitor the signals
        $monitor("Time=%0t | CLK=%b | WE=%b | ADDR=%d | DIN=%h | DOUT=%h", 
                  $time, clk, we, addr, din, dout)

        
        clk = 0;        // Initialize signals
        we = 0;
        addr = 0;
        din = 0;

        #10;
        we = 1; addr = 4'd4; din = 8'hAA;

        #10;
        we = 0; addr = 4'd4;

        #10;
        we = 1; addr = 4'd8; din = 8'h55;

        #10;
        we = 0; addr = 4'd8;

        #10;
        addr = 4'd0;

        #10;
        $finish;
    end

endmodule
