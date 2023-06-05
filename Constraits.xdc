create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { CLK }]

set_property IOSTANDARD LVCMOS33 [get_ports { CLK }]
set_property PACKAGE_PIN E3 [get_ports { CLK }]

set_property PACKAGE_PIN F4 [get_ports { ps2c }]
set_property IOSTANDARD LVCMOS33 [get_ports { ps2c }]

set_property PACKAGE_PIN B2 [get_ports { ps2d }]
set_property IOSTANDARD LVCMOS33 [get_ports { ps2d }]

set_property PACKAGE_PIN N17 [get_ports { RST }]
set_property IOSTANDARD LVCMOS33 [get_ports { RST }]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN A3} [get_ports {rgb[2]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN B4} [get_ports {rgb[2]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN C5} [get_ports {rgb[2]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN A4} [get_ports {rgb[2]}]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN C6} [get_ports {rgb[1]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN A5} [get_ports {rgb[1]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN B6} [get_ports {rgb[1]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN A6} [get_ports {rgb[1]}]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN B7} [get_ports {rgb[0]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN C7} [get_ports {rgb[0]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN D7} [get_ports {rgb[0]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN D8} [get_ports {rgb[0]}]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN B11} [get_ports {hsync}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN B12} [get_ports {vsync}]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J17} [get_ports {AN}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J18} [get_ports {AN[1]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T9} [get_ports {AN[2]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J14} [get_ports {AN[3]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN P14} [get_ports {AN[4]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T14} [get_ports {AN[5]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K2} [get_ports {AN[6]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN U13} [get_ports {AN[7]}]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T10} [get_ports {SEG[0]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN R10} [get_ports {SEG[1]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K16} [get_ports {SEG[2]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K13} [get_ports {SEG[3]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN P15} [get_ports {SEG[4]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T11} [get_ports {SEG[5]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L18} [get_ports {SEG[6]}]