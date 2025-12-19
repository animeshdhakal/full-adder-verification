class transaction;
  rand bit a;
  rand bit b;
  rand bit c;

  bit sum;
  bit carry;

  task display(string name);
    $display("[%0s] a=%0b  b=%0b  c=%0b  |  sum=%0b  carry=%0b  @ time=%0t",
              name, a, b, c, sum, carry, $time);
  endtask

endclass