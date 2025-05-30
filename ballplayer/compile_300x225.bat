@echo off
echo ============================================================
echo 编译ballplayer项目 - 300x225图片显示
echo ============================================================

echo 步骤1: 重新生成图片数据...
python image_processor.py

echo.
echo 步骤2: 复制ROM文件到source目录...
copy "rom_data\Clever_300x225_rom.v" "source\Clever_rom.v" /Y

echo.
echo 步骤3: 编译FPGA项目...
quartus_sh --flow compile ballplayer

echo.
echo ============================================================
echo 编译完成！
echo 现在图片已放大到300x225像素，几乎占满整个液晶屏
echo ============================================================
pause
