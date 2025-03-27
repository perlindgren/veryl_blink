// top.sv
`timescale 1ns / 1ps

module top (
    input sysclk,
    output logic [3:0] led
);
  logic clk;
  logic [31:0] r_count;
  logic locked;

  always_comb begin

  end

  veryl_blink_Blink blink (
      .i_clk(clk),
      .o_led(led[1])
  );

  clk_wiz_0 clk_gen (
      // Clock in ports
      .clk_in1(sysclk),
      // Clock out ports
      .clk_out1(clk),
      // Status and control signals
      .reset(0),
      .locked
  );

  // clock divider
  always @(posedge clk) begin
    r_count <= r_count + 1;
    led[0]  <= r_count[22];
  end

endmodule
