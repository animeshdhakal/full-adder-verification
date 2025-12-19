class driver;
  virtual full_adder_if vif;
  mailbox #(transaction) gen2drv;
  transaction trans;
  
  
  function new(virtual full_adder_if vif, mailbox #(transaction) gen2drv);
    this.gen2drv = gen2drv; 
    this.vif = vif;
  endfunction
  
  
  task run();
   forever begin 
     gen2drv.get(trans); 
     
     vif.a = trans.a;
     vif.b = trans.b;
     vif.c = trans.c;
     
     trans.display("Driver");
   end
  endtask
endclass