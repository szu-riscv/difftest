module RAMHelper_2r1w(
  input         clk,
  input         en,
  input  [63:0] rIdx_0,
  output [63:0] rdata_0,
  input  [63:0] rIdx_1,
  output [63:0] rdata_1,
  input  [63:0] wIdx,
  input  [63:0] wdata,
  input  [63:0] wmask,
  input         wen
);

  assign rdata_0 = ram_read_helper(en, rIdx_0);
  assign rdata_1 = ram_read_helper(en, rIdx_1);

  always @(posedge clk) begin
    ram_write_helper(wIdx, wdata, wmask, wen && en);
  end

endmodule
