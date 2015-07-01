
with Interfaces.C; use Interfaces.C;

package Globals is

   function ec_master_count return unsigned;
   pragma Import (C, ec_master_count, "ec_master_count");
   
end Globals;
