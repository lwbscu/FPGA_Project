// 自动生成的多图片ROM控制器
// 支持 5 张图片切换
// 图片尺寸: 240 x 160
// 颜色格式: 黑白(1位)
// 生成工具: image_processor.py

module multi_image_rom (
    input wire clk,
    input wire [2:0] image_sel,  // 图片选择信号 (0-4)
    input wire [12:0] addr,
    output reg [7:0] data
);

    wire [7:0] data_0;
    wire [7:0] data_1;
    wire [7:0] data_2;
    wire [7:0] data_3;
    wire [7:0] data_4;

    image_0_rom image_0_rom_inst (
        .clk(clk),
        .addr(addr),
        .data(data_0)
    );

    image_1_rom image_1_rom_inst (
        .clk(clk),
        .addr(addr),
        .data(data_1)
    );

    image_2_rom image_2_rom_inst (
        .clk(clk),
        .addr(addr),
        .data(data_2)
    );

    image_3_rom image_3_rom_inst (
        .clk(clk),
        .addr(addr),
        .data(data_3)
    );

    image_4_rom image_4_rom_inst (
        .clk(clk),
        .addr(addr),
        .data(data_4)
    );

    // 图片选择多路选择器
    always @(*) begin
        case (image_sel)
            3'd0: data = data_0;  // Angry.png
            3'd1: data = data_1;  // Angry.png
            3'd2: data = data_2;  // Begging.png
            3'd3: data = data_3;  // Begging.png
            3'd4: data = data_4;  // Clever.jpg
            default: data = data_0;  // 默认显示第一张图片
        endcase
    end

endmodule
