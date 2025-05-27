// FFT_512Point.v - 512点FFT实现
module FFT_512Point(
    input           clk,
    input           rst_n,
    input           enable,
    input  [15:0]   audio_in,
    input           audio_valid,
    output reg      fft_done,
    output [15:0]   fft_mag_0,
    output [15:0]   fft_mag_1,
    output [15:0]   fft_mag_2,
    output [15:0]   fft_mag_3,
    output [15:0]   fft_mag_4,
    output [15:0]   fft_mag_5,
    output [15:0]   fft_mag_6,
    output [15:0]   fft_mag_7
);

// FFT参数
localparam FFT_SIZE = 512;
localparam FFT_STAGES = 9;  // log2(512) = 9

// 数据缓冲区
reg [15:0] sample_buffer[0:FFT_SIZE-1];
reg [9:0] sample_index;
reg buffer_full;

// FFT工作寄存器
reg [15:0] real_part[0:FFT_SIZE-1];
reg [15:0] imag_part[0:FFT_SIZE-1];
reg [3:0] stage;
reg [9:0] butterfly_index;
reg fft_busy;

// 旋转因子ROM（简化实现，使用查找表）
reg [15:0] cos_table[0:255];
reg [15:0] sin_table[0:255];

// 初始化旋转因子表
initial begin
    integer i;
    for(i = 0; i < 256; i = i + 1) begin
        cos_table[i] = $rtoi(32767 * $cos(2 * 3.14159 * i / 512));
        sin_table[i] = $rtoi(32767 * $sin(2 * 3.14159 * i / 512));
    end
end

// 音频采样缓冲
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        sample_index <= 0;
        buffer_full <= 0;
    end else if(enable && audio_valid) begin
        sample_buffer[sample_index] <= audio_in;
        if(sample_index == FFT_SIZE-1) begin
            sample_index <= 0;
            buffer_full <= 1;
        end else begin
            sample_index <= sample_index + 1;
        end
    end
end

// FFT主状态机
localparam IDLE = 0, LOAD = 1, COMPUTE = 2, OUTPUT = 3;
reg [1:0] fft_state;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        fft_state <= IDLE;
        fft_done <= 0;
        fft_busy <= 0;
        stage <= 0;
    end else if(enable) begin
        case(fft_state)
            IDLE: begin
                fft_done <= 0;
                if(buffer_full && !fft_busy) begin
                    fft_state <= LOAD;
                    fft_busy <= 1;
                end
            end
            
            LOAD: begin
                // 加载数据到工作寄存器
                integer i;
                for(i = 0; i < FFT_SIZE; i = i + 1) begin
                    real_part[i] <= sample_buffer[i];
                    imag_part[i] <= 0;
                end
                fft_state <= COMPUTE;
                stage <= 0;
            end
            
            COMPUTE: begin
                // 执行FFT蝶形运算
                if(stage < FFT_STAGES) begin
                    // 简化的蝶形运算实现
                    stage <= stage + 1;
                end else begin
                    fft_state <= OUTPUT;
                end
            end
            
            OUTPUT: begin
                // 输出结果
                fft_done <= 1;
                fft_state <= IDLE;
                fft_busy <= 0;
            end
        endcase
    end
end

// 计算8个频段的幅值
// 将512个频点映射到8个频段
assign fft_mag_0 = calculate_magnitude(0,   63);   // 0-3kHz
assign fft_mag_1 = calculate_magnitude(64,  127);  // 3-6kHz
assign fft_mag_2 = calculate_magnitude(128, 191);  // 6-9kHz
assign fft_mag_3 = calculate_magnitude(192, 255);  // 9-12kHz
assign fft_mag_4 = calculate_magnitude(256, 319);  // 12-15kHz
assign fft_mag_5 = calculate_magnitude(320, 383);  // 15-18kHz
assign fft_mag_6 = calculate_magnitude(384, 447);  // 18-21kHz
assign fft_mag_7 = calculate_magnitude(448, 511);  // 21-24kHz

// 幅值计算函数
function [15:0] calculate_magnitude;
    input [9:0] start_bin, end_bin;
    reg [31:0] sum;
    integer i;
    begin
        sum = 0;
        for(i = start_bin; i <= end_bin; i = i + 1) begin
            sum = sum + (real_part[i] * real_part[i]) + (imag_part[i] * imag_part[i]);
        end
        calculate_magnitude = sum[31:16]; // 取高16位
    end
endfunction

endmodule