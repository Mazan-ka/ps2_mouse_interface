`timescale 1ns / 1ps

module vga_module(
  input clk,
  input [8:0] xm, ym,
  input [2:0] btnm,
  input m_done_tick,
  output wire hsync, vsync,
  output [2:0] rgb
);

wire display_on;
wire [10:0] hpos, vpos;
reg clkNew = 0;
reg [2:0] rgb_temp = 3'b000; 
reg [2:0] rgb_temp_next = 3'b000;

initial clkNew=0;
  
always@(posedge clk) 
begin
    clkNew=~clkNew;
end

hv_sync_gen hvsync_gen(
    .clk(clkNew),
    .hsync(hsync),
    .vsync(vsync),
    .display_on(display_on),
    .hpos(hpos),
    .vpos(vpos)
);

always @(posedge clkNew) 
begin
    if (display_on) 
    begin
        if ((hpos > 130) && (hpos < 150) && (vpos > 130) && (vpos < 150)) 
        begin
            case (btnm)
                3'b001:
                    rgb_temp_next <= 3'b010; //green left
                3'b010:
                    rgb_temp_next <= 3'b100; //red right
                3'b100:
                    rgb_temp_next <= 3'b000; //blue middle
                default:
                    rgb_temp_next <= 3'b111; //yellow?
            endcase
            rgb_temp <= rgb_temp_next;
        end 
        else rgb_temp <= 3'b001;
    end
end
    
assign rgb = rgb_temp;

endmodule
