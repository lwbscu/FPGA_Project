#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
批量图片处理脚本 - 用于快速处理多张图片
支持不同尺寸的测试：80x60, 160x120等
"""

import os
import sys
import glob
from PIL import Image, ImageFilter, ImageEnhance
import numpy as np

# 可配置参数
CONFIGS = {
    "small": {"width": 80, "height": 60, "format": "RGB332"},
    "medium": {"width": 160, "height": 120, "format": "RGB332"},
    "large": {"width": 240, "height": 180, "format": "RGB565"}
}

# 路径配置
INPUT_PATH = r"C:\Users\m1770\Desktop\图片素材"
OUTPUT_PATH = r"D:\Quartus_Project\ballplayer\rom_data"

def rgb888_to_rgb332(r, g, b):
    """RGB888转RGB332"""
    r3 = (r >> 5) & 0x07
    g3 = (g >> 5) & 0x07  
    b2 = (b >> 6) & 0x03
    return (r3 << 5) | (g3 << 2) | b2

def rgb888_to_rgb565(r, g, b):
    """RGB888转RGB565"""
    r5 = (r >> 3) & 0x1F
    g6 = (g >> 2) & 0x3F
    b5 = (b >> 3) & 0x1F
    return (r5 << 11) | (g6 << 5) | b5

def enhance_image_clarity(image):
    """增强图像清晰度"""
    sharpening_filter = ImageFilter.UnsharpMask(radius=1, percent=150, threshold=1)
    image = image.filter(sharpening_filter)
    
    enhancer = ImageEnhance.Contrast(image)
    image = enhancer.enhance(1.2)
    
    enhancer = ImageEnhance.Sharpness(image)
    image = enhancer.enhance(1.3)
    
    return image

def resize_image_with_aspect_ratio(image, target_width, target_height):
    """保持宽高比缩放"""
    original_width, original_height = image.size
    
    scale_w = target_width / original_width
    scale_h = target_height / original_height
    scale = min(scale_w, scale_h)
    
    new_width = int(original_width * scale)
    new_height = int(original_height * scale)
    
    resized = image.resize((new_width, new_height), Image.Resampling.LANCZOS)
    result = Image.new('RGB', (target_width, target_height), (0, 0, 0))
    
    x_offset = (target_width - new_width) // 2
    y_offset = (target_height - new_height) // 2
    
    result.paste(resized, (x_offset, y_offset))
    return result

def process_image_batch(config_name="small", max_images=5):
    """批量处理图片"""
    config = CONFIGS[config_name]
    width = config["width"]
    height = config["height"]
    color_format = config["format"]
    
    print(f"批量处理模式: {config_name}")
    print(f"目标尺寸: {width}x{height}")
    print(f"颜色格式: {color_format}")
    print("=" * 60)
    
    # 确保输出目录存在
    if not os.path.exists(OUTPUT_PATH):
        os.makedirs(OUTPUT_PATH)
    
    # 获取图片文件列表
    image_files = []
    extensions = ['*.jpg', '*.jpeg', '*.png', '*.bmp', '*.gif']
    
    for ext in extensions:
        pattern = os.path.join(INPUT_PATH, ext)
        image_files.extend(glob.glob(pattern))
        image_files.extend(glob.glob(pattern.upper()))
    
    if not image_files:
        print(f"未在 {INPUT_PATH} 中找到图片文件")
        return
    
    # 处理前几张图片
    image_files.sort()
    process_count = min(max_images, len(image_files))
    
    for i, image_path in enumerate(image_files[:process_count]):
        image_name = os.path.basename(image_path)
        print(f"处理第 {i+1}/{process_count} 张: {image_name}")
        
        try:
            # 打开并处理图片
            image = Image.open(image_path)
            if image.mode != 'RGB':
                image = image.convert('RGB')
            
            # 增强清晰度
            image = enhance_image_clarity(image)
            
            # 缩放到目标尺寸
            image = resize_image_with_aspect_ratio(image, width, height)
            
            # 转换颜色格式
            pixel_data = []
            for y in range(height):
                for x in range(width):
                    r, g, b = image.getpixel((x, y))
                    if color_format == "RGB332":
                        pixel_value = rgb888_to_rgb332(r, g, b)
                        data_width = 8
                    else:  # RGB565
                        pixel_value = rgb888_to_rgb565(r, g, b)
                        data_width = 16
                    pixel_data.append(pixel_value)
            
            # 生成文件
            base_name = os.path.splitext(image_name)[0]
            
            # HEX文件
            hex_filename = f"{base_name}_{width}x{height}_{color_format.lower()}.hex"
            hex_path = os.path.join(OUTPUT_PATH, hex_filename)
            write_hex_file(hex_path, pixel_data, data_width)
            
            # Verilog ROM文件
            v_filename = f"{base_name}_{width}x{height}_rom.v"
            v_path = os.path.join(OUTPUT_PATH, v_filename)
            generate_verilog_rom(v_path, base_name, pixel_data, width, height, data_width)
            
            print(f"  ✓ 生成: {hex_filename}")
            print(f"  ✓ 生成: {v_filename}")
            
        except Exception as e:
            print(f"  ✗ 处理失败: {e}")
    
    print("\n" + "=" * 60)
    print(f"批量处理完成！处理了 {process_count} 张图片")
    print(f"输出目录: {OUTPUT_PATH}")

def write_hex_file(hex_path, pixel_data, data_width):
    """写入HEX文件"""
    with open(hex_path, 'w') as f:
        f.write(":020000040000FA\n")
        
        if data_width == 8:
            bytes_per_line = 16
        else:  # 16位
            bytes_per_line = 8
        
        addr = 0
        for i in range(0, len(pixel_data), bytes_per_line):
            chunk = pixel_data[i:i+bytes_per_line]
            
            if data_width == 8:
                data_bytes = chunk
            else:  # 16位，需要分解为字节
                data_bytes = []
                for val in chunk:
                    data_bytes.append(val & 0xFF)      # 低字节
                    data_bytes.append((val >> 8) & 0xFF)  # 高字节
            
            # 填充到完整长度
            while len(data_bytes) < bytes_per_line * (2 if data_width == 16 else 1):
                data_bytes.append(0)
            
            # 计算校验和
            byte_count = len(data_bytes)
            checksum_data = [byte_count, (addr >> 8) & 0xFF, addr & 0xFF, 0x00] + data_bytes
            checksum = (256 - sum(checksum_data)) & 0xFF
            
            # 写入记录
            hex_line = f":{byte_count:02X}{addr:04X}00"
            for byte_val in data_bytes:
                hex_line += f"{byte_val:02X}"
            hex_line += f"{checksum:02X}\n"
            
            f.write(hex_line)
            addr += byte_count
        
        f.write(":00000001FF\n")

def generate_verilog_rom(v_path, module_name, pixel_data, width, height, data_width):
    """生成Verilog ROM模块"""
    total_pixels = len(pixel_data)
    addr_bits = max(1, (total_pixels - 1).bit_length())
    
    with open(v_path, 'w') as f:
        f.write(f"// 自动生成的ROM模块\n")
        f.write(f"// 图片: {module_name}\n") 
        f.write(f"// 尺寸: {width} x {height}\n")
        f.write(f"// 数据宽度: {data_width}位\n")
        f.write(f"// 总像素: {total_pixels}\n\n")
        
        f.write(f"module {module_name}_rom (\n")
        f.write(f"    input wire clk,\n")
        f.write(f"    input wire [{addr_bits-1}:0] addr,\n")
        f.write(f"    output reg [{data_width-1}:0] data\n")
        f.write(f");\n\n")
        
        f.write(f"    always @(posedge clk) begin\n")
        f.write(f"        case (addr)\n")
        
        for i, pixel in enumerate(pixel_data):
            f.write(f"            {addr_bits}'d{i}: data <= {data_width}'h{pixel:0{data_width//4}X};\n")
        
        f.write(f"            default: data <= {data_width}'h{0:0{data_width//4}X};\n")
        f.write(f"        endcase\n")
        f.write(f"    end\n\n")
        f.write(f"endmodule\n")

def main():
    """主函数"""
    if len(sys.argv) > 1:
        config_name = sys.argv[1]
        if config_name not in CONFIGS:
            print(f"不支持的配置: {config_name}")
            print(f"可用配置: {list(CONFIGS.keys())}")
            return
    else:
        config_name = "small"
    
    max_images = 3 if len(sys.argv) <= 2 else int(sys.argv[2])
    
    process_image_batch(config_name, max_images)

if __name__ == "__main__":
    main()
