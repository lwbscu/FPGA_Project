#!/bin/bash
# 编译验证脚本
echo "开始验证 Advanced Electric Piano 项目..."

# 检查文件是否存在
echo "检查必要文件..."
files=(
    "Advanced_Electric_Piano.v"
    "Mode_Controller.v" 
    "Music_Player.v"
    "Advanced_Beeper.v"
    "Electric_Piano.qsf"
    "Array_KeyBoard.v"
    "Beeper.v"
    "PWM.v"
    "tone.v"
)

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "✓ $file 存在"
    else
        echo "✗ $file 缺失"
    fi
done

echo ""
echo "项目文件验证完成。"
echo "请在 Quartus Prime 中打开项目进行编译测试。"
echo "顶层实体: Advanced_Electric_Piano"
echo "目标设备: 10M08SAM153C8G"
