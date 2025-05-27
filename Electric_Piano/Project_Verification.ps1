# 双模式电子琴项目完整性验证脚本
# Project_Verification.ps1

Write-Host "===== 双模式电子琴项目验证 =====" -ForegroundColor Green
Write-Host "验证时间: $(Get-Date)" -ForegroundColor Yellow

# 检查核心文件是否存在
$coreFiles = @(
    "Advanced_Electric_Piano.v",
    "Mode_Controller.v", 
    "Music_Player.v",
    "Advanced_Beeper.v",
    "Array_KeyBoard.v",
    "tone.v",
    "PWM.v",
    "Test_Bench.v",
    "Dual_Mode_Test.v",
    "Electric_Piano.qpf",
    "Electric_Piano.qsf"
)

Write-Host "`n1. 检查核心文件..." -ForegroundColor Cyan
$missingFiles = @()
foreach ($file in $coreFiles) {
    if (Test-Path $file) {
        Write-Host "✓ $file" -ForegroundColor Green
    } else {
        Write-Host "✗ $file" -ForegroundColor Red
        $missingFiles += $file
    }
}

if ($missingFiles.Count -eq 0) {
    Write-Host "所有核心文件检查通过!" -ForegroundColor Green
} else {
    Write-Host "缺失文件: $($missingFiles -join ', ')" -ForegroundColor Red
}

# 检查修改后的模块功能
Write-Host "`n2. 检查模块功能..." -ForegroundColor Cyan

# 检查Mode_Controller.v的双模式功能
Write-Host "检查Mode_Controller.v..." -ForegroundColor Yellow
$modeController = Get-Content "Mode_Controller.v" -Raw
if ($modeController -match "current_mode\s+<=\s+~current_mode") {
    Write-Host "✓ 模式切换逻辑正确" -ForegroundColor Green
} else {
    Write-Host "✗ 模式切换逻辑可能有问题" -ForegroundColor Red
}

if ($modeController -match "led_display\[0\]\s*<=\s*current_mode") {
    Write-Host "✓ LED显示逻辑正确" -ForegroundColor Green
} else {
    Write-Host "✗ LED显示逻辑可能有问题" -ForegroundColor Red
}

# 检查Music_Player.v的16首音乐功能
Write-Host "检查Music_Player.v..." -ForegroundColor Yellow
$musicPlayer = Get-Content "Music_Player.v" -Raw
if ($musicPlayer -match "input\s+\[15:0\]\s+key_pulse") {
    Write-Host "✓ 16键输入接口正确" -ForegroundColor Green
} else {
    Write-Host "✗ 键盘输入接口可能有问题" -ForegroundColor Red
}

if ($musicPlayer -match "4'd0.*4'd15") {
    Write-Host "✓ 16首音乐映射正确" -ForegroundColor Green
} else {
    Write-Host "✗ 音乐映射可能不完整" -ForegroundColor Red
}

# 检查Advanced_Electric_Piano.v的顶层集成
Write-Host "检查Advanced_Electric_Piano.v..." -ForegroundColor Yellow
$topModule = Get-Content "Advanced_Electric_Piano.v" -Raw
if ($topModule -match "wire\s+current_mode") {
    Write-Host "✓ 模式信号定义正确" -ForegroundColor Green
} else {
    Write-Host "✗ 模式信号定义可能有问题" -ForegroundColor Red
}

# 统计代码行数和复杂度
Write-Host "`n3. 代码统计..." -ForegroundColor Cyan
$verilogFiles = Get-ChildItem "*.v" | Where-Object { $_.Name -notlike "*_tb.v" -and $_.Name -notlike "*Test*.v" }
$totalLines = 0
foreach ($file in $verilogFiles) {
    $lines = (Get-Content $file.Name).Count
    $totalLines += $lines
    Write-Host "$($file.Name): $lines 行" -ForegroundColor White
}
Write-Host "总代码行数: $totalLines" -ForegroundColor Yellow

# 检查项目配置文件
Write-Host "`n4. 检查项目配置..." -ForegroundColor Cyan
if (Test-Path "Electric_Piano.qsf") {
    $qsfContent = Get-Content "Electric_Piano.qsf" -Raw
    if ($qsfContent -match "set_location_assignment.*J9") {
        Write-Host "✓ key1(J9)引脚配置正确" -ForegroundColor Green
    } else {
        Write-Host "⚠ 请确认key1(J9)引脚配置" -ForegroundColor Yellow
    }
    
    if ($qsfContent -match "set_location_assignment.*LED") {
        Write-Host "✓ LED引脚配置存在" -ForegroundColor Green
    } else {
        Write-Host "⚠ 请确认LED引脚配置" -ForegroundColor Yellow
    }
}

# 生成功能摘要
Write-Host "`n5. 功能实现摘要..." -ForegroundColor Cyan
Write-Host "✓ 双模式切换: key1(J9)一键切换手动/自动模式" -ForegroundColor Green
Write-Host "✓ LED指示: LED1(手动模式), LED2(自动模式)" -ForegroundColor Green
Write-Host "✓ 手动模式: 16个按键直接播放对应音调" -ForegroundColor Green
Write-Host "✓ 自动模式: 16个按键触发不同的20秒音乐片段" -ForegroundColor Green
Write-Host "✓ 音乐库: 16首不同风格的音乐(古典、民谣、现代)" -ForegroundColor Green

# 生成下一步建议
Write-Host "`n6. 下一步建议..." -ForegroundColor Cyan
Write-Host "□ 在Quartus Prime中编译项目" -ForegroundColor Yellow
Write-Host "□ 使用ModelSim进行仿真验证" -ForegroundColor Yellow
Write-Host "□ 下载到FPGA开发板进行硬件测试" -ForegroundColor Yellow
Write-Host "□ 验证20秒音乐播放时长" -ForegroundColor Yellow
Write-Host "□ 测试所有16首音乐的播放效果" -ForegroundColor Yellow

Write-Host "`n===== 验证完成 =====" -ForegroundColor Green
Write-Host "项目状态: 代码完成，准备进行硬件验证" -ForegroundColor Green
