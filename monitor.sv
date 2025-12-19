class monitor;
  transaction trans;
  
  mailbox #(transaction) mon2scb;
  virtual full_adder_if vif;
  
  function new(virtual full_adder_if vif, mailbox #(transaction) mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction
  
  task run();
    repeat(2) begin
      #1; 
      trans = new(); 
      trans.a = vif.a;
      trans.b = vif.b;
      trans.c = vif.c;
      
      trans.sum = vif.sum;
      trans.carry = vif.carry;
      
      mon2scb.put(trans);
      
      trans.display("Monitor");
      
      #10;
    end
  endtask
endclass