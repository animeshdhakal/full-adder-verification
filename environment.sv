class environment;
  mailbox #(transaction) gen2drv; 
  mailbox #(transaction) mon2scb; 
  
  virtual full_adder_if vif;
  
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;
  
  
  function new(virtual full_adder_if vif);
    this.gen2drv = new();
    this.mon2scb = new();
    
    this.vif = vif;
    
    this.gen = new(gen2drv); 
    this.drv = new(vif, gen2drv); 
    this.mon = new(vif, mon2scb); 
    this.scb = new(mon2scb); 
  endfunction
  
  
  task run();
    fork
      gen.run(); 
      drv.run();
      mon.run();
      scb.run();
    join_any
  endtask
endclass