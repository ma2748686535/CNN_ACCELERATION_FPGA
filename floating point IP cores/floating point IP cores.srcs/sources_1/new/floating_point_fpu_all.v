module fpu_32 (
    input         clk,
    input         rst_n,
    input         mul_enable,
    input         add_enable,
    input  [31:0] data_a,
    input  [31:0] data_b,
    input  [31:0] partial_sum,
    output reg [31:0] multi_res,
    output reg [31:0] add_results,
    output        mul_valid,
    output        add_valid_out,
    output        mul_ready,
    output        add_ready,
    input         mul_ack,
    input         add_ack
);

    // ------------------ 内部信号 ------------------
    wire        mul_ip_valid;
    wire        add_ip_valid;
    wire [31:0] mul_result_internal;
    wire [31:0] add_result_internal;

    wire [7:0] op_code = 8'd0;

    // ------------------ 乘法器 ------------------
    floating_point_multiply u_mul (
        .aclk(clk),
        .s_axis_a_tvalid(mul_enable),
        .s_axis_a_tready(mul_ready),
        .s_axis_a_tdata(data_a),
        .s_axis_b_tvalid(mul_enable),
        .s_axis_b_tready(), 
        .s_axis_b_tdata(data_b),
        .m_axis_result_tvalid(mul_ip_valid),
        .m_axis_result_tready(1'b1),
        .m_axis_result_tdata(mul_result_internal)
    );

    assign mul_valid = mul_ip_valid;

    // ? 锁存 mul 输出，仅在 valid=1 时更新
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            multi_res <= 32'b0;
        else if (mul_ip_valid)
            multi_res <= mul_result_internal;
    end

    // ------------------ 加法器 ------------------
    floating_point_add_and_sub u_add (
        .aclk(clk),
        .s_axis_a_tvalid(add_enable),
        .s_axis_a_tready(add_ready),
        .s_axis_a_tdata(mul_result_internal),
        .s_axis_b_tvalid(add_enable),
        .s_axis_b_tready(),
        .s_axis_b_tdata(partial_sum),
        .s_axis_operation_tvalid(add_enable),
        .s_axis_operation_tready(),
        .s_axis_operation_tdata(op_code),
        .m_axis_result_tvalid(add_ip_valid),
        .m_axis_result_tready(1'b1),
        .m_axis_result_tdata(add_result_internal)
    );

    assign add_valid_out = add_ip_valid;

    // ? 锁存 add 输出，仅在 valid=1 时更新
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            add_results <= 32'b0;
        else if (add_ip_valid)
            add_results <= add_result_internal;
    end

endmodule
