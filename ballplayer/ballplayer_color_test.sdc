# Create base clock for 12MHz input
create_clock -name {clk} -period 83.333 [get_ports {clk}]

# Create generated clock for PLL output (25MHz)
create_generated_clock -name {clk_25MHz} -source [get_ports {clk}] -divide_by 12 -multiply_by 25 [get_nets {pll_inst|altpll_component|auto_generated|wire_pll1_clk[1]}]

# Set clock groups to avoid timing analysis between unrelated clocks
set_clock_groups -asynchronous -group [get_clocks {clk}] -group [get_clocks {clk_25MHz}]

# Set input delays for external signals
set_input_delay -clock [get_clocks {clk}] -max 5.0 [get_ports {rst_n}]
set_input_delay -clock [get_clocks {clk}] -min 1.0 [get_ports {rst_n}]

# Set output delays for LCD signals
set_output_delay -clock [get_clocks {clk_25MHz}] -max 10.0 [get_ports {lcd_*}]
set_output_delay -clock [get_clocks {clk_25MHz}] -min 2.0 [get_ports {lcd_*}]

# Set output delays for LED signals
set_output_delay -clock [get_clocks {clk_25MHz}] -max 5.0 [get_ports {led[*]}]
set_output_delay -clock [get_clocks {clk_25MHz}] -min 1.0 [get_ports {led[*]}]

# Set false path for reset
set_false_path -from [get_ports {rst_n}] -to [all_registers]

# Set multicycle paths for slow signals (if needed)
# set_multicycle_path -setup -end 2 -from [get_clocks {clk_25MHz}] -to [get_registers {*display*}]
