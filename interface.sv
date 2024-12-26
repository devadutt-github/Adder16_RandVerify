//-------------------------------------------------------------------------
//						www.verificationguide.com
//-------------------------------------------------------------------------
interface mem_intf(input logic clk,reset);
  
  //declaring the signals
  
  logic [15:0] A;
  logic [15:0] B;
  logic [16:0] C;
  
  
  //driver clocking block
  clocking driver_cb @(posedge clk);
    default input #1 output #1;
    output B;
    output A;
    input  C;  
  endclocking
  
 /* //monitor clocking block
  clocking monitor_cb @(posedge clk);
    default input #1 output #1;
    input addr;
    input wr_en;
    input rd_en;
    input wdata;
    input rdata;  
  endclocking */
  
  //driver modport
  modport DRIVER  (clocking driver_cb,input clk,reset);
  
  //monitor modport  
///  modport MONITOR (clocking monitor_cb,input clk,reset);
  
endinterface