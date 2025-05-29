# LCD自定义图案完整教程

## 📖 目录
1. [快速开始](#快速开始)
2. [基础概念](#基础概念)
3. [图案设计](#图案设计)
4. [时间配置](#时间配置)
5. [颜色配置](#颜色配置)
6. [添加新图案](#添加新图案)
7. [常见问题](#常见问题)
8. [示例代码](#示例代码)

---

## 🚀 快速开始

### 最简单的修改方式

1. **修改切换时间**：
   - 打开 `source/lcd_emoji_display.v`
   - 找到 `PATTERN_SWITCH_TIME` 参数
   - 修改数值：`29'd250000000` = 5秒，`29'd125000000` = 2.5秒

2. **修改图案内容**：
   - 在 `draw_pattern` 任务中修改字符位图
   - 保持坐标计算逻辑不变

---

## 🎯 基础概念

### LCD规格
- **分辨率**: 240x135像素
- **显示区域**: 有效区域根据图案大小调整
- **颜色深度**: 16位RGB565格式
- **控制器**: ST7789V

### 坐标系统
```
(0,0) -----------> X轴 (239)
  |
  |
  |
  ↓
Y轴 (134)
```

### 时钟系统
- **主时钟**: 50MHz
- **图案切换**: 基于主时钟计数
- **LCD刷新**: 异步控制

---

## 🎨 图案设计

### 支持的图案类型

1. **简单字符图案** (推荐新手)
   - 颜文字表情：^_^, T_T, O_O 等
   - ASCII艺术图案
   - 简单几何形状

2. **像素级图案** (高级)
   - 位图图像
   - 复杂图形
   - 自定义像素阵列

### 设计图案的步骤

#### 方法1：修改现有表情
```verilog
// 在 draw_pattern 任务中找到对应的 case
3'd0: begin // 开心表情 ^_^
    // 修改这里的字符定义
    if ((x >= 60 && x <= 65) && (y >= 50 && y <= 55)) display_data = 9'h1F0; // 左眼
    if ((x >= 85 && x <= 90) && (y >= 50 && y <= 55)) display_data = 9'h1F0; // 右眼
    // 添加更多特征...
end
```

#### 方法2：添加新图案类型
```verilog
3'd6: begin // 新图案：爱心
    // 爱心的像素定义
    if (((x-75)*(x-75) + (y-55)*(y-55) <= 100) ||  // 左半心
        ((x-85)*(x-85) + (y-55)*(y-55) <= 100))    // 右半心
        display_data = 9'h1F1; // 红色爱心
end
```

---

## ⏰ 时间配置

### 切换时间计算
```verilog
// 时间 = 计数值 / 时钟频率
// 50MHz时钟下：
parameter PATTERN_SWITCH_TIME = 29'd时间秒数 * 50000000;

// 常用时间设置：
29'd50000000    // 1秒
29'd125000000   // 2.5秒  
29'd250000000   // 5秒 (当前设置)
29'd500000000   // 10秒
29'd1000000000  // 20秒
```

### 修改切换逻辑
```verilog
// 在 always 块中修改计时逻辑
always @(posedge clk_50MHz or negedge rst_n) begin
    if (!rst_n) begin
        pattern_timer <= 29'd0;
        current_pattern <= 3'd0;
    end else begin
        if (pattern_timer >= PATTERN_SWITCH_TIME) begin
            pattern_timer <= 29'd0;
            current_pattern <= (current_pattern == 3'd5) ? 3'd0 : current_pattern + 1'd1;
            //                                    ^^^^ 这里是图案总数-1
        end else begin
            pattern_timer <= pattern_timer + 1'd1;
        end
    end
end
```

---

## 🌈 颜色配置

### RGB565颜色格式
```
15 14 13 12 11 | 10  9  8  7  6  5 |  4  3  2  1  0
   R(红色5位)   |    G(绿色6位)     |   B(蓝色5位)
```

### 常用颜色代码
```verilog
parameter BLACK   = 16'h0000;  // 黑色
parameter WHITE   = 16'hFFFF;  // 白色  
parameter RED     = 16'hF800;  // 红色
parameter GREEN   = 16'h07E0;  // 绿色
parameter BLUE    = 16'h001F;  // 蓝色
parameter YELLOW  = 16'hFFE0;  // 黄色
parameter CYAN    = 16'h07FF;  // 青色
parameter MAGENTA = 16'hF81F;  // 洋红
```

### 在图案中使用颜色
```verilog
3'd0: begin // 彩色表情
    if ((x >= 60 && x <= 65) && (y >= 50 && y <= 55)) 
        display_data = {1'b1, RED[15:8]};      // 红色左眼
    if ((x >= 85 && x <= 90) && (y >= 50 && y <= 55)) 
        display_data = {1'b1, BLUE[15:8]};     // 蓝色右眼
    if ((x >= 70 && x <= 80) && (y >= 70 && y <= 75)) 
        display_data = {1'b1, GREEN[15:8]};    // 绿色嘴巴
end
```

---

## ➕ 添加新图案

### 步骤1：增加图案数量
```verilog
// 修改图案切换逻辑
current_pattern <= (current_pattern == 3'd6) ? 3'd0 : current_pattern + 1'd1;
//                                    ^^^^ 改为新的最大值
```

### 步骤2：添加新的case分支
```verilog
task draw_pattern;
    input [7:0] x, y;
    input [2:0] pattern_id;
    begin
        display_data = 9'h000; // 默认黑色背景
        
        case (pattern_id)
            // ...现有图案...
            
            3'd6: begin // 新图案：笑脸
                // 脸部轮廓（圆形）
                if ((x-80)*(x-80) + (y-67)*(y-67) <= 1600) begin
                    display_data = {1'b1, YELLOW[15:8]}; // 黄色脸部
                    
                    // 眼睛
                    if (((x-70)*(x-70) + (y-60)*(y-60) <= 25) ||  // 左眼
                        ((x-90)*(x-90) + (y-60)*(y-60) <= 25))    // 右眼
                        display_data = {1'b1, BLACK[15:8]};
                    
                    // 嘴巴（弧形）
                    if ((y >= 75) && (y <= 80) && 
                        (x >= 70) && (x <= 90) && 
                        ((x-80)*(x-80) + (y-75)*(y-75) >= 64))
                        display_data = {1'b1, BLACK[15:8]};
                end
            end
            
            3'd7: begin // 新图案：星星
                // 五角星的简化版本
                if (((x >= 75 && x <= 85) && (y >= 50 && y <= 80)) ||  // 垂直线
                    ((x >= 60 && x <= 100) && (y >= 65 && y <= 70)))   // 水平线
                    display_data = {1'b1, CYAN[15:8]};
            end
            
            default: display_data = 9'h000; // 默认黑屏
        endcase
    end
endtask
```

### 步骤3：更新LED指示
```verilog
// 如果图案数量超过8个，需要增加LED位宽
output wire [3:0] pattern_id_inv  // 支持16个图案
```

---

## ❓ 常见问题

### Q1: 图案显示不完整或偏移
**A**: 检查坐标范围是否在LCD显示区域内(0-239, 0-134)

### Q2: 切换时间不准确  
**A**: 确认时钟频率，重新计算PATTERN_SWITCH_TIME参数

### Q3: 颜色显示异常
**A**: 检查RGB565格式是否正确，注意高低字节顺序

### Q4: 编译错误
**A**: 检查语法，确保所有case分支都有对应的end

### Q5: LCD不显示
**A**: 检查ballplayer.qsf中TOP_LEVEL_ENTITY设置为ballplayer_top_test

---

## 📝 示例代码

### 完整的自定义图案模块模板
```verilog
module my_custom_display (
    input wire          clk_50MHz,
    input wire          rst_n,
    
    // LCD接口
    output wire         lcd_rst,
    output wire         lcd_blk, 
    output wire         lcd_dc,
    output wire         lcd_sclk,
    output wire         lcd_mosi,
    output wire         lcd_cs,
    
    // 状态指示
    output wire [2:0]   pattern_id_inv
);

// 参数定义
parameter PATTERN_SWITCH_TIME = 29'd150000000; // 3秒切换
parameter TOTAL_PATTERNS = 3'd4; // 总图案数

// 内部信号
reg [28:0] pattern_timer;
reg [2:0] current_pattern;
reg [17:0] pixel_counter;
reg [8:0] display_data;

// 颜色定义
parameter BLACK   = 16'h0000;
parameter WHITE   = 16'hFFFF;
parameter RED     = 16'hF800;
parameter GREEN   = 16'h07E0;
parameter BLUE    = 16'h001F;

// 图案切换逻辑
always @(posedge clk_50MHz or negedge rst_n) begin
    if (!rst_n) begin
        pattern_timer <= 29'd0;
        current_pattern <= 3'd0;
    end else begin
        if (pattern_timer >= PATTERN_SWITCH_TIME) begin
            pattern_timer <= 29'd0;
            current_pattern <= (current_pattern == TOTAL_PATTERNS-1) ? 3'd0 : current_pattern + 1'd1;
        end else begin
            pattern_timer <= pattern_timer + 1'd1;
        end
    end
end

// 图案绘制任务
task draw_my_pattern;
    input [7:0] x, y;
    input [2:0] pattern_id;
    begin
        display_data = 9'h000; // 默认背景
        
        case (pattern_id)
            3'd0: begin // 你的第一个图案
                // 在这里添加图案代码
            end
            
            3'd1: begin // 你的第二个图案
                // 在这里添加图案代码  
            end
            
            // 添加更多图案...
            
            default: display_data = 9'h000;
        endcase
    end
endtask

// LED输出
assign pattern_id_inv = ~current_pattern;

// 其他必要的LCD控制逻辑...
// (参考lcd_emoji_display.v的完整实现)

endmodule
```

---

## 🔧 高级技巧

### 1. 动态图案效果
```verilog
// 添加动画计数器
reg [7:0] animation_counter;

// 在主时钟中更新动画
always @(posedge clk_50MHz) begin
    animation_counter <= animation_counter + 1'd1;
end

// 在图案中使用动画效果
3'd0: begin // 闪烁星星
    if (animation_counter[7]) // 每128个时钟周期闪烁
        display_data = {1'b1, YELLOW[15:8]};
    else
        display_data = 9'h000;
end
```

### 2. 复杂图形算法
```verilog
// 圆形绘制
wire [7:0] center_x = 80;
wire [7:0] center_y = 67;
wire [7:0] radius = 30;
wire [15:0] distance_sq = (x-center_x)*(x-center_x) + (y-center_y)*(y-center_y);

if (distance_sq <= radius*radius)
    display_data = {1'b1, GREEN[15:8]};
```

### 3. 图案组合
```verilog
// 多层图案叠加
3'd0: begin
    // 背景层
    display_data = {1'b1, BLUE[15:8]};
    
    // 前景层（覆盖背景）
    if ((x >= 70 && x <= 90) && (y >= 60 && y <= 75))
        display_data = {1'b1, WHITE[15:8]};
end
```

---

## 📁 文件说明

### 当前项目中的LCD模块
- `lcd_emoji_display.v` - 当前使用的颜文字表情模块 ⭐
- `lcd_cartoon_display_fixed.v` - 修复版卡通图案模块  
- `lcd_simple_patterns.v` - 简化版几何图案模块
- `lcd_contrast_test.v` - LCD颜色测试模块

### 推荐的开发流程
1. 先在 `lcd_emoji_display.v` 基础上修改
2. 测试成功后可以创建新的自定义模块
3. 在 `ballplayer_top_test.v` 中切换模块引用
4. 通过Quartus手动编译测试

---

**💡 提示**: 从简单的修改开始，逐步学习更复杂的图案设计。记住保存好每个工作版本！

**🎯 目标**: 通过本教程，您应该能够轻松创建和修改LCD显示图案，调整切换时间，并理解整个系统的工作原理。

**📞 支持**: 如有问题，请参考项目中的其他LCD模块作为示例。
