# CLK_100M
set_property PACKAGE_PIN Y9 [get_ports clk]
set_property IOSTANDARD LVCMOS25 [get_ports clk]

# rst
set_property PACKAGE_PIN T18 [get_ports rst]
set_property IOSTANDARD LVCMOS25 [get_ports rst]

# 8 LEDS
set_property IOSTANDARD LVCMOS25 [get_ports {leds[*]}]
set_property PACKAGE_PIN U14 [get_ports leds[0]]
set_property PACKAGE_PIN U19 [get_ports leds[1]]
set_property PACKAGE_PIN W22 [get_ports leds[2]]
set_property PACKAGE_PIN V22 [get_ports leds[3]]
set_property PACKAGE_PIN U21 [get_ports leds[4]]
set_property PACKAGE_PIN U22 [get_ports leds[5]]
set_property PACKAGE_PIN T21 [get_ports leds[6]]
set_property PACKAGE_PIN T22 [get_ports leds[7]]

# ButtonA
set_property IOSTANDARD LVCMOS25 [get_ports btn[*]]
set_property PACKAGE_PIN P16 [get_ports btn[0]]
set_property PACKAGE_PIN N15 [get_ports btn[1]]
set_property PACKAGE_PIN R18 [get_ports btn[2]]
