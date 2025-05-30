// ============================================================================
// Module: multi_image_rom_240x160
// Description: 多图片ROM模块 - 支持5张240x160图片的循环显示
// Author: GitHub Copilot
// Date: 2025-05-30
// ============================================================================

module multi_image_rom_240x160 (
    input wire clk,
    input wire [2:0] image_id,      // 图片ID (0-4)
    input wire [14:0] addr,         // 地址 (240*160/8 = 4800字节，需要13位，这里用15位以防万一)
    output reg [7:0] data
);

// 各个图片ROM的数据输出
wire [7:0] image_0_data, image_1_data, image_2_data, image_3_data, image_4_data;

// 实例化各个图片ROM模块
image_0_rom image_0_inst (
    .clk(clk),
    .addr(addr[12:0]),      // 使用13位地址 (4800字节)
    .data(image_0_data)
);

image_1_rom image_1_inst (
    .clk(clk),
    .addr(addr[12:0]),
    .data(image_1_data)
);

image_2_rom image_2_inst (
    .clk(clk),
    .addr(addr[12:0]),
    .data(image_2_data)
);

image_3_rom image_3_inst (
    .clk(clk),
    .addr(addr[12:0]),
    .data(image_3_data)
);

image_4_rom image_4_inst (
    .clk(clk),
    .addr(addr[12:0]),
    .data(image_4_data)
);

// 根据图片ID选择输出数据
always @(posedge clk) begin
    case (image_id)
        3'd0: data <= image_0_data;
        3'd1: data <= image_1_data;
        3'd2: data <= image_2_data;
        3'd3: data <= image_3_data;
        3'd4: data <= image_4_data;
        default: data <= image_0_data;
    endcase
end

endmodule