//Write Sequencer class
class wsqr extends uvm_sequencer #(ram_trans);
  `uvm_component_utils(wsqr)
  
  function new(string name = "wsqr",uvm_component parent);
    super.new(name,parent);
  endfunction

  
endclass