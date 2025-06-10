@echo off
echo ========================================
echo 开始编译 Exp2 项目（使用新芯片 10M08SCM153C8G）
echo ========================================

rem 设置 Quartus 路径（根据您的实际安装路径调整）
set QUARTUS_BIN="C:\intelFPGA_lite\18.1\quartus\bin64"

echo 正在进行分析和综合...
%QUARTUS_BIN%\quartus_map.exe Exp2
if errorlevel 1 goto error

echo 正在进行布局布线...
%QUARTUS_BIN%\quartus_fit.exe Exp2
if errorlevel 1 goto error

echo 正在进行时序分析...
%QUARTUS_BIN%\quartus_sta.exe Exp2
if errorlevel 1 goto error

echo 正在生成编程文件...
%QUARTUS_BIN%\quartus_asm.exe Exp2
if errorlevel 1 goto error

echo ========================================
echo 编译成功完成！
echo 生成的文件位于 output_files 目录中
echo ========================================
goto end

:error
echo ========================================
echo 编译过程中出现错误！
echo 请检查错误信息并修正问题
echo ========================================

:end
pause
