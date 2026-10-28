class rsqr extends uvm_sequencer #(ram_trans);
  `uvm_component_utils(rsqr)
  
  function new(string name = "rdsqr",uvm_component parent);
    super.new(name,parent);
  endfunction
  
endclass