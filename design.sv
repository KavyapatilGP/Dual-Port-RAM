module dual_port_ram #(
  parameter ADDR_WIDTH = 8,
  parameter DATA_WIDTH = 32
)(
  input logic clock,
  
  //Write Port
  input logic write_en, // Control  
  input logic[ADDR_WIDTH-1:0] write_addr, // 8 bit 
  input logic[DATA_WIDTH-1:0] write_data, // 32 bit 
  
  //Read Port
  input logic read_en,
  input logic[ADDR_WIDTH-1:0] read_addr, 
  output logic[DATA_WIDTH-1:0] read_data
);
  
  //Memory Declaration
  logic[DATA_WIDTH-1:0] mem[0:(1<<ADDR_WIDTH)-1];
  // logic [31:0] mem [0:255];
  
  //Write Logic
  always_ff@(posedge clock) begin // sequential circuits
    if(write_en)
      mem[write_addr] <= write_data;
      
  end
  
  //Read Logic (Synchronous Read)
  always@(posedge clock) begin
    if(read_en)
      read_data <= mem[read_addr]; //logic : - reg , procedual statements wire not used - used for  physical connection between the blocks
  end
  
endmodule