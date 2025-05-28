# ballplayer项目引脚配置总结

## 基于用户提供的引脚文档的配置

### 系统时钟和复位
| 信号名 | 引脚号 | 说明 |
|--------|--------|------|
| clk | PIN_J5 | 12MHz系统时钟 |
| rst_n | PIN_J14 | 低电平复位信号 |

### LCD显示接口（SPI）
| 信号名 | 引脚号 | 说明 |
|--------|--------|------|
| lcd_rst | PIN_P15 | LCD复位 |
| lcd_blk | PIN_D7 | LCD背光控制 |
| lcd_dc | PIN_R14 | 数据/命令选择 |
| lcd_sclk | PIN_R11 | SPI时钟 |
| lcd_mosi | PIN_P12 | SPI数据输出 |
| lcd_cs | PIN_R9 | LCD片选 |

### ADC接口
| 信号名 | 引脚号 | 说明 |
|--------|--------|------|
| adc_cs | PIN_B7 | ADC片选 |
| adc_clk | PIN_B8 | ADC时钟 |
| adc_dat | PIN_C8 | ADC数据 |

### I2C接口（手势传感器）
| 信号名 | 引脚号 | 说明 |
|--------|--------|------|
| i2c_scl | PIN_M4 | I2C时钟线 |
| i2c_sda | PIN_P3 | I2C数据线 |

### 按键输入
| 信号名 | 引脚号 | 说明 |
|--------|--------|------|
| key_up | PIN_J9 | 向上调节按键（KEY1） |
| key_down | PIN_K14 | 向下调节按键（KEY2） |
| ball_release_button | PIN_J11 | 球释放按键（KEY3） |

### LED指示灯
| 信号名 | 引脚号 | 功能说明 |
|--------|--------|----------|
| led[0] | PIN_N15 | LCD工作状态（led_status[0]） |
| led[1] | PIN_N14 | LCD初始化状态（led_status[1]） |
| led[2] | PIN_M14 | 传感器数据有效（dat_valid） |
| led[3] | PIN_M12 | 手势检测（handline > 10） |
| led[4] | PIN_L15 | ADC采样完成（adc_done） |
| led[5] | PIN_K12 | 游戏结束标志（over_flag） |
| led[6] | PIN_L11 | 游戏停止标志（stop_flag） |
| led[7] | PIN_K11 | 预留 |

### 双七段数码管
根据引脚文档配置的双七段数码管：

#### 第一个数码管（seg_led_1[8:0]）
| 信号名 | 引脚号 | 段位 |
|--------|--------|------|
| seg_led_1[0] | PIN_E1 | a段 |
| seg_led_1[1] | PIN_D2 | b段 |
| seg_led_1[2] | PIN_K2 | c段 |
| seg_led_1[3] | PIN_J2 | d段 |
| seg_led_1[4] | PIN_G2 | e段 |
| seg_led_1[5] | PIN_F5 | f段 |
| seg_led_1[6] | PIN_G5 | g段 |
| seg_led_1[7] | PIN_L1 | dp小数点 |
| seg_led_1[8] | PIN_E2 | 公共端 |

#### 第二个数码管（seg_led_2[8:0]）
| 信号名 | 引脚号 | 段位 |
|--------|--------|------|
| seg_led_2[0] | PIN_A3 | a段 |
| seg_led_2[1] | PIN_A2 | b段 |
| seg_led_2[2] | PIN_P2 | c段 |
| seg_led_2[3] | PIN_P1 | d段 |
| seg_led_2[4] | PIN_N1 | e段 |
| seg_led_2[5] | PIN_C1 | f段 |
| seg_led_2[6] | PIN_C2 | g段 |
| seg_led_2[7] | PIN_R2 | dp小数点 |
| seg_led_2[8] | PIN_B1 | 公共端 |

## 调试功能说明

### LED状态指示含义
现在有8个LED可以帮助您调试：

1. **led[0]**：LCD工作状态 - 应该在LCD非复位状态时亮起
2. **led[1]**：LCD初始化状态 - 应该在初始化完成后亮起
3. **led[2]**：传感器数据有效 - 当I2C传感器数据更新时闪烁
4. **led[3]**：手势检测 - 当检测到手势位置>10时亮起
5. **led[4]**：ADC采样完成 - ADC每次采样完成时闪烁
6. **led[5]**：游戏结束标志
7. **led[6]**：游戏停止标志
8. **led[7]**：预留

### LCD调试模块（lcd_debug_test.v）
新创建的LCD调试模块具有以下特点：
- 简化的初始化流程
- 明确的状态指示
- 基本的白色填充测试
- 详细的LED状态反馈

## 编译和测试步骤

1. **在Quartus Prime中打开ballplayer.qpf**
2. **检查引脚分配是否与硬件匹配**
3. **编译项目**
4. **观察LED状态：**
   - led[0]应该亮起（LCD工作）
   - led[1]应该在初始化完成后亮起
   - 其他LED根据功能状态变化

5. **LCD显示测试：**
   - 应该显示白色背景而不是深蓝色
   - 如果仍显示深蓝色，可能是硬件连接问题

## 可能的问题排查

1. **如果LCD仍显示深蓝色：**
   - 检查SPI引脚连接
   - 检查电源和复位信号
   - 验证LCD控制器类型（ST7789V）

2. **如果LED不按预期工作：**
   - 检查LED引脚配置
   - 验证LED极性（共阳极或共阴极）

3. **编译错误：**
   - 检查是否所有源文件都已添加到项目
   - 验证器件配置（10M08SAM153C8G）
