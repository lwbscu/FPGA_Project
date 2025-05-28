# BallPlayer 项目快速启动指南

## 📋 项目清单

### ✅ 已完成的文件
```
ballplayer/
├── ballplayer.qpf                    # Quartus项目文件
├── ballplayer.qsf                    # 设置和引脚分配
├── README.md                         # 项目说明文档
└── source/
    ├── ballplayer_top.v              # 顶层模块
    ├── ballplayer_pll.v              # PLL时钟生成
    ├── jumping.v                     # 球运动控制
    ├── hand_control.v                # 手势控制
    ├── adjuster.v                    # 参数调节
    ├── adc081s101_driver.v           # ADC驱动
    ├── frequency_divider.v           # 频率分频器
    ├── debounce.v                    # 按键消抖
    ├── segment_display.v             # 数码管显示
    ├── rpr0521rs_driver.v           # 手势传感器驱动
    ├── lcd_display.v                # LCD显示控制
    ├── lcd_init.v                   # LCD初始化
    └── lcd_write.v                  # LCD写入操作
```

## 🚀 快速开始

### 1. 打开项目
1. 启动 Intel Quartus Prime
2. 打开项目文件: `d:\Quartus_Project\ballplayer\ballplayer.qpf`
3. 确认目标器件: `10M50DAF484C7G`

### 2. 验证配置
- ✅ 所有源文件已添加到项目
- ✅ 引脚分配已完成配置  
- ✅ PLL IP核已正确设置
- ✅ 时序约束已定义

### 3. 编译流程
```
Analysis & Synthesis  →  Fitter  →  Assembler  →  TimeQuest
```

### 4. 下载配置
- 生成 `.sof` 文件
- 通过USB Blaster下载到MAX10开发板

## 🔧 硬件连接

### 必需外设
| 外设 | 接口 | 说明 |
|------|------|------|
| 16x2 LCD | 并行 | 游戏显示界面 |
| RPR0521RS传感器 | I2C | 手势检测 |
| ADC081S101 | SPI | 模拟量采集 |
| 双7段数码管 | 并行 | 分数显示 |
| 按键x4 | GPIO | 参数调节 |

### 引脚连接图
详见 `README.md` 中的引脚分配表

## 🎮 游戏说明

### 操作方式
1. **手势控制**: 在RPR0521RS传感器前挥手控制挡板左右移动
2. **参数调节**: 使用4个按键调节游戏参数
   - UP/DOWN: 调节弹性系数
   - LEFT/RIGHT: 调节重力系数

### 游戏规则
- 球从上方落下，玩家控制底部挡板接球
- 成功接球得分+1
- 球落到底部游戏结束
- 分数显示在LCD右上角和7段数码管

## ⚡ 性能特性

### 系统时钟
- 主时钟: 50MHz
- ADC时钟: 24MHz  
- 输入时钟: 12MHz

### 刷新率
- 游戏逻辑: 60 FPS
- LCD显示: 20 Hz
- 传感器采样: 50 Hz

## 🐛 调试提示

### 常见问题解决
1. **编译错误**: 检查所有源文件是否正确添加
2. **引脚错误**: 确认开发板型号和引脚定义
3. **时序错误**: 检查PLL配置和时钟约束
4. **功能异常**: 使用SignalTap II在线调试

### 验证步骤
1. ✅ 语法检查通过 (已完成)
2. ⏳ 编译无错误
3. ⏳ 时序分析通过
4. ⏳ 硬件下载成功
5. ⏳ 功能测试正常

## 🔧 最新修复 (2025-05-28)

### ✅ 已修复的编译错误
- **PLL模块错误**: 修复了 `ballplayer_pll.v` 中端口重复声明的问题
- **器件配置**: 更新为正确的MAX10器件型号 `10M50DAF484C7G`
- **性能优化**: 添加 `NUM_PARALLEL_PROCESSORS` 设置消除编译警告

### 🚀 编译状态
- ✅ 所有13个Verilog文件语法检查通过
- ✅ 项目配置文件更新完成
- ✅ 引脚分配已配置
- 🔄 **可以重新运行编译！**

## 📞 技术支持

### 文档参考
- Intel Quartus Prime用户手册
- MAX10 FPGA数据手册
- 各传感器数据手册

### 调试工具
- SignalTap II Logic Analyzer
- ModelSim仿真器
- TimeQuest时序分析器

---

**状态**: 🟢 Ready for Compilation  
**最后更新**: 2025年5月28日
