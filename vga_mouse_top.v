`timescale 1ns / 1ps

module vga_mouse_top(
    input wire CLK, RST,
    /*inout*/input wire ps2d, ps2c,
    output wire hsync, vsync,
    output wire [2:0] rgb,
    output wire AN,
    output wire [6:0] SEG
    );
    
wire [8:0] xm, ym;
wire [2:0] btnm;
wire m_done_tick;     

mouse mouse_top(
    .CLK(CLK),
    .RST(RST),
    .ps2d(ps2d),
    .ps2c(ps2c),
    .xm(xm),
    .ym(ym),
    .btnm(btnm),
    .m_done_tick(m_done_tick),
    .AN(AN),
    .SEG(SEG[6:0]));

vga_module vga_top(
    .clk(CLK),
    .xm(xm),
    .ym(ym),
    .btnm(btnm),
    .m_done_tick(m_done_tick),
    .hsync(hsync),
    .vsync(vsync),
    .rgb(rgb));
endmodule
