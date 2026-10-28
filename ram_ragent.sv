class ragent extends uvm_agent;
  `uvm_component_utils(ragent)
  
  rsqr r_sqr;
  rdrv r_drv;
  rmon r_mon;
  my_config cfg;
  
  function new(string name="ragent", uvm_component parent);
    super.new(name,parent);
  endfunction
  
 function void build_phase(uvm_phase phase);
    
    if(!uvm_config_db #(my_config)::get(this,"","my_config",cfg))
      
      `uvm_fatal("ragent","unable to get config. Have you set it?")
    
      r_mon = rmon::type_id::create("r_mon",this);
    
    if(cfg.is_active) begin
      r_drv = rdrv::type_id::create("r_drv",this);
      r_sqr = rsqr::type_id::create("r_sqr",this);
    end
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      
      if(cfg.is_active == UVM_ACTIVE)
        r_drv.seq_item_port.connect(r_sqr.seq_item_export);
        //seq_item_port from the driver
        //seq_item_export from the sequencer
  endfunction
  
endclass