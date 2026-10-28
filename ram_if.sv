//Interface
interface ram_if(input bit clock);
  bit write_en;
  bit read_en;
  logic[31:0] write_data;
  logic[31:0] read_data;
  logic[7:0] write_addr;
  logic[7:0] read_addr;
  
  //Clocking Block
  //used to provide the skews to eleminate the simulation race conditions between testbench and DUT
  // by scheluding the things in different regions
  
  clocking w_drv_cb @(posedge clock);
    default input #1 output #1;
    output write_en, write_addr, write_data;
  endclocking
  
  clocking r_drv_cb @(posedge clock);
    default input #1 output #1;
    input read_data;
    output read_en, read_addr;
  endclocking
  
  clocking w_mon_cb @(posedge clock);
    default input #1 output #1;
    input write_en, write_addr, write_data;
  endclocking
  
  clocking r_mon_cb @(posedge clock);
    default input #1 output #1;
    input read_en, read_addr, read_data;
  endclocking
  
  //Directions, Customization
  modport write_drv(clocking w_drv_cb);
  modport read_drv(clocking r_drv_cb);
  modport write_mon(clocking w_mon_cb);
  modport read_mon(clocking r_mon_cb);
    
  //modports: provide direction to the signals and customize the signals
  //customize signals: we can only include the necessary signals
endinterface