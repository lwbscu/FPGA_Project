// --------------------------------------------------------------------
// Module: music_controller
// Description: 蜂鸣器音乐播放控制，支持多首音乐
// --------------------------------------------------------------------
module music_controller(
    input           clk,
    input           rst_n,
    input   [3:0]   music_select,   // 音乐选择
    input           play_enable,    // 播放使能
    input   [7:0]   volume,         // 音量控制
    output          beeper_out      // 蜂鸣器输出
);

// 音符频率定义（音阶）
parameter DO_L  = 16'd45872;  // 低音Do - 261.6Hz
parameter RE_L  = 16'd40858;  // 低音Re - 293.6Hz
parameter MI_L  = 16'd36408;  // 低音Mi - 329.6Hz
parameter FA_L  = 16'd34364;  // 低音Fa - 349.2Hz
parameter SO_L  = 16'd30612;  // 低音So - 392.0Hz
parameter LA_L  = 16'd27273;  // 低音La - 440.0Hz
parameter SI_L  = 16'd24296;  // 低音Si - 493.8Hz
parameter DO_M  = 16'd22931;  // 中音Do - 523.2Hz
parameter RE_M  = 16'd20432;  // 中音Re
parameter MI_M  = 16'd18201;  // 中音Mi
parameter FA_M  = 16'd17180;  // 中音Fa
parameter SO_M  = 16'd15306;  // 中音So
parameter LA_M  = 16'd13636;  // 中音La
parameter SI_M  = 16'd12148;  // 中音Si
parameter DO_H  = 16'd11478;  // 高音Do
parameter PAUSE = 16'd0;       // 休止符

// 节拍定义
parameter BEAT_1  = 24'd6000000;   // 全音符 (500ms @ 12MHz)
parameter BEAT_2  = 24'd3000000;   // 二分音符
parameter BEAT_4  = 24'd1500000;   // 四分音符
parameter BEAT_8  = 24'd750000;    // 八分音符
parameter BEAT_16 = 24'd375000;    // 十六分音符

// 音乐存储器
reg [15:0] note_rom [0:255];       // 音符ROM
reg [23:0] beat_rom [0:255];       // 节拍ROM
reg [7:0]  song_length [0:3];      // 每首歌的长度

// 初始化音乐数据
initial begin
    // 歌曲1：小星星
    song_length[0] = 8'd42;
    // Do Do So So La La So
    note_rom[0] = DO_M; beat_rom[0] = BEAT_4;
    note_rom[1] = DO_M; beat_rom[1] = BEAT_4;
    note_rom[2] = SO_M; beat_rom[2] = BEAT_4;
    note_rom[3] = SO_M; beat_rom[3] = BEAT_4;
    note_rom[4] = LA_M; beat_rom[4] = BEAT_4;
    note_rom[5] = LA_M; beat_rom[5] = BEAT_4;
    note_rom[6] = SO_M; beat_rom[6] = BEAT_2;
    // Fa Fa Mi Mi Re Re Do
    note_rom[7] = FA_M; beat_rom[7] = BEAT_4;
    note_rom[8] = FA_M; beat_rom[8] = BEAT_4;
    note_rom[9] = MI_M; beat_rom[9] = BEAT_4;
    note_rom[10] = MI_M; beat_rom[10] = BEAT_4;
    note_rom[11] = RE_M; beat_rom[11] = BEAT_4;
    note_rom[12] = RE_M; beat_rom[12] = BEAT_4;
    note_rom[13] = DO_M; beat_rom[13] = BEAT_2;
    
    // 歌曲2：生日快乐
    song_length[1] = 8'd25;
    note_rom[64] = SO_L; beat_rom[64] = BEAT_8;
    note_rom[65] = SO_L; beat_rom[65] = BEAT_8;
    note_rom[66] = LA_L; beat_rom[66] = BEAT_4;
    note_rom[67] = SO_L; beat_rom[67] = BEAT_4;
    note_rom[68] = DO_M; beat_rom[68] = BEAT_4;
    note_rom[69] = SI_L; beat_rom[69] = BEAT_2;
    
    // 歌曲3：欢乐颂片段
    song_length[2] = 8'd16;
    note_rom[128] = MI_M; beat_rom[128] = BEAT_4;
    note_rom[129] = MI_M; beat_rom[129] = BEAT_4;
    note_rom[130] = FA_M; beat_rom[130] = BEAT_4;
    note_rom[131] = SO_M; beat_rom[131] = BEAT_4;
    note_rom[132] = SO_M; beat_rom[132] = BEAT_4;
    note_rom[133] = FA_M; beat_rom[133] = BEAT_4;
    note_rom[134] = MI_M; beat_rom[134] = BEAT_4;
    note_rom[135] = RE_M; beat_rom[135] = BEAT_4;
    
    // 填充其余为静音
    song_length[3] = 8'd1;
    note_rom[192] = PAUSE; beat_rom[192] = BEAT_1;
end

// 播放控制
reg [7:0]  note_index;          // 当前音符索引
reg [23:0] beat_counter;        // 节拍计数器
reg [15:0] current_cycle;       // 当前音符周期
reg [23:0] current_beat;        // 当前节拍长度
reg [7:0]  song_start_addr;     // 歌曲起始地址
reg        playing;             // 播放状态

// 歌曲地址映射
always @(*) begin
    case (music_select[1:0])
        2'b00: song_start_addr = 8'd0;   // 小星星
        2'b01: song_start_addr = 8'd64;  // 生日快乐
        2'b10: song_start_addr = 8'd128; // 欢乐颂
        2'b11: song_start_addr = 8'd192; // 静音
    endcase
end

// 播放状态机
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        note_index <= 8'd0;
        beat_counter <= 24'd0;
        current_cycle <= 16'd0;
        current_beat <= 24'd0;
        playing <= 1'b0;
    end else if (play_enable) begin
        if (!playing) begin
            // 开始播放
            playing <= 1'b1;
            note_index <= 8'd0;
            beat_counter <= 24'd0;
            current_cycle <= note_rom[song_start_addr];
            current_beat <= beat_rom[song_start_addr];
        end else begin
            // 节拍计数
            if (beat_counter >= current_beat - 1) begin
                beat_counter <= 24'd0;
                // 切换到下一个音符
                if (note_index >= song_length[music_select[1:0]] - 1) begin
                    note_index <= 8'd0; // 循环播放
                end else begin
                    note_index <= note_index + 1'b1;
                end
                current_cycle <= note_rom[song_start_addr + note_index + 1];
                current_beat <= beat_rom[song_start_addr + note_index + 1];
            end else begin
                beat_counter <= beat_counter + 1'b1;
            end
        end
    end else begin
        playing <= 1'b0;
        note_index <= 8'd0;
        beat_counter <= 24'd0;
    end
end

// PWM生成器（带音量控制）
wire [15:0] pwm_duty;
assign pwm_duty = (current_cycle == 16'd0) ? 16'd0 : 
                  (current_cycle >> (8 - volume[2:0])); // 简单音量控制

pwm #(.WIDTH(16)) pwm_inst(
    .clk(clk),
    .rst_n(rst_n),
    .cycle(current_cycle),
    .duty(pwm_duty),
    .pwm_out(beeper_out)
);

endmodule