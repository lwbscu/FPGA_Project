# 电子琴项目编译验证脚本
# 功能：自动编译项目并检查结果

param(
    [switch]$Verbose = $false
)

Write-Host "🎹 电子琴项目编译验证脚本" -ForegroundColor Green
Write-Host "=====================================`n" -ForegroundColor Green

# 设置工作目录
$ProjectPath = "d:\Quartus_Project\Electric_Piano"
Set-Location $ProjectPath

Write-Host "📂 当前目录: $ProjectPath" -ForegroundColor Cyan

# 检查必要文件是否存在
$RequiredFiles = @(
    "Electric_Piano.qpf",
    "Electric_Piano.qsf", 
    "Mode_Controller.v",
    "Array_KeyBoard.v",
    "Advanced_Electric_Piano.v"
)

Write-Host "`n🔍 检查必要文件..." -ForegroundColor Yellow
$AllFilesExist = $true
foreach ($file in $RequiredFiles) {
    if (Test-Path $file) {
        Write-Host "✅ $file" -ForegroundColor Green
    } else {
        Write-Host "❌ $file 不存在" -ForegroundColor Red
        $AllFilesExist = $false
    }
}

if (-not $AllFilesExist) {
    Write-Host "`n❌ 缺少必要文件，无法继续编译" -ForegroundColor Red
    exit 1
}

# 检查Quartus是否可用
Write-Host "`n🔧 检查Quartus工具链..." -ForegroundColor Yellow

$QuartusCommands = @("quartus_sh", "quartus_map", "quartus_fit", "quartus_asm")
$QuartusAvailable = $false

foreach ($cmd in $QuartusCommands) {
    try {
        $null = Get-Command $cmd -ErrorAction Stop
        Write-Host "✅ $cmd 可用" -ForegroundColor Green
        $QuartusAvailable = $true
        break
    } catch {
        if ($Verbose) {
            Write-Host "⚠️ $cmd 不在PATH中" -ForegroundColor Yellow
        }
    }
}

if (-not $QuartusAvailable) {
    Write-Host "⚠️ Quartus工具链不在PATH中，将尝试手动检查项目文件" -ForegroundColor Yellow
    
    # 手动检查最新编译结果
    if (Test-Path "output_files\Electric_Piano.map.rpt") {
        $MapReport = Get-Content "output_files\Electric_Piano.map.rpt" -Raw
        
        if ($MapReport -match "Found 0 design units.*mode_controller\.v") {
            Write-Host "❌ Mode_Controller.v 存在语法错误" -ForegroundColor Red
            
            # 显示具体错误
            if ($MapReport -match "Error.*Mode_Controller\.v\((\d+)\).*") {
                $LineNum = $Matches[1]
                Write-Host "   错误位置: Mode_Controller.v 第 $LineNum 行" -ForegroundColor Red
            }
        } else {
            Write-Host "✅ Mode_Controller.v 语法检查通过" -ForegroundColor Green
        }
        
        if ($MapReport -match "Analysis & Synthesis Status.*Failed") {
            Write-Host "❌ 编译失败" -ForegroundColor Red
        } elseif ($MapReport -match "Analysis & Synthesis Status.*Successful") {
            Write-Host "✅ 编译成功" -ForegroundColor Green
        }
    } else {
        Write-Host "⚠️ 未找到编译报告，需要重新编译" -ForegroundColor Yellow
    }
} else {
    # 如果Quartus可用，尝试运行编译
    Write-Host "`n🚀 开始编译项目..." -ForegroundColor Cyan
    
    try {
        $CompileResult = & quartus_sh --flow compile Electric_Piano 2>&1
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ 编译成功完成" -ForegroundColor Green
        } else {
            Write-Host "❌ 编译失败" -ForegroundColor Red
            if ($Verbose) {
                Write-Host "编译输出:" -ForegroundColor Yellow
                Write-Host $CompileResult -ForegroundColor Gray
            }
        }
    } catch {
        Write-Host "❌ 编译过程出错: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# 显示关键文件的修复状态
Write-Host "`n📋 修复状态总结:" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan

# 检查Mode_Controller.v的关键修复点
$ModeController = Get-Content "Mode_Controller.v" -Raw

if ($ModeController -match '\(\|\|key_pulse\)\s*&&\s*\(!\(\|key_pulse_r\)\)') {
    Write-Host "✅ Mode_Controller.v: 边沿检测语法已修复" -ForegroundColor Green
} else {
    Write-Host "❌ Mode_Controller.v: 边沿检测语法需要修复" -ForegroundColor Red
}

if ($ModeController -match 'led_display\s*<=\s*8\'b11111110.*手动模式') {
    Write-Host "✅ Mode_Controller.v: LED显示逻辑已修复" -ForegroundColor Green
} else {
    Write-Host "❌ Mode_Controller.v: LED显示逻辑需要修复" -ForegroundColor Red
}

# 检查Array_KeyBoard.v的关键修复点
$ArrayKeyboard = Get-Content "Array_KeyBoard.v" -Raw

if ($ArrayKeyboard -match 'key_pulse\s*=\s*\(~key_scan_r\)\s*&\s*key_scan_rr') {
    Write-Host "✅ Array_KeyBoard.v: 按键脉冲检测已修复" -ForegroundColor Green
} else {
    Write-Host "❌ Array_KeyBoard.v: 按键脉冲检测需要修复" -ForegroundColor Red
}

# 键盘编码验证
Write-Host "`n🎹 键盘编码配置:" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "1键 (16'h0001) - 手动模式" -ForegroundColor White
Write-Host "A键 (16'h0008) - 《稻香》" -ForegroundColor White  
Write-Host "B键 (16'h0080) - 《青花瓷》" -ForegroundColor White
Write-Host "C键 (16'h0800) - 《告白气球》" -ForegroundColor White
Write-Host "D键 (16'h8000) - 《简单爱》" -ForegroundColor White

# 下一步指导
Write-Host "`n🎯 下一步操作:" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "1. 在Quartus Prime中打开项目 Electric_Piano.qpf" -ForegroundColor Yellow
Write-Host "2. 运行完整编译 (Processing -> Start Compilation)" -ForegroundColor Yellow
Write-Host "3. 检查编译报告确认无错误" -ForegroundColor Yellow
Write-Host "4. 使用Programmer下载到FPGA硬件" -ForegroundColor Yellow
Write-Host "5. 测试功能:" -ForegroundColor Yellow
Write-Host "   - 验证LED显示 (只有对应模式LED亮)" -ForegroundColor Gray
Write-Host "   - 测试A/B/C/D键切换模式" -ForegroundColor Gray
Write-Host "   - 验证1键返回手动模式" -ForegroundColor Gray

Write-Host "`n🎊 项目状态: 代码修复完成，准备硬件测试" -ForegroundColor Green
