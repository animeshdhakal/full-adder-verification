class scoreboard;
  transaction trans;
  mailbox #(transaction) mon2scb;

  function new(mailbox #(transaction) mon2scb);
    this.mon2scb = mon2scb;
  endfunction

  task run();
    bit exp_sum;
    bit exp_carry;

    forever begin
      mon2scb.get(trans);

      exp_sum   = trans.a ^ trans.b ^ trans.c;
      exp_carry = (trans.a & trans.b) |
                  (trans.b & trans.c) |
                  (trans.a & trans.c);

      if (trans.sum === exp_sum && trans.carry === exp_carry) begin
        $display("[SCB PASS] a=%0b b=%0b c=%0b | sum=%0b carry=%0b",
                 trans.a, trans.b, trans.c, trans.sum, trans.carry);
      end
      else begin
        $display("[SCB FAIL] a=%0b b=%0b c=%0b | sum=%0b(exp=%0b) carry=%0b(exp=%0b)",
                 trans.a, trans.b, trans.c,
                 trans.sum, exp_sum,
                 trans.carry, exp_carry);
      end
    end
  endtask
endclass
