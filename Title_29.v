module top_module #(
)(
input a,
input b,
output out_assign,
output reg out_alwaysblock
);

assign out_assign = (a & b);

always @* begin
		out_alwaysblock = (a & b);
end

// 只有再上升沿触发的写法才能被称为触发器FF,在仿真的时候才具有触发器的特性
endmodule