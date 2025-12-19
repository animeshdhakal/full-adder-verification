module tb;
  full_adder_if intf();

  full_adder dut (
    .a     (intf.a),
    .b     (intf.b),
    .c     (intf.c),
    .sum   (intf.sum),
    .carry (intf.carry)
  );
  
  environment env;

  initial begin
    env = new(intf);
    env.run();
    #10;
    $finish;
  end
endmodule
