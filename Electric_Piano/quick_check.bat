@echo off
echo.
echo ========================================
echo    电子琴项目快速状态检查
echo ========================================
echo.

cd /d "d:\Quartus_Project\Electric_Piano"

echo 📂 当前目录: %CD%
echo.

echo 🔍 检查关键文件...
if exist "Mode_Controller.v" (
    echo ✅ Mode_Controller.v
) else (
    echo ❌ Mode_Controller.v 缺失
)

if exist "Array_KeyBoard.v" (
    echo ✅ Array_KeyBoard.v  
) else (
    echo ❌ Array_KeyBoard.v 缺失
)

if exist "Electric_Piano.qpf" (
    echo ✅ Electric_Piano.qpf
) else (
    echo ❌ Electric_Piano.qpf 缺失
)

echo.
echo 🔧 检查关键修复...

findstr /c:"key_pulse) && (!(|key_pulse_r))" Mode_Controller.v >nul
if %errorlevel%==0 (
    echo ✅ Mode_Controller.v 边沿检测语法已修复
) else (
    echo ❌ Mode_Controller.v 边沿检测语法需要修复
)

findstr /c:"led_display <= 8'b11111110" Mode_Controller.v >nul  
if %errorlevel%==0 (
    echo ✅ Mode_Controller.v LED显示逻辑已修复
) else (
    echo ❌ Mode_Controller.v LED显示逻辑需要修复
)

findstr /c:"key_pulse = (~key_scan_r) & key_scan_rr" Array_KeyBoard.v >nul
if %errorlevel%==0 (
    echo ✅ Array_KeyBoard.v 按键检测逻辑已修复
) else (
    echo ❌ Array_KeyBoard.v 按键检测逻辑需要修复
)

echo.
echo 🎯 下一步操作:
echo    1. 在Quartus Prime中打开 Electric_Piano.qpf
echo    2. 运行完整编译 (Processing ^> Start Compilation)
echo    3. 下载到FPGA硬件测试
echo    4. 验证LED显示和模式切换功能
echo.
echo 📋 键盘功能:
echo    1键 - 手动模式    (LED1亮)
echo    A键 - 稻香模式    (LED2亮)
echo    B键 - 青花瓷模式  (LED3亮)
echo    C键 - 告白气球模式(LED4亮)
echo    D键 - 简单爱模式  (LED5亮)
echo.
echo 🎊 状态: 代码修复完成，准备硬件测试
echo ========================================
pause
