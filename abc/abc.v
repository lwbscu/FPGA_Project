module abc(
    input A,
    input B,
    input C, 
    output Result
);
    assign Result = ~(A | B) ^ C; // 异或逻辑
endmodule