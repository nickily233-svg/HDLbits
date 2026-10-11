module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y
);

wire temp_1,temp_2,temp_3,temp_4,temp_5;

// left
assign temp_1 = p2a & p2b;
assign temp_2 = p2c & p2d;
assign p2y = temp_1 | temp_2;

// right
assign temp_3 = p1a & (p1c & p1b);
assign temp_4 = p1f & p1e & p1d;
assign p1y = temp_3 | temp_4;

// assign p1y = (p1a & (p1c & p1b)) | ((p1f & p1e) & p1d);
// assign p2y = (p2a & p2b) | (p2c & p2d)

endmodule
