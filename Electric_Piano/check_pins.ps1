# 引脚分配验证脚本
Write-Host "=== Advanced Electric Piano 引脚分配验证 ===" -ForegroundColor Green

Write-Host "`n检查QSF文件中的引脚分配..." -ForegroundColor Yellow

# 读取QSF文件内容
$qsfContent = Get-Content "Electric_Piano.qsf"

# 验证关键引脚
$pinChecks = @{
    "clk" = "PIN_J5"
    "rst_n" = "PIN_J14" 
    "beeper" = "PIN_B14"
    "led_display[0]" = "PIN_N15"
    "led_display[7]" = "PIN_K11"
    "mode_indicator[0]" = "PIN_J12"
    "row[0]" = "PIN_P9"
    "col[0]" = "PIN_P4"
}

Write-Host "`n关键引脚验证结果:" -ForegroundColor Cyan
foreach ($signal in $pinChecks.Keys) {
    $expectedPin = $pinChecks[$signal]
    $found = $qsfContent | Where-Object { $_ -match "set_location_assignment $expectedPin -to $signal" }
    
    if ($found) {
        Write-Host "✅ $signal -> $expectedPin" -ForegroundColor Green
    } else {
        Write-Host "❌ $signal -> $expectedPin (未找到)" -ForegroundColor Red
    }
}

Write-Host "`n检查非法引脚..." -ForegroundColor Yellow
$illegalPins = @("PIN_A8", "PIN_A10", "PIN_B10", "PIN_D13", "PIN_C13", "PIN_D14", "PIN_A12")
$foundIllegal = $false

foreach ($pin in $illegalPins) {
    $found = $qsfContent | Where-Object { $_ -match $pin }
    if ($found) {
        Write-Host "⚠️  仍然使用非法引脚: $pin" -ForegroundColor Red
        $foundIllegal = $true
    }
}

if (-not $foundIllegal) {
    Write-Host "✅ 未发现非法引脚分配" -ForegroundColor Green
}

Write-Host "`n统计信息:" -ForegroundColor Magenta
$locationLines = $qsfContent | Where-Object { $_ -match "set_location_assignment" }
Write-Host "总引脚分配数量: $($locationLines.Count)"

Write-Host "`n引脚分配文件验证完成！" -ForegroundColor Green

# 检查Verilog文件
Write-Host "`n检查Verilog文件完整性..." -ForegroundColor Yellow
$vFiles = @(
    "Advanced_Electric_Piano.v",
    "Mode_Controller.v", 
    "Music_Player.v",
    "Advanced_Beeper.v"
)

foreach ($file in $vFiles) {
    if (Test-Path $file) {
        Write-Host "✅ $file" -ForegroundColor Green
    } else {
        Write-Host "❌ $file (缺失)" -ForegroundColor Red
    }
}

Write-Host "`n项目准备状态: " -NoNewline
if (-not $foundIllegal -and (Test-Path "Advanced_Electric_Piano.v")) {
    Write-Host "🚀 READY FOR COMPILATION" -ForegroundColor Green
} else {
    Write-Host "⚠️  需要进一步检查" -ForegroundColor Yellow
}
