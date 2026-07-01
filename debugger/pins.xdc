set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10 -name sys_clk [get_ports clk]

set_property PACKAGE_PIN R15 [get_ports input]
set_property IOSTANDARD LVCMOS33 [get_ports input]

set_property PACKAGE_PIN P15 [get_ports output]
set_property IOSTANDARD LVCMOS33 [get_ports output]

