module edge_detect(clk, rst_n, signal, up_edge);

    input clk;
    input signal;
    input rst_n;
    output up_edge;

    reg signal_r;

    // ͬ���źŵ��Ĵ���
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            signal_r <= 1'b0;
        else
            signal_r <= signal;
    end

    // �����ؼ���߼�
    assign up_edge = !signal_r & signal;

endmodule