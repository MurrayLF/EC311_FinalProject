module lfsr (clk, rst, out);

  input clk;
  input rst;
  output reg [3:0] out;

  wire feedback;

  assign feedback = ~(out[3] ^ out[2]);

   always @(posedge clk or negedge rst) begin
       if(rst == 0) out <= 4'b1111;
       out = {out[2:0],feedback};
    end
endmodule