 module async_fifo #(
parameter DATA_WIDTH = 8,
parameter ADDR_WIDTH = 4
)
(
    input clk_wr,
    input rst_wr,
    input clk_rd,
    input rst_rd,

    input wr_en,
    input rd_en,

    input [DATA_WIDTH-1:0]wr_data,

    output reg [DATA_WIDTH-1:0] rd_data,
    output full,
    output empty
);

localparam DEPTH = 1 << ADDR_WIDTH;

// Memory

reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

// Binary and Gray Pointers

reg [ADDR_WIDTH:0] wr_ptr_bin;
reg [ADDR_WIDTH:0] rd_ptr_bin;

reg [ADDR_WIDTH:0] wr_ptr_gray;
reg [ADDR_WIDTH:0] rd_ptr_gray;


// Synchronizers

reg [ADDR_WIDTH:0] rd_gray_sync1, rd_gray_sync2;
reg [ADDR_WIDTH:0] wr_gray_sync1, wr_gray_sync2;

// Read pointer synchronized into write clock
always @(posedge clk_wr or posedge rst_wr)
begin
    if(rst_wr)
    begin
        rd_gray_sync1 <= 0;
        rd_gray_sync2 <= 0;
    end
    else
    begin
        rd_gray_sync1 <= rd_ptr_gray;
        rd_gray_sync2 <= rd_gray_sync1;
    end
end

// Write pointer synchronized into read clock
always @(posedge clk_rd or posedge rst_rd)
begin
    if(rst_rd)
    begin
        wr_gray_sync1 <= 0;
        wr_gray_sync2 <= 0;
    end
    else
    begin
        wr_gray_sync1 <= wr_ptr_gray;
        wr_gray_sync2 <= wr_gray_sync1;
    end
end


// Next Pointer Logic

wire [ADDR_WIDTH:0] wr_bin_next;
wire [ADDR_WIDTH:0] rd_bin_next;

wire [ADDR_WIDTH:0] wr_gray_next;
wire [ADDR_WIDTH:0] rd_gray_next;

assign wr_bin_next = wr_ptr_bin + (wr_en && !full);
assign rd_bin_next = rd_ptr_bin + (rd_en && !empty);

assign wr_gray_next = (wr_bin_next >> 1) ^ wr_bin_next;
assign rd_gray_next = (rd_bin_next >> 1) ^ rd_bin_next;


// Full Logic

assign full =
    (wr_gray_next ==
    {~rd_gray_sync2[ADDR_WIDTH:ADDR_WIDTH-1],
      rd_gray_sync2[ADDR_WIDTH-2:0]});


// Empty Logic

assign empty = (rd_gray_next == wr_gray_sync2);

// Write Logic


always @(posedge clk_wr or posedge rst_wr)
begin
    if(rst_wr)
    begin
        wr_ptr_bin  <= 0;
        wr_ptr_gray <= 0;
    end
    else
    begin
        if(wr_en && !full)
        begin
            mem[wr_ptr_bin[ADDR_WIDTH-1:0]] <= wr_data;
            wr_ptr_bin  <= wr_bin_next;
            wr_ptr_gray <= wr_gray_next;
        end
    end
end



// Read Logic
always @(posedge clk_rd or posedge rst_rd)
begin
    if(rst_rd)
    begin
        rd_ptr_bin  <= 0;
        rd_ptr_gray <= 0;
        rd_data     <= 0;
    end
    else
    begin
        if(rd_en && !empty)
        begin
            rd_data <= mem[rd_ptr_bin[ADDR_WIDTH-1:0]];
            rd_ptr_bin  <= rd_bin_next;
            rd_ptr_gray <= rd_gray_next;
        end
    end
end

endmodule