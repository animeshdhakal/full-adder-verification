class generator;
  mailbox #(transaction) gen2drv;
  transaction trans;


  function new(mailbox #(transaction) gen2drv);
    this.gen2drv = gen2drv; 
  endfunction


  task run();
    repeat(2) begin
      trans = new();
      void'(trans.randomize());
      
      trans.display("Generator");
      
      gen2drv.put(trans);
      
      #10;
    end
  endtask
endclass