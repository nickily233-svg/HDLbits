// 顶层模块
module top_module #(
)(
	input [32-1:16] a,
	input [32-1:16] b,
	output [32-1:16] sum
);

wire cout_low;
wire [16-1:0] sum_low;
wire [16-1:0] sum_high;
wire [16-1:0] sum_high_0;
wire [16-1:0] sum_high_1;

add16 u1_add16(
	.a(a[16-1:0]),
	.b(b[16-1:0]),
	.cin(1'b0),
	.sum(sum[16-1:0]),
	.cout(cout_low)
);
// 高16位 进位为0
add16 u2_add16(
	.a(a[32-1:16]),
	.b(b[32-1:16]),
	.cin(1'b0),
	.sum(sum_high_0),
	.cout()
);
// 高16位 进位为1
add16 u3_add16(
	.a(a[32-1:16]),
	.b(b[32-1:16]),
	.cin(1'b1),
	.sum(sum_high_1),
	.cout()
);

assign sum_high = (cout_low) ? sum_high_1 : sum_high_0;
assign sum = {sum_high,sum_low};

endmodule

// 子模块
module add16(
	input [16-1:0] a,
	input [16-1:0] b,
	input cin,
	output [16-1:0] sum,
	output cout
);

endmodule