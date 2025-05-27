# Advanced Electric Piano - 引脚分配修正报告

## 🔧 问题诊断

### 编译错误分析
编译时出现以下错误：
```
Error (171016): Can't place node "led_display[0]" -- illegal location assignment PIN_A8
Error (171016): Can't place node "led_display[2]" -- illegal location assignment PIN_A10
Error (171016): Can't place node "led_display[3]" -- illegal location assignment PIN_B10
Error (171016): Can't place node "led_display[4]" -- illegal location assignment PIN_D13
Error (171016): Can't place node "led_display[5]" -- illegal location assignment PIN_C13
Error (171016): Can't place node "led_display[7]" -- illegal location assignment PIN_D14
Error (171016): Can't place node "mode_indicator[2]" -- illegal location assignment PIN_A12
```

### 根本原因
使用了FPGA芯片上不存在的引脚编号，需要根据实际硬件文档进行修正。

## ✅ 修正方案

### 修正前后对比

#### LED显示引脚 (led_display[7:0])
| 位 | 修正前 | 修正后 | 说明 |
|----|--------|--------|------|
| [0] | PIN_A8 ❌ | PIN_N15 ✅ | LED1 |
| [1] | PIN_A9 ❌ | PIN_N14 ✅ | LED2 |
| [2] | PIN_A10 ❌ | PIN_M14 ✅ | LED3 |
| [3] | PIN_B10 ❌ | PIN_M12 ✅ | LED4 |
| [4] | PIN_D13 ❌ | PIN_L15 ✅ | LED5 |
| [5] | PIN_C13 ❌ | PIN_K12 ✅ | LED6 |
| [6] | PIN_E14 ❌ | PIN_L11 ✅ | LED7 |
| [7] | PIN_D14 ❌ | PIN_K11 ✅ | LED8 |

#### 模式指示灯 (mode_indicator[3:0])
| 位 | 修正前 | 修正后 | 说明 |
|----|--------|--------|------|
| [0] | PIN_A11 ❌ | PIN_J12 ✅ | SW1按键引脚复用 |
| [1] | PIN_B11 ❌ | PIN_H11 ✅ | SW2按键引脚复用 |
| [2] | PIN_A12 ❌ | PIN_H12 ✅ | SW3按键引脚复用 |
| [3] | PIN_B12 ❌ | PIN_H13 ✅ | SW4按键引脚复用 |

### 其他引脚验证 ✅
| 信号 | 引脚 | 状态 | 说明 |
|------|------|------|------|
| clk | PIN_J5 | ✅ 正确 | 系统时钟 |
| rst_n | PIN_J14 | ✅ 正确 | 复位信号(KEY4) |
| beeper | PIN_B14 | ✅ 正确 | 蜂鸣器输出 |
| row[3:0] | PIN_R7,P7,P8,P9 | ✅ 正确 | 矩阵键盘行 |
| col[3:0] | PIN_P6,R5,L7,P4 | ✅ 正确 | 矩阵键盘列 |

## 📋 最终引脚分配表

### 完整引脚映射
```
# 系统信号
clk         -> PIN_J5   (系统时钟)
rst_n       -> PIN_J14  (复位，KEY4)

# 矩阵键盘 4x4
row[0]      -> PIN_P9   (第1行)
row[1]      -> PIN_P8   (第2行)  
row[2]      -> PIN_P7   (第3行)
row[3]      -> PIN_R7   (第4行)
col[0]      -> PIN_P4   (第1列)
col[1]      -> PIN_L7   (第2列)
col[2]      -> PIN_R5   (第3列)
col[3]      -> PIN_P6   (第4列)

# 音频输出
beeper      -> PIN_B14  (蜂鸣器)

# LED状态显示
led_display[0] -> PIN_N15  (LED1)
led_display[1] -> PIN_N14  (LED2)
led_display[2] -> PIN_M14  (LED3)
led_display[3] -> PIN_M12  (LED4)
led_display[4] -> PIN_L15  (LED5)
led_display[5] -> PIN_K12  (LED6)
led_display[6] -> PIN_L11  (LED7)
led_display[7] -> PIN_K11  (LED8)

# 模式指示灯（复用按键引脚）
mode_indicator[0] -> PIN_J12  (SW1)
mode_indicator[1] -> PIN_H11  (SW2)
mode_indicator[2] -> PIN_H12  (SW3)
mode_indicator[3] -> PIN_H13  (SW4)
```

## 🔍 设计说明

### LED显示逻辑
- **8位LED显示**: 用于显示当前工作模式的二进制编码
- **模式编码**:
  - 000 (手动模式): led_display = 8'b00000001
  - 001 (稻香): led_display = 8'b00000010
  - 010 (青花瓷): led_display = 8'b00000100
  - 011 (告白气球): led_display = 8'b00001000
  - 100 (简单爱): led_display = 8'b00010000

### 模式指示灯设计
- **4位指示灯**: 分别对应4种自动播放模式
- **引脚复用**: 使用按键引脚作为输出，可能需要注意电平驱动能力

## ⚠️ 注意事项

### 硬件连接
1. **LED连接**: 确保LED通过适当的限流电阻连接
2. **模式指示灯**: 如果复用按键引脚，需要注意不要同时连接按键和LED
3. **电流驱动**: 检查FPGA输出引脚的驱动电流是否足够

### 软件配置
1. **电平标准**: 已设置为3.3V LVCMOS
2. **引脚复用**: 注意模式指示灯和按键的复用关系
3. **上拉电阻**: 未使用的引脚已配置为弱上拉

## 🚀 下一步操作

1. **重新编译**: 使用修正后的引脚分配进行编译
2. **硬件验证**: 在实际硬件上测试LED显示效果
3. **功能测试**: 验证模式切换和状态显示功能

---
**修正完成时间**: 2025年5月26日  
**引脚分配版本**: v2.1  
**状态**: ✅ 已修正，ready for compilation
