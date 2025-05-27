# 高级电子琴演示脚本
# Advanced Electric Piano Demo Script

Write-Host "=== 高级电子琴项目演示 ===" -ForegroundColor Green
Write-Host "项目位置: d:\Quartus_Project\Electric_Piano" -ForegroundColor Yellow
Write-Host ""

# 显示项目文件结构
Write-Host "项目文件结构:" -ForegroundColor Cyan
Get-ChildItem -Path "d:\Quartus_Project\Electric_Piano" | Where-Object {$_.Extension -eq ".v" -or $_.Extension -eq ".md"} | ForEach-Object {
    Write-Host "  $($_.Name)" -ForegroundColor White
}
Write-Host ""

# 显示功能特性
Write-Host "功能特性:" -ForegroundColor Cyan
Write-Host "  ✓ 手动演奏模式 - 4x4矩阵键盘实时演奏" -ForegroundColor Green
Write-Host "  ✓ 自动播放《稻香》 - 周杰伦经典歌曲" -ForegroundColor Green
Write-Host "  ✓ 自动播放《青花瓷》- 中国风代表作" -ForegroundColor Green
Write-Host "  ✓ 自动播放《告白气球》- 浪漫情歌" -ForegroundColor Green
Write-Host "  ✓ 自动播放《简单爱》- 朗朗上口的旋律" -ForegroundColor Green
Write-Host "  ✓ LED模式显示和状态指示" -ForegroundColor Green
Write-Host ""

# 显示技术规格
Write-Host "技术规格:" -ForegroundColor Cyan
Write-Host "  • FPGA芯片: MAX 10 (10M08SAM153C8G)" -ForegroundColor White
Write-Host "  • 系统时钟: 12MHz" -ForegroundColor White
Write-Host "  • 音频输出: PWM蜂鸣器驱动" -ForegroundColor White
Write-Host "  • 按键接口: 4x4矩阵键盘" -ForegroundColor White
Write-Host "  • 显示接口: 8位LED + 4位模式指示灯" -ForegroundColor White
Write-Host ""

# 显示编译指令
Write-Host "编译步骤:" -ForegroundColor Cyan
Write-Host "  1. 打开Quartus Prime" -ForegroundColor Yellow
Write-Host "  2. 打开项目文件: Electric_Piano.qpf" -ForegroundColor Yellow
Write-Host "  3. 设置顶层实体为: Advanced_Electric_Piano" -ForegroundColor Yellow
Write-Host "  4. 执行编译流程:" -ForegroundColor Yellow
Write-Host "     - Analysis & Synthesis" -ForegroundColor White
Write-Host "     - Fitter" -ForegroundColor White
Write-Host "     - Assembler" -ForegroundColor White
Write-Host "  5. 下载.sof文件到FPGA开发板" -ForegroundColor Yellow
Write-Host ""

# 显示操作说明
Write-Host "操作说明:" -ForegroundColor Cyan
Write-Host "  按键功能映射:" -ForegroundColor Yellow
Write-Host "    按键16: 手动演奏模式" -ForegroundColor White
Write-Host "    按键15: 播放《稻香》" -ForegroundColor White
Write-Host "    按键14: 播放《青花瓷》" -ForegroundColor White
Write-Host "    按键13: 播放《告白气球》" -ForegroundColor White
Write-Host "    按键12: 播放《简单爱》" -ForegroundColor White
Write-Host ""
Write-Host "  手动演奏音符映射:" -ForegroundColor Yellow
Write-Host "    第1行: Do Re Mi Fa" -ForegroundColor White
Write-Host "    第2行: So La Si Do(高)" -ForegroundColor White
Write-Host "    第3行: Re(高) Mi(高) Fa(高) So(高)" -ForegroundColor White
Write-Host "    第4行: La(高) Si(高) Do(超高) [模式切换]" -ForegroundColor White
Write-Host ""

# 提示下一步操作
Write-Host "下一步操作建议:" -ForegroundColor Magenta
Write-Host "  1. 在Quartus中打开项目进行编译" -ForegroundColor White
Write-Host "  2. 检查引脚分配是否与硬件匹配" -ForegroundColor White
Write-Host "  3. 下载到FPGA板卡进行实际测试" -ForegroundColor White
Write-Host "  4. 调试和优化音频效果" -ForegroundColor White
Write-Host ""

Write-Host "=== 演示脚本结束 ===" -ForegroundColor Green
Write-Host "享受音乐编程的乐趣！" -ForegroundColor Red
