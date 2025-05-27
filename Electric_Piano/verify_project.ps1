# Advanced Electric Piano 项目验证脚本
Write-Host "开始验证 Advanced Electric Piano 项目..." -ForegroundColor Green

# 检查文件是否存在
Write-Host "`n检查必要文件..." -ForegroundColor Yellow
$files = @(
    "Advanced_Electric_Piano.v",
    "Mode_Controller.v", 
    "Music_Player.v",
    "Advanced_Beeper.v",
    "Electric_Piano.qsf",
    "Array_KeyBoard.v",
    "Beeper.v",
    "PWM.v",
    "tone.v"
)

foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host "✓ $file 存在" -ForegroundColor Green
    } else {
        Write-Host "✗ $file 缺失" -ForegroundColor Red
    }
}

Write-Host "`n项目配置信息:" -ForegroundColor Cyan
Write-Host "- 顶层实体: Advanced_Electric_Piano"
Write-Host "- 目标设备: 10M08SAM153C8G"
Write-Host "- 系统时钟: 12MHz"
Write-Host "- 支持模式: 5种 (手动演奏 + 4首自动播放)"

Write-Host "`n歌曲列表:" -ForegroundColor Magenta
Write-Host "1. 手动演奏模式 (模式000)"
Write-Host "2. 《稻香》自动播放 (模式001)"
Write-Host "3. 《青花瓷》自动播放 (模式010)"
Write-Host "4. 《告白气球》自动播放 (模式011)"
Write-Host "5. 《简单爱》自动播放 (模式100)"

Write-Host "`n按键布局:" -ForegroundColor Yellow
Write-Host "矩阵键盘 4x4 布局:"
Write-Host "[1] [2] [3] [A]  <- 第1行: 音符 Do Re Mi 和模式切换"
Write-Host "[4] [5] [6] [B]  <- 第2行: 音符 Fa So La 和模式切换"
Write-Host "[7] [8] [9] [C]  <- 第3行: 音符 Si Do(高) Re(高) 和模式切换"
Write-Host "[*] [0] [#] [D]  <- 第4行: 其他功能键和模式切换"

Write-Host "`n输出端口:" -ForegroundColor Cyan
Write-Host "- beeper: 蜂鸣器音频输出"
Write-Host "- led_display[7:0]: 8位LED显示当前模式"
Write-Host "- mode_indicator[3:0]: 4位模式指示灯"

Write-Host "`n项目验证完成！" -ForegroundColor Green
Write-Host "请在 Quartus Prime 中打开 Electric_Piano.qpf 进行编译。" -ForegroundColor White
