
with System;
with Interfaces.C; use Interfaces.C;

package Globals is

   function ec_master_count return unsigned;
   pragma Import (C, ec_master_count, "ec_master_count");
   
   function ecrt_request_master_err (arg1 : unsigned) return System.Address;
   pragma Import (C, ecrt_request_master_err, "ecrt_request_master_err");

   
end Globals;
