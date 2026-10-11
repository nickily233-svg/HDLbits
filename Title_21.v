module top_module ( 
	input a,
	input b,
	output out
);

wire a,b;
wire out;

// 模块实例化 
//.模块端口名(外部信号名)
mod_a u_mod_a(
	.in1(a),
	.in2(b),
	.out(out)
);

endmodule

// 子模块
module mod_a #(
)(
	input in1,
	input in2,
	output out
);
endmodule