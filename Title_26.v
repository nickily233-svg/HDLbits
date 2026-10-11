module top_module #(
)(
	input [32-1:0] a,
	input [32-1:0] b,
	output [32-1:0] sum 
);

// 用于连接低16位和高16位的桥梁
// 低16位的加法器产生的进位 传递给高16位加法器
wire cout_low;

add16 u1_add16_high(
	.a(a[32-1:16]),
	.b(b[32-1:16]),
	.cin(cout_low),
	.sum(sum[32-1:16]),
	.cout()
);

add16 u_add16_low(
	.a(a[16-1:0]),
	.b(b[16-1:0]),
	.cin(1'b0),
	.sum(sum[16-1:0]),
	.cout(cout_low)
);

endmodule

/**********/
module add16(
	input [16-1:0] a,
	input [16-1:0] b,
	input cin,
	output [16-1:0] sum,
	output cout
);

wire [16:0] c;

assign c[0] = cin;


genvar i;
generate
	for(i = 0;i < 16;i = i +1) : add1_loop
		add1 u_add1 (
			.a(a[i]),
			.b(b[i]),
			.cin(c[i]),
			.sum(sum[i]),
			.cout(c[i+1]),
		);
endgenerate

assign cout = c[16];

endmodule

/**********/
module add1(
	input a,
	input b,
	input cin,
	output sum,
	output cout
);

assign {cout,sum} = a+b+cin;

endmodule 