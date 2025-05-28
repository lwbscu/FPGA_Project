# Quartus Prime 手动编译指南

## 项目状态
- **项目文件**: `ballplayer.qpf`
- **当前顶层模块**: `ballplayer_top_test` (LCD四色测试模式)
- **目标器件**: MAX10 10M08SAM153C8G
- **所有文件已准备就绪**: ✅

## 手动编译步骤

### 1. 打开项目
1. 启动 **Intel Quartus Prime Lite Edition**
2. 点击 **File → Open Project**
3. 浏览到 `d:\Quartus_Project\ballplayer\`
4. 选择 `ballplayer.qpf` 文件并打开

### 2. 验证项目设置
在Project Navigator中确认：
- **Device**: 10M08SAM153C8G
- **Top-Level Entity**: ballplayer_top_test
- **Family**: MAX 10

### 3. 执行编译流程
按以下顺序执行：

#### 步骤 3.1: Analysis & Synthesis
- 菜单: **Processing → Start → Start Analysis & Synthesis**
- 或快捷键: **Ctrl+K**
- 等待完成，检查Messages窗口是否有错误

#### 步骤 3.2: Fitter (Place & Route)
- 菜单: **Processing → Start → Start Fitter (Place & Route)**
- 或快捷键: **Ctrl+P**
- 等待完成，检查资源使用情况

#### 步骤 3.3: Assembler (Generate Programming Files)
- 菜单: **Processing → Start → Start Assembler (Generate Programming Files)**
- 或快捷键: **Ctrl+L**
- 生成 `.sof` 编程文件

### 4. 编程文件输出
编译成功后，编程文件位置：
```
d:\Quartus_Project\ballplayer\output_files\ballplayer.sof
```

## 预期测试结果

### LCD测试模式说明
当前配置为LCD四色条纹测试：
- **红色条纹** (RGB: 0xF800)
- **绿色条纹** (RGB: 0x07E0) 
- **蓝色条纹** (RGB: 0x001F)
- **白色条纹** (RGB: 0xFFFF)

### LED指示说明
- **LED[0]**: LCD初始化状态 (亮=完成)
- **LED[1]**: LCD显示活动状态 (闪烁=正常)
- **LED[2]**: PLL锁定状态 (亮=锁定)
- **LED[3]**: 按键测试状态 (按键时亮)
- **LED[4-7]**: 系统保留

### 按键功能
- **KEY_UP**: 切换测试模式
- **KEY_DOWN**: 切换测试模式  
- **BALL_RELEASE**: 重置显示

## 故障排除

### 编译错误处理
如果出现编译错误：
1. 查看Messages窗口的详细错误信息
2. 检查是否所有源文件都正确加载
3. 确认引脚分配无冲突

### 硬件测试建议
1. **首次下载**: 使用USB Blaster下载.sof文件
2. **观察LED**: LED[2]应该亮起(PLL锁定)
3. **LCD显示**: 应显示四色垂直条纹
4. **按键测试**: 按键时LED[3]应该亮起

## 下一步操作

### 测试成功后
如果LCD显示正常四色条纹，可以：
1. 修改 `ballplayer.qsf` 中的顶层模块：
   ```
   set_global_assignment -name TOP_LEVEL_ENTITY ballplayer_top
   ```
2. 重新编译切换到游戏模式

### 测试失败时
如果LCD仍然白屏或无显示：
1. 检查LCD连接线
2. 确认电源供应
3. 测试不同的LCD初始化参数

---

**注意**: 本项目已经过多轮语法检查和错误修复，所有Verilog文件都应该能够正常编译。如果遇到新的编译错误，请保存编译报告以便进一步分析。
