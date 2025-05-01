module floating_point_divide (
    input               aclk,
    input   [31:0]      float0_data,
    input   [31:0]      float1_data,
    output  [31:0]      div_data,
    output              float_valid
);


wire s_axis_a_tvalid;
wire s_axis_b_tvalid;
wire s_axis_a_tready;
wire s_axis_b_tready;
wire [31:0] s_axis_a_tdata;
wire [31:0] s_axis_b_tdata;

wire m_axis_result_tvalid;
wire m_axis_result_tready;
wire [31:0] m_axis_result_tdata;


assign s_axis_a_tvalid = 1'b1;
assign s_axis_b_tvalid = 1'b1;
assign s_axis_a_tdata  = float0_data;
assign s_axis_b_tdata  = float1_data;
assign m_axis_result_tready = 1'b1;

assign div_data    = m_axis_result_tdata;
assign float_valid = m_axis_result_tvalid;


floating_point_div u_div (
    .aclk(aclk),
    .s_axis_a_tvalid(s_axis_a_tvalid),
    .s_axis_a_tready(s_axis_a_tready),
    .s_axis_a_tdata(s_axis_a_tdata),
    .s_axis_b_tvalid(s_axis_b_tvalid),
    .s_axis_b_tready(s_axis_b_tready),
    .s_axis_b_tdata(s_axis_b_tdata),
    .m_axis_result_tvalid(m_axis_result_tvalid),
    .m_axis_result_tready(m_axis_result_tready),
    .m_axis_result_tdata(m_axis_result_tdata)
);

endmodule




        
