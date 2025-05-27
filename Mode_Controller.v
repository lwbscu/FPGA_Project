// Mode_Controller.v - 模式控制状态机
module Mode_Controller(
    input           clk,
    input           rst_n,
    input  [15:0]   key_pulse,
    input           encoder_press,
    output reg [7:0] func_enable,
    output reg [2:0] display_mode
);

// 菜单状态定义
localparam MENU_MAIN     = 0;
localparam MENU_FUNCTION = 1;
localparam MENU_DISPLAY  = 2;
localparam MENU_SETTINGS = 3;

reg [1:0] menu_state;
reg [3:0] menu_item;

// 功能控制
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        func_enable <= 8'hFF;  // 初始全部功能开启
        display_mode <= 0;
        menu_state <= MENU_MAIN;
        menu_item <= 0;
    end else begin
        // 按键1-8控制对应功能开关
        if(key_pulse[0]) func_enable[0] <= ~func_enable[0];  // FFT开关
        if(key_pulse[1]) func_enable[1] <= ~func_enable[1];  // SPL开关
        if(key_pulse[2]) func_enable[2] <= ~func_enable[2];  // 噪声记录开关
        if(key_pulse[3]) func_enable[3] <= ~func_enable[3];  // BPM开关
        if(key_pulse[4]) func_enable[4] <= ~func_enable[4];  // 灯光开关
        if(key_pulse[5]) func_enable[5] <= ~func_enable[5];  // 显示开关
        if(key_pulse[6]) func_enable[6] <= ~func_enable[6];  // 存储开关
        if(key_pulse[7]) func_enable[7] <= ~func_enable[7];  // WiFi开关
        
        // 按键9-12切换显示模式
        if(key_pulse[8])  display_mode <= 0;  // 频谱显示
        if(key_pulse[9])  display_mode <= 1;  // SPL显示
        if(key_pulse[10]) display_mode <= 2;  // BPM显示
        if(key_pulse[11]) display_mode <= 3;  // 混合显示
        
        // 编码器按键切换菜单
        if(encoder_press) begin
            menu_state <= menu_state + 1;
        end
    end
end

endmodule