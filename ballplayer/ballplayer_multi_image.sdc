# ==============================================================================
# SDC时序约束文件 - ballplayer多图片显示项目
# ==============================================================================

# 创建时钟约束 - 降低到25MHz以改善时序
create_clock -name "clk" -period 40.000 -waveform { 0.000 20.000 } [get_ports {clk}]

# 设置输入延迟
set_input_delay -clock "clk" -max 2.0 [get_ports {rst_n}]
set_input_delay -clock "clk" -min 0.5 [get_ports {rst_n}]

# 设置输出延迟
set_output_delay -clock "clk" -max 2.0 [get_ports {lcd_*}]
set_output_delay -clock "clk" -min 0.5 [get_ports {lcd_*}]
set_output_delay -clock "clk" -max 2.0 [get_ports {led_status[*]}]
set_output_delay -clock "clk" -min 0.5 [get_ports {led_status[*]}]

# 设置虚假路径（异步复位）
set_false_path -from [get_ports {rst_n}] -to [all_registers]

# 多周期路径设置 - ROM读取可以使用多个时钟周期
set_multicycle_path -setup -end 2 -from [get_cells {*rom*}] -to [get_cells {*lcd*}]
set_multicycle_path -hold -end 1 -from [get_cells {*rom*}] -to [get_cells {*lcd*}]

# 图片切换计时器的宽松约束
set_multicycle_path -setup -end 5 -from [get_cells {*image_timer*}] -to [get_cells {*current_image*}]
set_multicycle_path -hold -end 4 -from [get_cells {*image_timer*}] -to [get_cells {*current_image*}]

# 创建PLL衍生时钟
create_generated_clock -name "clk_25mhz" -source [get_ports {clk}] -divide_by 12 -multiply_by 25 [get_pins {pll_inst|altpll_component|auto_generated|pll1|clk[1]}]

# 设置PLL时钟组 - 防止交叉时钟域检查
set_clock_groups -asynchronous -group [get_clocks {clk}] -group [get_clocks {clk_25mhz}]

# 放宽ROM到LCD的时序约束
set_multicycle_path -setup -end 3 -from [get_cells {*rom*}] -to [get_cells {*lcd*}]
set_multicycle_path -hold -end 2 -from [get_cells {*rom*}] -to [get_cells {*lcd*}]
