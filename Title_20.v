module top_module #(
	parameter bw = 25 
)(
    input a, b, c, d, e,
    output reg [bw - 1:0] out
);

integer i,j;
wire [4:0] in = {a,b,c,d,e};
    
always @* begin
	for(i = 0;i < 5;i = i + 1) begin
		for(j = 0;j < 5;j = j + 1) begin
			out[24 - (i*5 + j)] = (in[4-j] == in[4 - j]) ? 1'b1 : 1'b0;
		end
	end
end

endmodule
