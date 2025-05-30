@echo off
REM 自定义图片显示项目编译脚本
REM 使用80x60 RGB332格式图片
echo ========================================
echo 编译自定义图片显示项目
echo 目标: 80x60 RGB332格式图片显示
echo ========================================

REM 切换到项目目录
cd /d "d:\Quartus_Project\ballplayer"

REM 检查必要文件是否存在
if not exist "source\lcd_custom_image_display.v" (
    echo 错误: 找不到自定义图片显示模块
    pause
    exit /b 1
)

if not exist "source\Clever_rom.v" (
    echo 错误: 找不到图片ROM文件
    pause
    exit /b 1
)

echo 检查项目文件...
echo - LCD显示模块: lcd_custom_image_display.v [存在]
echo - 图片ROM文件: Clever_rom.v [存在]
echo - 顶层模块: ballplayer_top_test.v [存在]

REM 编译项目
echo.
echo 开始编译...
echo 第1步: Analysis ^& Synthesis
quartus_map ballplayer
if errorlevel 1 (
    echo 编译失败: Analysis ^& Synthesis阶段
    echo 请检查源代码是否有语法错误
    pause
    exit /b 1
)

echo 第2步: Fitter
quartus_fit ballplayer
if errorlevel 1 (
    echo 编译失败: Fitter阶段
    echo 请检查引脚分配和时序约束
    pause
    exit /b 1
)

echo 第3步: Assembler
quartus_asm ballplayer
if errorlevel 1 (
    echo 编译失败: Assembler阶段
    pause
    exit /b 1
)

echo.
echo ========================================
echo 编译成功！
echo ========================================
echo 输出文件: ballplayer.sof
echo 图片信息: 
echo   - 尺寸: 80x60像素
echo   - 格式: RGB332 (8位色)
echo   - 显示位置: 屏幕居中
echo   - 切换间隔: 2.5秒
echo ========================================
echo 下一步: 使用Quartus Programmer烧录到FPGA
echo 或者运行: quartus_pgm -m jtag -o "p;ballplayer.sof"
echo ========================================
pause
