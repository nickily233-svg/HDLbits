module top_module #(
)(
input [32-1:0] a,
input [32-1:0] b,
input sub,
output [32-1:0] sum
);

wire [32-1:0] b_xor;
assign b_xor = b ^ {32{sub}};
wire cout1;

add16 u1_add16(
	.a(a[16-1:0]),
	.b(b_xor[16-1:0]),
	.cin(sub),
	.sum(sum[16-1:0]),
	.cout(cout1)
);

add16 u2_add16(
	.a(a[32-1:16]),
	.b(b_xor[32-1:16]),
	.cin(cout1),
	.sum(sum[32-1:16]),
	.cout()
);

endmodule

// sub module
module add16(
input [16-1:0] a,
input [16-1:0] b,
output [16-1:0] sum,
input cin,
output cout
);

assign {cout,sum} = a+b+cin;

endmodule