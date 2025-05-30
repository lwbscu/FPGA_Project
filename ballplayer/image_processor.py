#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Image to HEX Converter for STEP-MAX10 LCD Display
用于将图片转换为FPGA LCD显示的HEX数据格式

功能特点：
- 支持80×60像素小尺寸测试
- RGB332格式输出（8位色彩）
- 横版显示适配
- 清晰线条处理
- 批量处理支持

作者: GitHub Copilot
日期: 2025-05-30
"""

import os
import sys
import glob
from PIL import Image, ImageFilter, ImageEnhance
import numpy as np

# 配置参数
TARGET_WIDTH = 160   # 目标宽度 (液晶屏一半)
TARGET_HEIGHT = 120  # 目标高度 (液晶屏一半)
COLOR_FORMAT = "BW"  # 颜色格式: "RGB332" 或 "BW" (黑白)

# 输入输出路径
INPUT_PATH = r"C:\Users\m1770\Desktop\图片素材"
OUTPUT_PATH = r"D:\Quartus_Project\ballplayer\rom_data"

def rgb_to_grayscale(r, g, b):
    """
    将RGB转换为灰度值
    使用标准的加权平均公式
    """
    return int(0.299 * r + 0.587 * g + 0.114 * b)

def rgb_to_bw(r, g, b, threshold=128):
    """
    将RGB转换为黑白(1位)
    threshold: 阈值，高于此值为白色(1)，低于此值为黑色(0)
    """
    gray = rgb_to_grayscale(r, g, b)
    return 1 if gray >= threshold else 0

def rgb888_to_rgb332(r, g, b):
    """
    将RGB888转换为RGB332格式
    R: 3位 (0-7)
    G: 3位 (0-7) 
    B: 2位 (0-3)
    """
    r3 = (r >> 5) & 0x07  # 取高3位
    g3 = (g >> 5) & 0x07  # 取高3位
    b2 = (b >> 6) & 0x03  # 取高2位
    
    return (r3 << 5) | (g3 << 2) | b2

def enhance_image_clarity(image):
    """
    增强图像清晰度和线条定义
    """
    # 锐化滤镜
    sharpening_filter = ImageFilter.UnsharpMask(radius=1, percent=150, threshold=1)
    image = image.filter(sharpening_filter)
    
    # 增强对比度
    enhancer = ImageEnhance.Contrast(image)
    image = enhancer.enhance(1.2)
    
    # 增强清晰度
    enhancer = ImageEnhance.Sharpness(image)
    image = enhancer.enhance(1.3)
    
    return image

def resize_image_with_aspect_ratio(image, target_width, target_height):
    """
    保持宽高比缩放图像，居中放置，背景填充黑色
    """
    original_width, original_height = image.size
    
    # 计算缩放比例
    scale_w = target_width / original_width
    scale_h = target_height / original_height
    scale = min(scale_w, scale_h)  # 使用较小的比例保持宽高比
    
    # 计算新尺寸
    new_width = int(original_width * scale)
    new_height = int(original_height * scale)
    
    # 缩放图像
    resized = image.resize((new_width, new_height), Image.Resampling.LANCZOS)
    
    # 创建目标尺寸的黑色背景
    result = Image.new('RGB', (target_width, target_height), (0, 0, 0))
    
    # 计算居中位置
    x_offset = (target_width - new_width) // 2
    y_offset = (target_height - new_height) // 2
    
    # 将缩放后的图像粘贴到中心
    result.paste(resized, (x_offset, y_offset))
    
    return result

def process_single_image(input_path, output_path, image_name):
    """
    处理单张图片
    """
    try:
        print(f"正在处理: {image_name}")
        
        # 打开并转换为RGB
        image = Image.open(input_path)
        if image.mode != 'RGB':
            image = image.convert('RGB')
        
        # 增强清晰度
        image = enhance_image_clarity(image)
          # 缩放到目标尺寸
        image = resize_image_with_aspect_ratio(image, TARGET_WIDTH, TARGET_HEIGHT)
        
        # 根据颜色格式转换数据
        width, height = image.size
        pixel_data = []
        
        if COLOR_FORMAT == "BW":
            # 黑白格式(1位)
            for y in range(height):
                for x in range(width):
                    r, g, b = image.getpixel((x, y))
                    bw_value = rgb_to_bw(r, g, b, threshold=128)
                    pixel_data.append(bw_value)
            
            data_bits = 1
            format_suffix = "bw"
        else:
            # RGB332格式(8位)
            for y in range(height):
                for x in range(width):
                    r, g, b = image.getpixel((x, y))
                    rgb332_value = rgb888_to_rgb332(r, g, b)
                    pixel_data.append(rgb332_value)
            
            data_bits = 8
            format_suffix = "rgb332"        # 生成输出文件名
        base_name = os.path.splitext(image_name)[0]
        hex_filename = f"{base_name}_{TARGET_WIDTH}x{TARGET_HEIGHT}_{format_suffix}.hex"
        hex_path = os.path.join(output_path, hex_filename)
        
        # 写入HEX文件
        write_hex_file(hex_path, pixel_data, data_bits)
        
        # 生成对应的Verilog ROM模块
        v_filename = f"{base_name}_{TARGET_WIDTH}x{TARGET_HEIGHT}_rom.v"
        v_path = os.path.join(output_path, v_filename)
        generate_verilog_rom(v_path, base_name, pixel_data, TARGET_WIDTH, TARGET_HEIGHT, data_bits)
        
        print(f"✓ 成功生成: {hex_filename}")
        print(f"✓ 成功生成: {v_filename}")
        return True
        
    except Exception as e:
        print(f"✗ 处理失败 {image_name}: {str(e)}")
        return False

def get_first_image(input_path):
    """
    获取文件夹中的第一张图片
    """
    if not os.path.exists(input_path):
        print(f"错误: 输入路径不存在: {input_path}")
        return None
    
    # 支持的图片格式
    image_extensions = ['*.jpg', '*.jpeg', '*.png', '*.bmp', '*.gif', '*.tiff']
    
    for ext in image_extensions:
        files = glob.glob(os.path.join(input_path, ext))
        files.extend(glob.glob(os.path.join(input_path, ext.upper())))
        
        if files:
            # 按文件名排序，返回第一个
            files.sort()
            return files[0]
    
    print(f"错误: 在 {input_path} 中未找到支持的图片文件")
    return None

def create_test_image():
    """
    创建一个测试图片，用于验证图像处理流程
    """
    print("创建测试图片...")
    
    # 创建一个80×60的测试图片
    test_image = Image.new('RGB', (TARGET_WIDTH, TARGET_HEIGHT), (0, 0, 0))
    
    # 绘制一些测试图案
    import numpy as np
    pixels = np.array(test_image)
    
    # 绘制彩色条纹测试图案
    for y in range(TARGET_HEIGHT):
        for x in range(TARGET_WIDTH):
            if y < TARGET_HEIGHT // 3:
                # 红色区域
                pixels[y, x] = [255, 0, 0]
            elif y < 2 * TARGET_HEIGHT // 3:
                # 绿色区域
                pixels[y, x] = [0, 255, 0]
            else:
                # 蓝色区域
                pixels[y, x] = [0, 0, 255]
    
    # 添加一些白色线条
    for x in range(0, TARGET_WIDTH, 10):
        for y in range(TARGET_HEIGHT):
            pixels[y, x] = [255, 255, 255]
    
    for y in range(0, TARGET_HEIGHT, 10):
        for x in range(TARGET_WIDTH):
            pixels[y, x] = [255, 255, 255]
    
    test_image = Image.fromarray(pixels.astype('uint8'))
    
    # 确保输出目录存在
    if not os.path.exists(OUTPUT_PATH):
        os.makedirs(OUTPUT_PATH)
    
    # 处理测试图片
    print("处理测试图片...")
    test_name = "test_pattern.png"
    
    # 直接处理内存中的图片
    try:
        # 根据颜色格式转换数据
        width, height = test_image.size
        pixel_data = []
        
        if COLOR_FORMAT == "BW":
            # 黑白格式(1位)
            for y in range(height):
                for x in range(width):
                    r, g, b = test_image.getpixel((x, y))
                    bw_value = rgb_to_bw(r, g, b, threshold=128)
                    pixel_data.append(bw_value)
            
            data_bits = 1
            format_suffix = "bw"
        else:
            # RGB332格式(8位)
            for y in range(height):
                for x in range(width):
                    r, g, b = test_image.getpixel((x, y))
                    rgb332_value = rgb888_to_rgb332(r, g, b)
                    pixel_data.append(rgb332_value)
            
            data_bits = 8
            format_suffix = "rgb332"
        
        # 生成输出文件名
        base_name = "test_pattern"
        hex_filename = f"{base_name}_{TARGET_WIDTH}x{TARGET_HEIGHT}_{format_suffix}.hex"
        hex_path = os.path.join(OUTPUT_PATH, hex_filename)
        
        # 写入HEX文件
        write_hex_file(hex_path, pixel_data, data_bits)
        print(f"✓ 生成HEX文件: {hex_filename}")
        
        # 生成Verilog ROM模块
        v_filename = f"{base_name}_{TARGET_WIDTH}x{TARGET_HEIGHT}_rom.v"
        v_path = os.path.join(OUTPUT_PATH, v_filename)
        generate_verilog_rom(v_path, base_name, pixel_data, TARGET_WIDTH, TARGET_HEIGHT, data_bits)
        print(f"✓ 生成Verilog模块: {v_filename}")
        
        print(f"\n✓ 测试图片处理完成！文件保存在: {OUTPUT_PATH}")
        return True
        
    except Exception as e:
        print(f"✗ 处理测试图片时出错: {e}")
        return False

def write_hex_file(hex_path, pixel_data, data_bits=8):
    """
    写入Intel HEX格式文件
    data_bits: 数据位宽，8位用于RGB332，1位用于黑白
    """
    with open(hex_path, 'w') as f:
        # Intel HEX文件头
        f.write(":020000040000FA\n")  # 扩展地址记录
        
        if data_bits == 1:
            # 黑白格式：将8个1位像素打包成1个字节
            packed_data = []
            for i in range(0, len(pixel_data), 8):
                byte_val = 0
                for j in range(8):
                    if i + j < len(pixel_data):
                        if pixel_data[i + j]:
                            byte_val |= (1 << (7 - j))
                packed_data.append(byte_val)
            pixel_data = packed_data
        
        # 数据记录
        addr = 0
        for i in range(0, len(pixel_data), 16):
            chunk = pixel_data[i:i+16]
            if len(chunk) < 16:
                chunk.extend([0] * (16 - len(chunk)))  # 填充到16字节
            
            # 计算校验和
            data_bytes = [len(chunk), (addr >> 8) & 0xFF, addr & 0xFF, 0x00] + chunk
            checksum = (256 - sum(data_bytes)) & 0xFF
            
            # 写入记录
            hex_line = f":{len(chunk):02X}{addr:04X}00"
            for byte_val in chunk:
                hex_line += f"{byte_val:02X}"
            hex_line += f"{checksum:02X}\n"
            
            f.write(hex_line)
            addr += len(chunk)
        
        # 结束记录
        f.write(":00000001FF\n")

def generate_verilog_rom(v_path, module_name, pixel_data, width, height, data_bits=8):
    """
    生成Verilog ROM模块
    data_bits: 数据位宽，8位用于RGB332，1位用于黑白
    """
    if data_bits == 1:
        # 黑白格式：将8个1位像素打包成1个字节
        packed_data = []
        for i in range(0, len(pixel_data), 8):
            byte_val = 0
            for j in range(8):
                if i + j < len(pixel_data):
                    if pixel_data[i + j]:
                        byte_val |= (1 << (7 - j))
            packed_data.append(byte_val)
        
        total_bytes = len(packed_data)
        addr_bits = max(1, (total_bytes - 1).bit_length())
        data_width = 8  # 输出仍然是8位，但每字节包含8个像素
    else:
        # RGB332格式：每个像素8位
        packed_data = pixel_data
        total_bytes = len(packed_data)
        addr_bits = max(1, (total_bytes - 1).bit_length())
        data_width = 8
    
    with open(v_path, 'w') as f:
        f.write(f"// 自动生成的ROM模块\n")
        f.write(f"// 图片尺寸: {width} x {height}\n")
        f.write(f"// 颜色格式: {'黑白(1位)' if data_bits == 1 else 'RGB332(8位)'}\n")
        f.write(f"// 数据大小: {total_bytes} 字节\n")
        f.write(f"// 生成工具: {os.path.basename(__file__)}\n\n")
        
        f.write(f"module {module_name}_rom (\n")
        f.write(f"    input wire clk,\n")
        f.write(f"    input wire [{addr_bits-1}:0] addr,\n")
        f.write(f"    output reg [{data_width-1}:0] data\n")
        f.write(f");\n\n")
        
        f.write(f"    // ROM数据存储 ({len(packed_data)} 个地址)\n")
        f.write(f"    always @(posedge clk) begin\n")
        f.write(f"        case (addr)\n")
        
        for i, pixel in enumerate(packed_data):
            f.write(f"            {addr_bits}'d{i}: data <= {data_width}'h{pixel:02X};\n")
        
        f.write(f"            default: data <= {data_width}'h00;\n")
        f.write(f"        endcase\n")
        f.write(f"    end\n\n")
        f.write(f"endmodule\n")

def main():
    """
    主函数
    """
    print("=" * 60)
    print("STEP-MAX10 图片转HEX工具")
    print(f"目标格式: {TARGET_WIDTH}×{TARGET_HEIGHT} {'黑白(1位)' if COLOR_FORMAT == 'BW' else 'RGB332(8位)'}")
    print("=" * 60)
    
    # 检查输入目录
    print(f"检查输入目录: {INPUT_PATH}")
    if not os.path.exists(INPUT_PATH):
        print(f"警告: 输入路径不存在，创建测试图片")
        # 创建一个测试图片
        create_test_image()
        return
    
    # 检查输出目录
    if not os.path.exists(OUTPUT_PATH):
        os.makedirs(OUTPUT_PATH)
        print(f"创建输出目录: {OUTPUT_PATH}")
    
    # 获取第一张图片
    first_image_path = get_first_image(INPUT_PATH)
    if not first_image_path:
        print("未找到图片，创建测试图片")
        create_test_image()
        return
    
    image_name = os.path.basename(first_image_path)
    print(f"找到第一张图片: {image_name}")
    
    # 处理图片
    success = process_single_image(first_image_path, OUTPUT_PATH, image_name)
    
    if success:
        print("\n" + "=" * 60)
        print("✓ 处理完成！")
        print(f"输出位置: {OUTPUT_PATH}")
        print("文件列表:")
        
        # 列出生成的文件
        base_name = os.path.splitext(image_name)[0]
        format_suffix = "bw" if COLOR_FORMAT == "BW" else "rgb332"
        hex_file = f"{base_name}_{TARGET_WIDTH}x{TARGET_HEIGHT}_{format_suffix}.hex"
        v_file = f"{base_name}_{TARGET_WIDTH}x{TARGET_HEIGHT}_rom.v"
        
        print(f"  - {hex_file}")
        print(f"  - {v_file}")
        print("\n可以在Quartus中使用这些文件进行测试。")
    else:
        print("\n" + "=" * 60)
        print("✗ 处理失败，请检查输入文件。")

if __name__ == "__main__":
    main()
