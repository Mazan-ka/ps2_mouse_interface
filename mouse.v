`timescale 1ns / 1ps

module mouse(
    input wire CLK, RST, 
    inout wire ps2d, ps2c, 
    output reg AN,
    output reg [6:0] SEG,
    output wire [8:0] xm, ym, 
    output wire [2:0] btnm,
    output reg m_done_tick
);

// constant declaration 
localparam STRM = 8'hf4; // stream command F4 

// symbolic state declaration 
localparam [2:0]
    init1 = 3'b000, 
    init2 = 3'b001, 
    init3 = 3'b010, 
    pack1 = 3'b011, 
    pack2 = 3'b100, 
    pack3 = 3'b101, 
    done  = 3'b110; 
 
 
//temp fignya
// reg [8:0] xm, ym;
// reg m_done_tick;
// reg [2:0] btnm = 0;
 initial begin
    SEG [6:0] = 7'b1111111;
  end
 
// signal declaration 
reg [2:0] state_reg , state_next; 
wire [7:0] rx_data; 
reg wr_ps2; 
wire rx_done_tick , tx_done_tick; 
reg [8:0] x_reg, y_reg, x_next, y_next; 
reg [2:0] btn_next;
reg [2:0] btn_reg;

initial begin
btn_next = 0;
btn_reg = 0;
end

// body 
// instantiation 
ps2_rxtx ps2_unit(
    .clk(CLK), 
    .reset(RST), 
    .wr_ps2(wr_ps2), 
    .din(STRM),
    .dout(rx_data), 
    .ps2d(ps2d), 
    .ps2c(ps2c), 
    .rx_done_tick(rx_done_tick), 
    .tx_done_tick(tx_done_tick)); 

// body 
// FSMD state and data registers 
always @(posedge CLK , posedge RST) 
if (RST) begin 
    state_reg <= init1; 
    x_reg <= 0; 
    y_reg <= 0; 
    btn_reg <= 0; 
end else begin 
    state_reg <= state_next; 
    x_reg <= x_next; 
    y_reg <= y_next; 
    btn_reg <= btn_next; 
end 

// FSMD next-state logic 
always @* 
begin 
    state_next = state_reg; 
    wr_ps2 = 1'b0; 
    m_done_tick = 1'b0; 
    x_next = x_reg; 
    y_next = y_reg ; 
    btn_next = btn_reg; 
    case (state_reg) 
        init1: 
        begin 
            wr_ps2 = 1'b1; 
            state_next = init2; 
        end 
        init2: // wait for send to complete 
            if (tx_done_tick) 
                state_next = init3; 
        init3: // wait for acknowledge packet 
            if (rx_done_tick) 
                // if (rx_data == 8'hfe) // не уверен что будет работать, но по логике норм (проверка ответа мышки)
                state_next = pack1;               
        pack1: // wait for 1st data packet 
            if (rx_done_tick) begin 
                state_next = pack2;
                y_next[8] = rx_data[5]; 
                x_next[8] = rx_data[4]; 
                btn_next = rx_data[2:0]; 
            end 
        pack2: // wait for 2nd data packet 
            if (rx_done_tick) begin 
                state_next = pack3; 
                x_next [7:0] = rx_data; 
            end 
        pack3: // wait for 3rd data packet 
            if (rx_done_tick) begin 
                state_next = done; 
                y_next [7:0] = rx_data; 
            end 
        done: 
        begin 
            m_done_tick = 1'b1; 
            state_next = pack1; 
        end 
        endcase 
end 

always @* begin
    if (btn_reg == 3'b001) begin
        AN = 1;
        SEG [6:0] = 7'b0000001;
        end

    if (btn_reg == 3'b100) begin
        AN = 1;
        SEG [6:0] = 7'b1000000;
        end
end

//output
assign xm = x_reg; 
assign ym = y_reg; 
assign btnm = btn_reg; 


endmodule




