module top_module (
  input clk,
  input rst,
  input wire [7:0] mouse_data,
  output reg [7:0] vga_r,
  output reg [7:0] vga_g,
  output reg [7:0] vga_b,
  output reg vga_hs,
  output reg vga_vs
);

  wire [1:0] mouse_clk;
  wire mouse_data_valid;
  wire [3:0] mouse_x;
  wire [3:0] mouse_y;
  wire left_button;
  wire right_button;

  ps2_controller ps2_controller_inst (
    .clk(clk),
    .rst(rst),
    .data_in(mouse_data),
    .clk_out(mouse_clk),
    .data_out_valid(mouse_data_valid),
    .x(mouse_x),
    .y(mouse_y),
    .left_button(left_button),
    .right_button(right_button)
  );

  vga_controller vga_controller_inst (
    .clk(clk),
    .rst(rst),
    .h_sync(vga_hs),
    .v_sync(vga_vs),
    .r(vga_r),
    .g(vga_g),
    .b(vga_b)
  );

  mouse_controller mouse_controller_inst (
    .clk(mouse_clk),
    .x(mouse_x),
    .y(mouse_y),
    .left_button(left_button),
    .right_button(right_button),
    .vga_h_cnt(vga_controller_inst.h_cnt),
    .vga_v_cnt(vga_controller_inst.v_cnt),
    .vga_h_sync(vga_controller_inst.h_sync),
    .vga_v_sync(vga_controller_inst.v_sync),
    .vga_r(vga_controller_inst.r),
    .vga_g(vga_controller_inst.g),
    .vga_b(vga_controller_inst.b)
  );

endmodule


/*Этот модуль объединяет в себе три модуля:
ps2_controller_inst - модуль для работы с протоколом PS2 и получения данных от мыши;
vga_controller_inst - модуль для работы с VGA;
mouse_controller_inst - модуль, который получает данные от мыши и передает их в vga_controller_inst, чтобы отобразить рисунок на экране.
Модуль верхнего уровня содержит входы для тактового сигнала и сброса, а также выходы для цветовых каналов и сигналов синхронизации VGA. Он также соединяет соответствующие входы и выходы модулей, которые он объединяет.
*/


























