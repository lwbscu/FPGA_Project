# 只保留最基本的时钟约束
create_clock -name clk -period 83.333 [get_ports {clk}]