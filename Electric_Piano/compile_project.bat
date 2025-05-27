@echo off
echo ===== 双模式电子琴项目 - Quartus编译尝试 =====
echo.

REM 检查常见Quartus安装路径
set QUARTUS_FOUND=0

echo 正在搜索Quartus工具...

REM 检查环境变量
if exist "%QUARTUS_ROOTDIR%\bin64\quartus_map.exe" (
    echo 找到Quartus: %QUARTUS_ROOTDIR%\bin64\
    set QUARTUS_PATH=%QUARTUS_ROOTDIR%\bin64
    set QUARTUS_FOUND=1
    goto :compile
)

REM 检查常见安装路径
for %%d in (C D E F) do (
    if exist "%%d:\intelFPGA\*\quartus\bin64\quartus_map.exe" (
        for /d %%p in ("%%d:\intelFPGA\*\quartus\bin64") do (
            echo 找到Quartus: %%p\
            set QUARTUS_PATH=%%p
            set QUARTUS_FOUND=1
            goto :compile
        )
    )
    if exist "%%d:\intelFPGA_lite\*\quartus\bin64\quartus_map.exe" (
        for /d %%p in ("%%d:\intelFPGA_lite\*\quartus\bin64") do (
            echo 找到Quartus: %%p\
            set QUARTUS_PATH=%%p
            set QUARTUS_FOUND=1
            goto :compile
        )
    )
    if exist "%%d:\altera\*\quartus\bin64\quartus_map.exe" (
        for /d %%p in ("%%d:\altera\*\quartus\bin64") do (
            echo 找到Quartus: %%p\
            set QUARTUS_PATH=%%p
            set QUARTUS_FOUND=1
            goto :compile
        )
    )
)

:compile
if %QUARTUS_FOUND%==0 (
    echo.
    echo ⚠ 未找到Quartus工具
    echo 请手动安装Quartus Prime或检查安装路径
    echo.
    echo 手动编译步骤:
    echo 1. 在Quartus Prime中打开Electric_Piano.qpf
    echo 2. 点击Processing ^> Start Compilation
    echo 3. 等待编译完成
    echo 4. 检查编译报告
    echo.
    goto :end
)

echo.
echo ===== 开始编译 =====
echo 使用工具: %QUARTUS_PATH%\quartus_map.exe
echo 项目文件: Electric_Piano.qpf
echo.

REM 设置路径并编译
set PATH=%QUARTUS_PATH%;%PATH%

echo 步骤1: Analysis & Synthesis
quartus_map Electric_Piano
if errorlevel 1 (
    echo ✗ Analysis & Synthesis 失败
    goto :error
) else (
    echo ✓ Analysis & Synthesis 完成
)

echo.
echo 步骤2: Fitter
quartus_fit Electric_Piano
if errorlevel 1 (
    echo ✗ Fitter 失败
    goto :error
) else (
    echo ✓ Fitter 完成
)

echo.
echo 步骤3: Assembler
quartus_asm Electric_Piano
if errorlevel 1 (
    echo ✗ Assembler 失败
    goto :error
) else (
    echo ✓ Assembler 完成
)

echo.
echo 步骤4: TimeQuest Timing Analyzer
quartus_sta Electric_Piano
if errorlevel 1 (
    echo ⚠ Timing Analysis 有警告
) else (
    echo ✓ Timing Analysis 完成
)

echo.
echo ===== 编译成功! =====
echo 输出文件位置: output_files\Electric_Piano.sof
echo 编程文件位置: output_files\Electric_Piano.pof
echo.
echo 下一步: 使用Quartus Programmer下载到FPGA
goto :end

:error
echo.
echo ===== 编译失败 =====
echo 请检查错误信息并修复问题
echo 详细信息请查看编译报告文件

:end
echo.
echo 按任意键继续...
pause >nul
