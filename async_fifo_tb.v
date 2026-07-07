module async_fifo_tb;

parameter DATA_WIDTH = 8;
parameter ADDR_WIDTH = 4;

reg clk_wr;
reg clk_rd;
reg rst_wr;
reg rst_rd;
reg wr_en;
reg rd_en;
reg [DATA_WIDTH-1:0] wr_data;

wire [DATA_WIDTH-1:0] rd_data;
wire full;
wire empty;


async_fifo #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH)
) dut (
    .clk_wr(clk_wr),
    .rst_wr(rst_wr),
    .clk_rd(clk_rd),
    .rst_rd(rst_rd),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .wr_data(wr_data),
    .rd_data(rd_data),
    .full(full),
    .empty(empty)
);

// Write Clock (10ns)

always #5 clk_wr = ~clk_wr;

// Read Clock (14ns)

always #7 clk_rd = ~clk_rd;


// Stimulus

integer i=16;

initial
begin

    clk_wr = 0;
    clk_rd = 0;
    rst_wr = 1;
    rst_rd = 1;
    wr_en  = 0;
    rd_en  = 0;
    wr_data = 0;

    #20;

    rst_wr = 0;
    rst_rd = 0;

    
    // Write 16 Data
    
    for(i=0;i<16;i=i+1)
    begin
        @(posedge clk_wr);

        if(!full)
        begin
            wr_en = 1;
            wr_data = i + 8'h10;
        end
    end

    @(posedge clk_wr);
    wr_en = 0;

    #30;

    
    // Read 16 Data
    
    for(i=0;i<16;i=i+1)
    begin
        @(posedge clk_rd);

        if(!empty)
            rd_en = 1;
    end

    @(posedge clk_rd);
    rd_en = 0;

    #50;

    $finish;

end

// Monitor
initial
begin
    $monitor("Time=%0t WR_EN=%b RD_EN=%b WR_DATA=%h RD_DATA=%h FULL=%b EMPTY=%b",
              $time, wr_en,rd_en,wr_data,rd_data,full,empty);
end

endmodule