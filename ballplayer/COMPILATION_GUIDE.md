# Quartus Prime 编译指南 - ballplayer项目

## 🚀 快速编译步骤

### 1. 打开项目
```
- 启动Quartus Prime 18.1
- File → Open Project → 选择 ballplayer.qpf
- 确认顶层实体为：ballplayer_top
```

### 2. 执行编译
```
Processing → Start Compilation
或者按快捷键 Ctrl+L
```

### 3. 分步编译（可选）
如果需要分步编译：
```
1. Processing → Start → Analysis & Synthesis
2. Processing → Start → Fitter (Place & Route)  
3. Processing → Start → Assembler
```

## ✅ 预期编译结果

### 成功指标：
- ✅ Analysis & Synthesis: 0 errors
- ✅ Fitter: 0 errors (可能有时序警告)
- ✅ Assembler: 0 errors
- ✅ 生成文件: `output_files/ballplayer.sof`

### 可能的警告（正常）：
- ⚠️ 时序约束警告（可忽略）
- ⚠️ 未使用的引脚警告（正常）
- ⚠️ 逻辑优化信息（正常）

## 📁 重要文件位置

### 编译输出：
- `output_files/ballplayer.sof` - FPGA编程文件
- `output_files/ballplayer.map.rpt` - 综合报告
- `output_files/ballplayer.fit.rpt` - 布线报告

### 源文件：
- `source/ballplayer_top.v` - 顶层模块
- `ballplayer.qsf` - 引脚配置和项目设置

## 🔧 如果编译失败

### 检查清单：
1. **确认设备型号**: 10M08SAM153C8G
2. **检查源文件**: 确保所有.v文件在source/目录
3. **验证引脚配置**: 检查ballplayer.qsf是否完整
4. **清理项目**: Project → Clean Project

### 常见问题：
- **引脚冲突**: 检查.qsf文件中的引脚分配
- **语法错误**: 查看Messages窗口中的错误详情
- **资源不足**: MAX10资源够用，应该不会出现

## 🎯 下载到FPGA

### 编程步骤：
```
1. Tools → Programmer
2. Hardware Setup → 选择USB-Blaster
3. Add File → 选择 ballplayer.sof
4. 勾选 Program/Configure
5. 点击 Start 开始编程
```

### 验证硬件：
- LED7应该亮起（系统正常）
- LED1应该亮起（LCD初始化完成）  
- LED2应该每0.8秒闪烁（传感器更新）
- LCD应该显示白色背景和游戏内容

## 📞 技术支持

如果遇到编译问题：
1. 查看Quartus Messages窗口
2. 检查Compilation Report
3. 参考 PROJECT_STATUS_FINAL.md 了解项目当前状态

**项目已准备好编译！** 🚀
