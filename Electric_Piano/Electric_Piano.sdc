# SDC (Synopsys Design Constraints) 文件
# 电子琴项目时钟约束文件

# 主系统时钟约束 - 50MHz
create_clock -name "clk" -period 20.000ns [get_ports {clk}]

# 派生时钟约束 - LCD SPI时钟 (2MHz)
create_generated_clock -name "lcd_sclk" -source [get_ports {clk}] -divide_by 25 [get_ports {lcd_sclk}]

# 时钟组约束
set_clock_groups -asynchronous -group [get_clocks {clk}] -group [get_clocks {lcd_sclk}]

# 输入延迟约束
set_input_delay -clock [get_clocks {clk}] -max 2.0 [get_ports {rst_n}]
set_input_delay -clock [get_clocks {clk}] -min 0.5 [get_ports {rst_n}]

set_input_delay -clock [get_clocks {clk}] -max 2.0 [get_ports {key1}]
set_input_delay -clock [get_clocks {clk}] -min 0.5 [get_ports {key1}]

set_input_delay -clock [get_clocks {clk}] -max 2.0 [get_ports {col[*]}]
set_input_delay -clock [get_clocks {clk}] -min 0.5 [get_ports {col[*]}]

# 输出延迟约束
set_output_delay -clock [get_clocks {clk}] -max 2.0 [get_ports {row[*]}]
set_output_delay -clock [get_clocks {clk}] -min 0.5 [get_ports {row[*]}]

set_output_delay -clock [get_clocks {clk}] -max 2.0 [get_ports {beeper}]
set_output_delay -clock [get_clocks {clk}] -min 0.5 [get_ports {beeper}]

set_output_delay -clock [get_clocks {clk}] -max 2.0 [get_ports {led_display[*]}]
set_output_delay -clock [get_clocks {clk}] -min 0.5 [get_ports {led_display[*]}]

set_output_delay -clock [get_clocks {clk}] -max 2.0 [get_ports {mode_indicator[*]}]
set_output_delay -clock [get_clocks {clk}] -min 0.5 [get_ports {mode_indicator[*]}]

# LCD接口约束
set_output_delay -clock [get_clocks {lcd_sclk}] -max 1.0 [get_ports {lcd_mosi}]
set_output_delay -clock [get_clocks {lcd_sclk}] -min 0.2 [get_ports {lcd_mosi}]

set_output_delay -clock [get_clocks {clk}] -max 2.0 [get_ports {lcd_cs}]
set_output_delay -clock [get_clocks {clk}] -min 0.5 [get_ports {lcd_cs}]

set_output_delay -clock [get_clocks {clk}] -max 2.0 [get_ports {lcd_rst}]
set_output_delay -clock [get_clocks {clk}] -min 0.5 [get_ports {lcd_rst}]

set_output_delay -clock [get_clocks {clk}] -max 2.0 [get_ports {lcd_dc}]
set_output_delay -clock [get_clocks {clk}] -min 0.5 [get_ports {lcd_dc}]

set_output_delay -clock [get_clocks {clk}] -max 2.0 [get_ports {lcd_blk}]
set_output_delay -clock [get_clocks {clk}] -min 0.5 [get_ports {lcd_blk}]

# 虚假路径约束 - 异步复位
set_false_path -from [get_ports {rst_n}] -to [all_registers]

# 多周期路径约束 - LCD初始化可以允许多个时钟周期
set_multicycle_path -setup -to [get_ports {lcd_*}] 2
set_multicycle_path -hold -to [get_ports {lcd_*}] 1
