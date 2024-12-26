//-------------------------------------------------------------------------
//						www.verificationguide.com 
//-------------------------------------------------------------------------
class transaction;
  //declaring the transaction items
  rand bit [15:0] A;
  rand bit [15:0] B;
  bit [16:0] C;
  
  //constaint, to generate any one among write and read
  //constraint wr_rd_c { wr_en != rd_en; }; 
  
  //postrandomize function, displaying randomized values of items 
  function void post_randomize();
    $display("--------- [Trans] post_randomize ------");
    $display("A = %0h || B = %0h",A,B);
    $display("-----------------------------------------");
  endfunction
  
  //deep copy method
  function transaction do_copy();
    transaction trans;
    trans = new();
    trans.A  = this.A;
    trans.B  = this.B;
    trans.C  = this.C;
    return trans;
  endfunction
endclass