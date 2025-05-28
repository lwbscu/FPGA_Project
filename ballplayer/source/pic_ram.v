// ============================================================================
// Module: pic_ram
// Description: 图片RAM模块 - 存储简单的白色背景和球的图像数据
// Author: GitHub Copilot
// Date: 2025-05-28
// ============================================================================

`timescale 1 ns / 100 ps

module pic_ram (
    input wire [8:0] address,
    output reg [239:0] q,
    input wire [8:0] offset
);
    
    // 创建简单的白色背景和球的图案
    always @ (*) begin
        case(address - offset)
            // 球的图案（简单的圆形）
            9'd1:   q = 240'h060; // 球的顶部
            9'd2:   q = 240'h1F8; 
            9'd3:   q = 240'h3FC;
            9'd4:   q = 240'h3FC;
            9'd5:   q = 240'h7FE; // 球的中部（最宽）
            9'd6:   q = 240'h7FE;
            9'd7:   q = 240'h3FC;
            9'd8:   q = 240'h3FC;
            9'd9:   q = 240'h1F8;
            9'd10:  q = 240'h060; // 球的底部
            
            // 为了测试显示，添加更多图案数据
            9'd11:  q = 240'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF; // 全白线条
            9'd12:  q = 240'h0000000000000000000000000000000000000000000000000000000000; // 全黑线条
            9'd13:  q = 240'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF; // 全白线条
            
            // 默认为白色背景（而不是黑色）
            default: q = 240'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF; // 白色背景
        endcase
    end

endmodule
