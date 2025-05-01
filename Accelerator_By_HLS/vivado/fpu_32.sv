module fpu_32(
    input logic clk,
    input logic rst_n,
    input logic mul_enable,
    input logic add_enable,
    input logic data_a_valid,
    input logic [31:0] data_a,
    input logic data_b_valid,
    input logic [31:0] data_b,
    input logic partial_sum_valid,
    input logic [31:0] partial_sum,
    output logic [31:0] multi_res,
    output logic [31:0] add_results,
    output logic mul_valid,
    // output logic add_valid, // Replaced by add_valid_out
    output wire add_valid_out, // Final addition valid output
    //handshake
    output logic mul_ready,
    output logic add_ready,
    input logic mul_ack,
    input logic add_ack
);
    // 32位浮点乘加运算(A×B+C)实现步骤：
    // 1. IEEE-754格式分解
    // [31]    [30:23]    [22:0]
    // 符号位   指数位     尾数位
    // 2. 乘法部分(A×B)：
    // - 符号位：A符号 XOR B符号
    // - 指数位：A指数 + B指数 - 127(偏置)
    // - 尾数位：(1.A尾数 × 1.B尾数)，得48位结果
    // - 规范化：若结果最高位为1，右移一位并指数+1
    // 3. 加法部分(AB+C)：
    // - 比较乘法结果与C的指数
    // - 小指数的数右移对齐
    // - 对齐后执行加/减（基于符号）
    // - 规范化结果（左移或右移）
    // 4. 计算过程：
    // a. 提取各部分：符号、指数、尾数
    // b. 乘法：处理符号、指数相加、尾数相乘
    // c. 规范化乘法结果
    // d. 对齐加数：比较指数，移位对齐
    // e. 执行加法：基于符号决定加/减
    // f. 最终规范化和舍入

    // Input signal decomposition
    wire sign_A = data_a[31];
    wire sign_B = data_b[31];
    wire sign_C = partial_sum[31];
    wire [7:0] index_A = data_a[30:23];
    wire [7:0] index_B = data_b[30:23];
    wire [7:0] index_C = partial_sum[30:23];
    wire [22:0] fraction_C = partial_sum[22:0];

    // Multiplication pipeline registers
    reg sign_res;
    reg [7:0] index_res;
    reg [47:0] fraction_res;
    reg [31:0] multi_res_temp;
    reg mul_stage1_valid;
    reg mul_stage2_valid;

    // Addition pipeline registers
    reg [1:0] add_case;
    reg [71:0] tem_sum; // Temporary sum for fraction part
    reg [71:0] align; // Aligned fraction
    reg add_stage1_valid;
    reg add_stage2_valid;

    // Registers for holding intermediate results between stages/operations
    reg [47:0] fraction_res_d; // Hold multiplication fraction result for adder
    reg [7:0] index_res_d;    // Hold multiplication index result for adder
    reg sign_res_d;         // Hold multiplication sign result for adder
    reg [1:0] add_case_d;     // Hold adder case between stage 1 and 2
    reg [71:0] align_d;        // Hold aligned fraction between stage 1 and 2
    reg [71:0] tem_sum_d;      // Hold temporary sum between stage 2 and 3
    reg [31:0] multi_res_temp_d; // Hold multiplication result before output

    // Handshake and valid hold logic
    reg mul_valid_hold;   // Extend mul_valid duration if needed
    reg add_valid_hold;   // Extend add_valid duration until ack
    logic add_valid;      // Internal signal for add valid state

    // 添加规格化检查信号
    wire is_denormal_a = (index_A == 0);
    wire is_denormal_b = (index_B == 0);
    wire is_denormal_c = (index_C == 0);
    wire is_inf_a = (index_A == 8'hFF);
    wire is_inf_b = (index_B == 8'hFF);
    wire is_inf_c = (index_C == 8'hFF);
    wire is_nan_a = (index_A == 8'hFF) && (data_a[22:0] != 0);
    wire is_nan_b = (index_B == 8'hFF) && (data_b[22:0] != 0);
    wire is_nan_c = (index_C == 8'hFF) && (partial_sum[22:0] != 0);

    // 修改尾数提取
    wire [23:0] mantissa_a = is_denormal_a ? {1'b0, data_a[22:0]} : {1'b1, data_a[22:0]};
    wire [23:0] mantissa_b = is_denormal_b ? {1'b0, data_b[22:0]} : {1'b1, data_b[22:0]};
    wire [23:0] mantissa_c = is_denormal_c ? {1'b0, partial_sum[22:0]} : {1'b1, partial_sum[22:0]};

    //==========================================
    //== Multiplication Pipeline: Stage 1 (Enable & Input Calculation)
    //==========================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sign_res <= 1'b0;
            index_res <= 8'b0;
            fraction_res <= 48'b0;
            mul_stage1_valid <= 1'b0;
            mul_ready <= 1'b1;
        end
        else if (mul_enable && mul_ready&&data_a_valid&&data_b_valid) begin
            // 处理特殊值
            if (is_nan_a || is_nan_b) begin
                sign_res <= 1'b0;
                index_res <= 8'hFF;
                fraction_res <= {1'b1, 47'b0}; // NaN
            end
            else if ((is_inf_a && !is_inf_b && !is_nan_b) || 
                     (!is_inf_a && !is_nan_a && is_inf_b)) begin
                sign_res <= sign_A ^ sign_B;
                index_res <= 8'hFF;
                fraction_res <= 48'b0; // Infinity
            end
            else if (is_denormal_a || is_denormal_b) begin
                sign_res <= sign_A ^ sign_B;
                index_res <= 8'b0;
                fraction_res <= mantissa_a * mantissa_b;
            end
            else begin
                sign_res <= sign_A ^ sign_B;
                index_res <= index_A + index_B - 8'd127;
                fraction_res <= mantissa_a * mantissa_b;
            end
            mul_stage1_valid <= 1'b1;
            mul_ready <= 1'b0;
        end
        else if (mul_ack && mul_valid) begin
            mul_ready <= 1'b1;
        end
        else begin
            mul_stage1_valid <= 1'b0;
        end
    end

    //==========================================
    //== Saving Multiplication Intermediate Results for Adder
    //==========================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            fraction_res_d <= 48'b0;
            index_res_d <= 8'b0;
            sign_res_d <= 1'b0;
            multi_res_temp_d <= 32'b0; // Although named temp, this holds the final mul result for adder
        end
        // Latch the result from stage 2 when it becomes valid
        else if (mul_stage2_valid) begin
            fraction_res_d <= fraction_res; // Latch result from stage 1 calculation
            index_res_d <= index_res;     // Latch result from stage 1 calculation
            sign_res_d <= sign_res;       // Latch result from stage 1 calculation
            multi_res_temp_d <= multi_res_temp; // Latch normalized result from stage 2
        end
        // Data held until next mul_stage2_valid
    end

    //==========================================
    //== Multiplication Pipeline: Stage 2 (Normalization)
    //==========================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            multi_res_temp <= 32'b0;
            mul_stage2_valid <= 1'b0;
        end
        else if (mul_stage1_valid) begin
            if (fraction_res[47]) begin  // 需要右移
                multi_res_temp <= {sign_res, index_res + 8'd1, fraction_res[46:24]};
            end
            else if (fraction_res[46:24] == 0) begin  // 结果是0
                multi_res_temp <= 32'b0;
            end
            else begin
                multi_res_temp <= {sign_res, index_res, fraction_res[45:23]};
            end
            mul_stage2_valid <= 1'b1;
        end
        else begin
            mul_stage2_valid <= 1'b0;
        end
    end

    //==========================================
    //== Multiplication Pipeline: Stage 3 (Output Valid & Result)
    //==========================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            multi_res <= 32'b0;
            mul_valid <= 1'b0;
        end
        else if (mul_stage2_valid) begin
            multi_res <= multi_res_temp; // Output the normalized result
            mul_valid <= 1'b1;           // Signal that result is valid
        end
        else if (mul_ack) begin // If acknowledged by external module
            mul_valid <= 1'b0; // Deassert valid signal
        end
        // If not stage2 valid and not ack, valid state persists (until ack or overwritten by new result)
        // If mul_stage2_valid and mul_ack are high simultaneously, ack takes precedence.
    end

    //==========================================
    //== Multiplication Valid Hold Logic
    //==========================================
    // Holds mul_valid high for one extra cycle if needed by adder, cleared by adder start or mul_ack
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mul_valid_hold <= 1'b0;
        end
        else if (mul_valid) begin // If multiplication becomes valid
            mul_valid_hold <= 1'b1;
        end
        else if (add_stage1_valid || mul_ack) begin // If adder starts using it OR mul is acknowledged
            mul_valid_hold <= 1'b0;
        end
        // Otherwise, hold state persists
    end

    //==========================================
    //== Addition Pipeline: Stage 1 (Enable, Alignment & Case)
    //==========================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            align <= 72'b0;
            add_stage1_valid <= 1'b0;
            add_case <= 2'b0;
            add_ready <= 1'b1;
        end
        else if (mul_valid_hold && add_enable && add_ready&&partial_sum_valid) begin
            add_case <= {(index_res_d > index_C), (sign_C == sign_res_d)};
            
            // 处理特殊值
            if (is_nan_c || is_nan_a || is_nan_b) begin
                align <= {1'b1, 71'b0}; // NaN
            end
            else if (is_inf_c || is_inf_a || is_inf_b) begin
                align <= {1'b0, 71'b0}; // Infinity
            end
            else begin
                case(add_case)
                    2'b00: // index_res_d <= index_C
                        align <= {fraction_res_d, 24'b0} >> (index_C - index_res_d);
                    2'b01: // index_res_d <= index_C
                        align <= {fraction_res_d, 24'b0} >> (index_C - index_res_d);
                    2'b10: // index_res_d > index_C
                        align <= {fraction_C, 48'b0} >> (index_res_d - index_C);
                    2'b11: // index_res_d > index_C
                        align <= {fraction_C, 48'b0} >> (index_res_d - index_C);
                endcase
            end
            add_stage1_valid <= 1'b1;
            add_ready <= 1'b0;
        end
        else if (add_ack && add_valid) begin
            add_ready <= 1'b1;
        end
        else begin
            add_stage1_valid <= 1'b0;
        end
    end

    //==========================================
    //== Saving Addition Intermediate Results (Stage 1 -> Stage 2)
    //==========================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            add_case_d <= 2'b0;
            align_d <= 72'b0;
        end
        else if (add_stage1_valid) begin
            add_case_d <= add_case;
            align_d <= align;
        end
    end

    //==========================================
    //== Saving Addition Intermediate Results (Stage 2 -> Stage 3)
    //==========================================
    // Save tem_sum
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tem_sum_d <= 72'b0;
        end
        else if (add_stage2_valid) begin
            tem_sum_d <= tem_sum;
        end
    end

    //==========================================
    //== Addition Pipeline: Stage 2 (Actual Addition/Subtraction)
    //==========================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tem_sum <= 72'b0;
            add_stage2_valid <= 1'b0;
        end
        else if (add_stage1_valid) begin
            case(add_case_d)
                2'b00: // index_res_d <= index_C, same sign
                    tem_sum <= align_d + {fraction_C, 48'b0};
                2'b01: // index_res_d <= index_C, different sign
                    if (fraction_C >= align_d[71:48])
                        tem_sum <= {fraction_C, 48'b0} - align_d;
                    else
                        tem_sum <= align_d - {fraction_C, 48'b0};
                2'b10: // index_res_d > index_C, same sign
                    tem_sum <= {fraction_res_d, 24'b0} + align_d;
                2'b11: // index_res_d > index_C, different sign
                    if (fraction_res_d[47:24] >= align_d[71:48])
                        tem_sum <= {fraction_res_d, 24'b0} - align_d;
                    else
                        tem_sum <= align_d - {fraction_res_d, 24'b0};
            endcase
            add_stage2_valid <= 1'b1;
        end
        else begin
            add_stage2_valid <= 1'b0;
        end
    end

    //==========================================
    //== Addition Pipeline: Stage 3 (Output Valid & Result Normalization)
    //==========================================
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            add_results <= 32'b0;
            add_valid <= 1'b0;
        end
        else if (add_stage2_valid) begin
            // 处理特殊值
            if (is_nan_c || is_nan_a || is_nan_b) begin
                add_results <= {1'b0, 8'hFF, 1'b1, 22'b0}; // NaN
            end
            else if (is_inf_c || is_inf_a || is_inf_b) begin
                add_results <= {sign_res, 8'hFF, 23'b0}; // Infinity
            end
            else begin
                case (add_case_d)
                    2'b00: // index_res_d <= index_C, same sign
                        if (tem_sum_d[71]) begin  // 有进位
                            add_results <= {sign_C, index_C + 8'd1, tem_sum_d[70:48]};
                        end
                        else if (tem_sum_d[70:48] == 0) begin  // 结果是0
                            add_results <= 32'b0;
                        end
                        else begin
                            add_results <= {sign_C, index_C, tem_sum_d[70:48]};
                        end
                    2'b01: // index_res_d <= index_C, different sign
                        if (fraction_C >= align_d[71:48])
                            add_results <= {sign_C, index_C, tem_sum_d[70:48]};
                        else
                            add_results <= {sign_res_d, index_C, tem_sum_d[70:48]};
                    2'b10: // index_res_d > index_C, same sign
                        if (tem_sum_d[71]) begin  // 有进位
                            add_results <= {sign_res_d, index_res_d + 8'd1, tem_sum_d[70:48]};
                        end
                        else if (tem_sum_d[70:48] == 0) begin  // 结果是0
                            add_results <= 32'b0;
                        end
                        else begin
                            add_results <= {sign_res_d, index_res_d, tem_sum_d[70:48]};
                        end
                    2'b11: // index_res_d > index_C, different sign
                        if (fraction_res_d[47:24] >= align_d[71:48])
                            add_results <= {sign_res_d, index_res_d, tem_sum_d[70:48]};
                        else
                            add_results <= {sign_C, index_res_d, tem_sum_d[70:48]};
                endcase
            end
            add_valid <= 1'b1;
        end
        else if (add_ack) begin
            add_valid <= 1'b0;
        end
    end

    //==========================================
    //== Addition Valid Hold Logic
    //==========================================
    // Holds the internal add_valid state until acknowledged
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            add_valid_hold <= 1'b0;
        end
        else if (add_valid) begin // If internal add becomes valid
            add_valid_hold <= 1'b1;
        end
        else if (add_ack) begin // If acknowledged
            add_valid_hold <= 1'b0;
        end
        // Otherwise, hold state persists
    end

    //==========================================
    //== Final Output Assignment for Add Valid
    //==========================================
    // Combine internal valid and hold signal for final output
    assign add_valid_out = add_valid || add_valid_hold;

endmodule