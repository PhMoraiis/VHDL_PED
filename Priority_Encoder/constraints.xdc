# Switches
set_property PACKAGE_PIN V17 [get_ports {p0}]
set_property PACKAGE_PIN V16 [get_ports {p1}]
set_property PACKAGE_PIN W16 [get_ports {p2}]
set_property PACKAGE_PIN W17 [get_ports {p3}]

# LEDs
set_property PACKAGE_PIN V14 [get_ports {x0}]
set_property PACKAGE_PIN U14 [get_ports {x1}]
set_property PACKAGE_PIN U15 [get_ports {int}]

# Definir padrões elétricos
set_property IOSTANDARD LVCMOS33 [get_ports *]