//Transaction Class
class ram_trans extends uvm_sequence_item;
  `uvm_object_utils(ram_trans)
  rand logic clock; // not recommened 
  
  //Write Signals
  rand bit write_en;
  rand logic[31:0] write_addr;
  rand logic[31:0] write_data;
  
  //Read Signals
  rand bit read_en;
  rand logic[31:0] read_addr;
  logic[31:0] read_data;  //data is read and hence it must not be randomized
  
  //Contraints
  constraint valid_addr {write_addr != read_addr;}
  constraint valid_data {write_data inside {[1:409]};}
  constraint valid_en {{write_en,read_en} != 2'b00;}
endclass