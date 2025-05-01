module floating_point_add_and_subtract (
    input               aclk,
    input   [31:0]      float0_data,   
    input   [31:0]      float1_data,     
    input               operation_sel,   // 0=¼Ó·¨, 1=¼õ·¨
    output  [31:0]      result_data,     
    output              result_valid     
);


wire s_axis_a_tvalid;
wire s_axis_b_tvalid;
wire s_axis_a_tready;
wire s_axis_b_tready;
wire [31:0] s_axis_a_tdata;
wire [31:0] s_axis_b_tdata;

wire s_axis_operation_tvalid;
wire s_axis_operation_tready;
wire [7:0]  s_axis_operation_tdata;

wire m_axis_result_tvalid;
wire m_axis_result_tready;
wire [31:0] m_axis_result_tdata;


assign s_axis_a_tvalid = 1'b1;
assign s_axis_b_tvalid = 1'b1;
assign s_axis_a_tdata  = float0_data;
assign s_axis_b_tdata  = float1_data;

assign s_axis_operation_tvalid = 1'b1;
assign s_axis_operation_tdata  = (operation_sel == 1'b0) ? 8'd0 : 8'd1;

assign m_axis_result_tready = 1'b1;
assign result_data    = m_axis_result_tdata;
assign result_valid   = m_axis_result_tvalid;


floating_point_add_and_sub floating_point_add_and_sub_inst (
  .aclk(aclk),
  .s_axis_a_tvalid(s_axis_a_tvalid),
  .s_axis_a_tready(s_axis_a_tready),
  .s_axis_a_tdata(s_axis_a_tdata),
  .s_axis_b_tvalid(s_axis_b_tvalid),
  .s_axis_b_tready(s_axis_b_tready),
  .s_axis_b_tdata(s_axis_b_tdata),
  .s_axis_operation_tvalid(s_axis_operation_tvalid),
  .s_axis_operation_tready(s_axis_operation_tready),
  .s_axis_operation_tdata(s_axis_operation_tdata),
  .m_axis_result_tvalid(m_axis_result_tvalid),
  .m_axis_result_tready(m_axis_result_tready),
  .m_axis_result_tdata(m_axis_result_tdata)
);

endmodule

